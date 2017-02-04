#!/bin/bash

echo "!:=============================================================================
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
declare -a ncarr=("nf90_byte" "nf90_short" "nf90_int" "nf90_float" "nf90_double")

# 2d datasets
for j in {3..4}; do # lon, lat 
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>)
subroutine gengrid2d_${arr[$i]}_ll${arrid[$j]}(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_${arr[$i]}_ll${arrid[$j]}) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  ${arr2[$j]} :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = ${ncarr[$i]}

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

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
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  ${arr2[$j]} :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = ${ncarr[$i]}

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

  idata%ncdata = idata%FillValue

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
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  ${arr2[$j]} :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = ${ncarr[$i]}

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

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}"
done
done
done
done
