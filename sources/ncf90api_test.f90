!:========================================================================
! This file is part of f90NetCDF API (NetCDF API for Fortran 90).

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

!:==================== A Very Simple Text Program ========================
program main
  use ncf90api
  implicit none

  type (nc2d_float) :: nc

  integer*4 :: i, j

  character(100) :: ncfile, outfile
  ncfile = "/home/fernando/Documents/dados_nc_test/LU1940v3.nc"
  outfile = "/home/fernando/Documents/dados_nc_test/outLU.nc"
  nc%varname = "landuse"
  nc%lonname = "lon"
  nc%latname = "lat"
  nc%long_name = "nome do mapa"
  nc%units = "km²"

  call ncoords(ncfile, nc)

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

  write(*,*)"nc->long_name ", nc%long_name
  write(*,*)"nc->lonname ",nc%lonname
  write(*,*)"nc->latname ",nc%latname
  write(*,*)"nc->varname ",nc%varname
  write(*,*)"nc->vartype ",nc%vartype
  write(*,*)"nc->f_value ",nc%f_value
  write(*,*)"nc->units ",nc%units

  write(*,*)"DOUBLE->: ", C_DOUBLE
  write(*,*)"INT->:    ",C_INT
  write(*,*)"FLOAT->:  ",C_FLOAT
  write(*,*)"SHORT->:  ",C_SHORT
  write(*,*)"BYTE->:   ",C_SIGNED_CHAR
  !write(*,*) "lon: ", nc%nlons, "lat: ", nc%nlats

  !write(*,*)nf90_fill_int, nf90_fill_real

  !write(*,*)"Pi: ",pi
  !write(*,*)"Earth Radius: ",earth_radius
  !write(*,*)"Acceleration of Gravity: ",acc_gravity
  !write(*,*)"Boltzman: ",boltzman
  !write(*,*)"VarType: ",nc%vartype
end program main
