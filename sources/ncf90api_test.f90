!:========================================================================
! This file is part of f90NetCDF API (Fortran 90 API for Netcdf).

! Copyright (C) 2015 Fernando Martins Pimenta

! f90NetCDF API is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! f90NetCDF API is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with f90NetCDF.  If not, see <http://www.gnu.org/licenses/>.

!:========================================================================
!About Author:
!Student of Surveying and Cartographic Engineering
! Federal University of Viçosa - Brazil

!Bachelor of Biosystems Engineer
! Federal University of São João del-Rei - Brazil

! Research Group on Atmosphere-Biosphere Interaction
! Federal University of Viçosa
! Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:========================================================================

!:==================== A Very Simple Test Program ========================
program main
  use ncf90api
  implicit none

  type (nc2d_double) :: nc

  integer*4 :: i, j

  character(100) :: ncfile, outfile

  ncfile = "/home/fernando/Documents/dados_nc_test/LUPASTNAT2012v3.nc"
  outfile = "/home/fernando/Documents/dados_nc_test/out_lu.nc"

  nc%varname = "landuse"
  nc%lonname = "lon"
  nc%latname = "lat"
  nc%long_name = "nome do mapa"

  !call ncoords(ncfile, nc)

  call readgrid(ncfile, nc)
!  do i = 1, nc%nlats
!    do j = 1, nc%nlons
!      if(nc%ncdata(i,j).ne.0) then
!        write(*,*)i, j, nc%ncdata(i,j)
!        nc%ncdata(i,j) = nc%ncdata(i,j) * cos(2.4) !nf90_fill_float !
!        write(*,*)i, j, nc%ncdata(i,j)
!      end if
!    end do
!  end do

  call writegrid(outfile, nc)

  !write(*,*)"NC INFO-------------------------"
  !write(*,*)"nc->long_name ", nc%long_name
  !write(*,*)"nc->lonname   ", nc%lonname
  !write(*,*)"nc->latname   ", nc%latname
  !write(*,*)"nc->varname   ", nc%varname
  !write(*,*)"nc->nlons     ", nc%nlons
  !write(*,*)"nc->nlats     ", nc%nlats
  !write(*,*)"nc->vartype   ", nc%vartype, "-> 6_d, 5_f, 4_i, 3_s, 1_b"
  !write(*,*)" "
  !write(*,*)"nc->varunits  ",nc%varunits
  !write(*,*)"nc->lonunits  ",nc%lonunits
  !write(*,*)"nc->latunits  ",nc%latunits
  !write(*,*)"nc->f_value   ",nc%f_value
  !write(*,*)" "

  !write(*,*)"KIND INFO-----------------------"
  !write(*,*)"DOUBLE->:     ", C_DOUBLE
  !write(*,*)"INT->:        ",C_INT
  !write(*,*)"FLOAT->:      ",C_FLOAT
  !write(*,*)"SHORT->:      ",C_SHORT
  !write(*,*)"BYTE->:       ",C_SIGNED_CHAR

  !write(*,*)" "

  !write(*,*)"FILL INFO-----------------------"
  !write(*,*)"Byte:         ", nf90_fill_byte
  !write(*,*)"Short:        ", nf90_fill_short
  !write(*,*)"Integer:      ", nf90_fill_int
  !write(*,*)"Float:        ", nf90_fill_float
  !write(*,*)"Double:       ", nf90_fill_double

  !write(*,*)"Pi: ",pi
  !write(*,*)"Earth Radius: ",earth_radius
  !write(*,*)"Acceleration of Gravity: ",acc_gravity
  !write(*,*)"Boltzman: ",boltzman
end program main
