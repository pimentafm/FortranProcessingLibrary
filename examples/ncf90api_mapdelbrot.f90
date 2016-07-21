!:=============================================================================
! This file is part of f90NetCDF API (Fortran 90 API for NetCDF).

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

!:=============================================================================
!About Author:
!Student of Surveying and Cartographic Engineering
! Federal University of Viçosa - Brazil

!Bachelor of Biosystems Engineer
! Federal University of São João del-Rei - Brazil

! Research Group on Atmosphere-Biosphere Interaction
! Federal University of Viçosa
! Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:=============================================================================

!:==================== A Very Simple Test Program =============================
program main
  use ncf90api
  implicit none
 
  type(nc2d_double_lld) :: map

  integer(kind = 4) :: i, j  

  real(kind=8) :: x_min, x_max, y_min, y_max, dx, dy
  
  character(200) :: outputpath

  outputpath = "/home/fernando/Documents/WORKSPACE/dadosTestef90netcdfapi/mapdelbrot.nc"

  map%varname = "fractal"
  map%long_name = "Map Fractal"
  map%lonname = "lon"
  map%latname = "lat"
  map%FillValue = -9999
  map%vartype = 6 !Verificar metodo para enviar o vartype para a função writegrid
  x_min = -75.0 
  x_max = -34.0
  y_min = -34.0
  y_max = 5.0

  map%nlons = 4800
  map%nlats = 4800

  write(*,*)double 
  write(*,*) float
  write(*,*) intgr
  write(*,*) short
  write(*,*) byte

  allocate(map%longitudes(map%nlons))
  allocate(map%latitudes(map%nlats))
  allocate(map%ncdata(map%nlons,map%nlats))
  
  map%ncdata = -9999

  write(*,*)map%varname
  write(*,*)map%long_name
  write(*,*)map%lonname
  write(*,*)map%latname
  write(*,*)map%FillValue
  write(*,*)map%nlons
  write(*,*)map%nlats

  dx = (x_max - x_min)/map%nlons
  dy = (y_max - y_min)/map%nlats

  map%longitudes = x_min
  do i = 1, map%nlons
    map%longitudes(i) = map%longitudes(i) + dx
  end do
  
  map%latitudes = y_min
  do j = 2, map%nlats
    map%latitudes(j) = map%latitudes(j) + dy
  end do

  do i = 1, map%nlons
    do j = 1, map%nlats
      map%ncdata(j,i) = (map%latitudes(j)*i-1.0)/(map%longitudes(i)+map%latitudes(j))
    end do
  end do
  
  call writegrid(outputpath, map)

end program main
