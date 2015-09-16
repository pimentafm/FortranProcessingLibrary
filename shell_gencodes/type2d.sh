#!/bin/bash

echo "!:========================================================================
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
!:========================================================================"

declare -a arr=("byte" "short" "int" "float" "double")
declare -a arr2=("integer(kind=C_SIGNED_CHAR)" "integer(kind=C_SHORT)" "integer(kind=C_INT)" "real(kind=C_FLOAT)" "real(kind=C_DOUBLE)")

for i in {0..4}; do
  echo "
!NetCDF(lon, lat) ${arr[$i]}
type :: nc2d_${arr[$i]}
  sequence
  character(len=20) :: varname, lonname, latname, long_name, units
  integer(kind=C_INT) :: nlons, nlats, vartype
  ${arr2[$i]} :: f_value
  real(kind=C_DOUBLE),dimension(:), allocatable :: longitudes, latitudes
  ${arr2[$i]}, dimension(:,:), allocatable ::  ncdata
end type nc2d_${arr[$i]}
"
done

