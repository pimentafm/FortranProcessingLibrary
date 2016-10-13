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

# Suffixes for naming the type of the dimensions of file structures. 
# arrid -> prefixes for
#          b - byte
#          s - short
#          i - integer
#          f - float
#          d - double

# Suffixes for naming the type of the variable of file structures. 
# arr   -> byte   - byte
#          short  - short
#          int    - integer
#          float  - float
#          double - double

# Kind of the dataset and FIllValue
# arr2  -> integer(kind=byte)  - byte
#          integer(kind=short) - short
#          integer(kind=intgr) - integer
#          real(kind=float)    - float
#          real(kind=double)   - double

declare -a arrid=("b" "s" "i" "f" "d")
declare -a arr=("byte" "short" "int" "float" "double")
declare -a arrtype=("byte" "short" "intgr" "float" "double")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

# 2d datasets
for j in {3..4}; do # lon, lat 
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>)
subroutine gengrid2d_${arr[$i]}_ll${arrid[$j]}(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_${arr[$i]}_ll${arrid[$j]}) :: idata
  integer(kind=intgr) :: i
  ${arr2[$j]} :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))

  idata%vartype = ${arrtype[$i]}

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do
end subroutine gengrid2d_${arr[$i]}_ll${arrid[$j]}"
done
done

# 3d datasets
for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>)
subroutine gengrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}) :: idata
  integer(kind=intgr) :: i
  ${arr2[$j]} :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%ncdata(idata%nlons, idata%nlats, idata%ntimes))
  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  idata%vartype = ${arrtype[$i]}

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do
end subroutine gengrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}"
done
done
done

# 4d datasets
for l in {2..3}; do # level
for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>, level <${arr[$l]}>)
subroutine gengrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}) :: idata
  integer(kind=intgr) :: i
  ${arr2[$j]} :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%ncdata(idata%nlons, idata%nlats, idata%ntimes, idata%nlevels))
  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  idata%vartype = ${arrtype[$i]}

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do
end subroutine gengrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}"
done
done
done
done
