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
! Demonstrates masking + zonal statistics (3D):
!   1. Reads cattle density data (3D: lon x lat x time, 1990-2012)
!   2. Applies a mask using brazil_UF to keep only Mato Grosso (UF=18)
!   3. Computes zonal statistics showing temporal evolution
!   4. Compares masked vs unmasked results
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program main
  use fpl
  implicit none

  ! Mask grid: UF codes (byte data, double coordinates)
  type(nc2d_byte_lld) :: mask

  ! Zone grid: same UF codes, used for zonal statistics
  type(nc2d_byte_lld) :: zones

  ! Data grid: cattle density (double data, double coordinates, int time)
  type(nc3d_double_lld_ti) :: cattle

  ! Number of zones (max IBGE UF code)
  integer(kind=intgr), parameter :: nzones = 28
  integer(kind=intgr), parameter :: uf_mato_grosso = 18

  ! Output arrays (nzones x ntimes)
  integer(kind=intgr), allocatable, dimension(:,:) :: zcount
  real(kind=double), allocatable, dimension(:,:) :: zmean, zmin, zmax, zsum, zvar

  ! UF names indexed by IBGE code
  character(len=20) :: uf_name(28)
  integer(kind=intgr) :: z, k
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

  ! --- Read mask grid (Brazilian states) ---
  mask%varname = "UF"
  mask%lonname = "lon"
  mask%latname = "lat"
  mask%varunits = "class"

  call readgrid("database/brazil_UF.nc", mask)

  ! --- Read zone grid (same file, separate variable for zonalStats) ---
  zones%varname = "UF"
  zones%lonname = "lon"
  zones%latname = "lat"
  zones%varunits = "class"

  call readgrid("database/brazil_UF.nc", zones)

  ! --- Read cattle density data (1990-2012) ---
  cattle%varname = "Cattle"
  cattle%lonname = "lon"
  cattle%latname = "lat"
  cattle%timename = "time"

  call readgrid("database/CATTLE19902012.nc", cattle)

  write(*,*) "Grid dimensions:", cattle%nlons, "x", cattle%nlats, "x", cattle%ntimes
  write(*,*) ""

  ! --- Allocate output arrays ---
  allocate(zcount(nzones, cattle%ntimes))
  allocate(zmean(nzones, cattle%ntimes))
  allocate(zmin(nzones, cattle%ntimes))
  allocate(zmax(nzones, cattle%ntimes))
  allocate(zsum(nzones, cattle%ntimes))
  allocate(zvar(nzones, cattle%ntimes))

  ! --- Step 1: Unmasked — show first and last year for all states ---
  call zonalStats(zones, cattle, nzones, zcount, zmean, zmin, zmax, zsum, zvar)

  write(*,'(a)') "======================================================================"
  write(*,'(a)') "  BEFORE masking — Cattle Mean Density (head/ha): 1990 vs 2012"
  write(*,'(a)') "======================================================================"
  write(*,'(a20, a14, a14)') "State", "Mean 1990", "Mean 2012"
  write(*,'(a)') "----------------------------------------------------------------------"

  do z = 1, nzones
    if (zcount(z,1) > 0 .and. len_trim(uf_name(z)) > 0) then
      write(*,'(a20, f14.4, f14.4)') &
        trim(uf_name(z)), zmean(z,1), zmean(z,cattle%ntimes)
    end if
  end do

  write(*,'(a)') "======================================================================"
  write(*,*) ""

  ! --- Step 2: Apply mask — keep only Mato Grosso (UF=18) ---
  write(*,'(a,i0,a)') " Applying mask: keeping only UF=", uf_mato_grosso, &
    " ("//trim(uf_name(uf_mato_grosso))//")"
  write(*,*) ""

  call setFillValue(mask, cattle, uf_mato_grosso)

  ! --- Step 3: Masked zonal statistics ---
  call zonalStats(zones, cattle, nzones, zcount, zmean, zmin, zmax, zsum, zvar)

  write(*,'(a)') "======================================================================"
  write(*,'(a)') "  AFTER masking — Cattle in Mato Grosso: Temporal Evolution (1990-2012)"
  write(*,'(a)') "======================================================================"
  write(*,'(a6, a10, a14, a14, a14, a14)') &
    "Year", "Pixels", "Mean", "Min", "Max", "Total"
  write(*,'(a)') "----------------------------------------------------------------------"

  z = uf_mato_grosso
  do k = 1, cattle%ntimes
    write(*,'(i6, i10, f14.4, f14.4, f14.4, f14.2)') &
      int(cattle%times(k)), zcount(z,k), zmean(z,k), zmin(z,k), zmax(z,k), zsum(z,k)
  end do

  write(*,'(a)') "======================================================================"

  ! --- Write CSV ---
  ofile = "database/zonalstats_cattle_masked_mt.csv"
  open(unit=10, file=trim(ofile), status='replace', action='write')
  write(10,'(a)') "state,year,pixels,mean,min,max,sum,var"

  do k = 1, cattle%ntimes
    write(10,'(a,",",i0,",",i0,",",es14.6,",",es14.6,",",es14.6,",",es14.6,",",es14.6)') &
      trim(uf_name(z)), int(cattle%times(k)), zcount(z,k), &
      zmean(z,k), zmin(z,k), zmax(z,k), zsum(z,k), zvar(z,k)
  end do

  close(10)
  write(*,*) "Results saved to: ", trim(ofile)

  ! --- Cleanup ---
  deallocate(zcount, zmean, zmin, zmax, zsum, zvar)
  call dealloc(mask)
  call dealloc(zones)
  call dealloc(cattle)

end program main
