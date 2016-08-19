#!/bin/bash

echo "!:=============================================================================
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
!:============================================================================="

#Suffixes for naming the type of the dimensions of file structures. 
# arrid -> prefixes for
#          b - byte
#          s - short
#          i - integer
#          f - float
#          d - double

#Suffixes for naming the type of the variable of file structures. 
#arr   -> byte   - byte
#         short  - short
#         int    - integer
#         float  - float
#         double - double

#Kind of the dataset and FIllValue
#arr2  -> integer(kind=byte)  - byte
#         integer(kind=short) - short
#         integer(kind=intgr) - integer
#         real(kind=float)    - float
#         real(kind=double)   - double
       
declare -a arrid=("b" "s" "i" "f" "d")
declare -a arr=("byte" "short" "int" "float" "double")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

for j in {3..4};do # lon, lat
for i in {0..4};do
  echo "
!NetCDF(lon, lat) ${arr[$i]}

type :: nc2d_${arr[$i]}_ll${arrid[$j]}
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  ${arr2[$i]} :: FillValue
  real(kind=${arr[$j]}), dimension(:), allocatable :: longitudes, latitudes
  ${arr2[$i]}, dimension(:,:), allocatable :: ncdata
end type nc2d_${arr[$i]}_ll${arrid[$j]}"
done
done

for k in {2..4};do # time
for j in {3..4};do # lon, lat
for i in {0..4};do
  echo "
!NetCDF(lon, lat, time) ${arr[$i]}
type :: nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  ${arr2[$i]} :: FillValue
  ${arr2[$k]}, dimension(:), allocatable :: times
  real(kind=${arr[$j]}), dimension(:), allocatable :: longitudes, latitudes
  ${arr2[$i]}, dimension(:,:,:), allocatable :: ncdata
end type nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}"
done
done
done

for l in {2..3};do # level
for k in {2..4};do # time
for j in {3..4};do # lon, lat
for i in {0..4};do
  echo "
!NetCDF(lon, lat, time, level) ${arr[$i]}
type :: nc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}

  sequence
  character(len=100) :: varname, timename, lonname, latname, levelname, &
                        long_name, varunits, lonunits, latunits, &
                        levelunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  ${arr2[$i]} :: FillValue
  ${arr2[$k]}, dimension(:), allocatable :: times, levels
  real(kind=${arr[$j]}), dimension(:), allocatable :: longitudes, latitudes
  ${arr2[$i]}, dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}"
done
done
done
done

