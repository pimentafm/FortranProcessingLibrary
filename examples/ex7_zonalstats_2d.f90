!:=============================================================================
! This file is part of FPL (Fortran Processing Library).

! Copyright (C) 2015 Fernando Martins Pimenta

! FPL is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! FPL is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with FPL.  If not, see <http://www.gnu.org/licenses/>.

!:=============================================================================
! About Author:
! Fernando Martins Pimenta
!  Student of Surveying and Cartographic Engineering
!  Federal University of Viçosa - Brazil

!  Bachelor of Biosystems Engineer
!  Federal University of São João del-Rei - Brazil

!  Research Group on Atmosphere-Biosphere Interaction
!  Federal University of Viçosa
!  Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:=============================================================================

!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Computes zonal statistics of soybean land use area (2D) grouped by
! Brazilian states (UF) using the zonalStats subroutine.
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program main
  use fpl
  implicit none

  ! Zone grid: UF codes (byte data, double coordinates)
  type(nc2d_byte_lld) :: zones

  ! Data grid: soybean land use (double data, double coordinates)
  type(nc2d_double_lld) :: soja

  ! Number of zones (max IBGE UF code)
  integer(kind=intgr), parameter :: nzones = 28

  ! Output arrays
  integer(kind=intgr), dimension(nzones) :: zcount
  real(kind=double), dimension(nzones) :: zmean, zmin, zmax, zsum, zvar

  ! UF names indexed by IBGE code
  character(len=20) :: uf_name(28)
  integer(kind=intgr) :: z
  character(len=100) :: ofile

  ! IBGE UF names
  uf_name = ""
  uf_name(17) = "Tocantins"
  uf_name(18) = "Mato Grosso"
  uf_name(19) = "Goias"
  uf_name(20) = "Mato Grosso do Sul"
  uf_name(21) = "Maranhao"
  uf_name(22) = "Piaui"
  uf_name(25) = "Paraiba"
  uf_name(26) = "Pernambuco"
  uf_name(27) = "Alagoas"
  uf_name(28) = "Sergipe"
  uf_name(8)  = "Distrito Federal"

  ! --- Read zone grid (Brazilian states) ---
  zones%varname = "UF"
  zones%lonname = "lon"
  zones%latname = "lat"
  zones%varunits = "class"

  call readgrid("database/brazil_UF.nc", zones)

  write(*,*) "Zone grid loaded:", zones%nlons, "x", zones%nlats

  ! --- Read soybean land use data (year 2012) ---
  soja%varname = "landuse"
  soja%lonname = "lon"
  soja%latname = "lat"

  call readgrid("database/LUCULTSOJA2012.nc", soja)

  write(*,*) "Soybean grid loaded:", soja%nlons, "x", soja%nlats
  write(*,*) "FillValue:", soja%FillValue
  write(*,*) ""

  ! --- Compute zonal statistics ---
  call zonalStats(zones, soja, nzones, zcount, zmean, zmin, zmax, zsum, zvar)

  ! --- Print results ---
  write(*,'(a)') "======================================================================"
  write(*,'(a)') "  Soybean Land Use Statistics by Brazilian State (2012)"
  write(*,'(a)') "======================================================================"
  write(*,'(a20, a10, a12, a12, a12, a14)') &
    "State", "Pixels", "Mean (ha)", "Min (ha)", "Max (ha)", "Total (ha)"
  write(*,'(a)') "----------------------------------------------------------------------"

  do z = 1, nzones
    if (zcount(z) > 0 .and. len_trim(uf_name(z)) > 0) then
      write(*,'(a20, i10, f12.2, f12.2, f12.2, f14.2)') &
        trim(uf_name(z)), zcount(z), zmean(z), zmin(z), zmax(z), zsum(z)
    end if
  end do

  write(*,'(a)') "======================================================================"

  ! --- Write CSV ---
  ofile = "database/zonalstats_soja_2012.csv"
  open(unit=10, file=trim(ofile), status='replace', action='write')
  write(10,'(a)') "state,pixels,mean_ha,min_ha,max_ha,sum_ha,var"

  do z = 1, nzones
    if (zcount(z) > 0 .and. len_trim(uf_name(z)) > 0) then
      write(10,'(a,",",i0,",",es14.6,",",es14.6,",",es14.6,",",es14.6,",",es14.6)') &
        trim(uf_name(z)), zcount(z), zmean(z), zmin(z), zmax(z), zsum(z), zvar(z)
    end if
  end do

  close(10)
  write(*,*) "Results saved to: ", trim(ofile)

  ! --- Cleanup ---
  call dealloc(zones)
  call dealloc(soja)

end program main
