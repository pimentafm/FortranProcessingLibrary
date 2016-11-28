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

declare -a arr=("byte" "short" "int" "float" "double")
declare -a arrid=("b" "s" "i" "f" "d")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

# 2d datasets
echo "!Set FillValue in map using mask FillValue - NetCDF(i,j) ==========="

for k in {3..4}; do # lon, lat
for j in {0..4}; do # mask datatype
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$j]}-${arr[$i]}> (lon <${arr[$k]}>, lat <${arr[$k]}>)
subroutine setfvalue2d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}(mask, map, num)
  type (nc2d_${arr[$j]}_ll${arrid[$k]}) :: mask
  type (nc2d_${arr[$i]}_ll${arrid[$k]}) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    !"'$omp'" parallel do private(i, j)
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
    !"'$omp'" end parallel do
  else
    !"'$omp'" parallel do private(i, j)
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
    !"'$omp'" end parallel do
  end if
end subroutine setfvalue2d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}"
done
done
done

# 3d datasets
echo "!Set FillValue in map using mask FillValue - NetCDF(i,j,k) ==========="

for l in {2..4}; do # time
for k in {3..4}; do # lon, lat
for j in {0..4}; do # mask datatype
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$j]}-${arr[$i]}> (lon <${arr[$k]}>, lat <${arr[$k]}>, time <${arr[$l]}>)
subroutine setfvalue3d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}(mask, map, num)
  type (nc2d_${arr[$j]}_ll${arrid[$k]}) :: mask
  type (nc3d_${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    !"'$omp'" parallel do private(k, i, j)
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
    !"'$omp'" end parallel do
  else
    !"'$omp'" parallel do private(k, i, j)
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
    !"'$omp'" end parallel do
  end if
end subroutine setfvalue3d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}"
done
done
done
done

# 4d datasets
echo "!Set FillValue in map using mask FillValue - NetCDF(i,j,k,l) ========="

for m in {2..3}; do # level
for l in {2..4}; do # time
for k in {3..4}; do # lon, lat
for j in {0..4}; do # mask datatype
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$j]}-${arr[$i]}> (lon <${arr[$k]}>, lat <${arr[$k]}>, time <${arr[$l]}>, level <${arr[$m]}>)
subroutine setfvalue4d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}_l${arrid[$m]}(mask, map, num)
  type (nc2d_${arr[$j]}_ll${arrid[$k]}) :: mask
  type (nc4d_${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}_l${arrid[$m]}) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k, l

  if(present(num))then
    !"'$omp'" parallel do private(l, k, i, j)
    do l = 1, map%nlevels
      do k = 1, map%ntimes
        do i = 1, mask%nlats
          do j = 1, mask%nlons
            if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k,l) = map%FillValue
            if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k,l).eq.map%FillValue) map%ncdata(i,j,k,l) = 0
          end do
        end do
      end do
    end do
    !"'$omp'" end parallel do
  else
    !"'$omp'" parallel do private(l, k, i, j)
    do l = 1, map%nlevels
      do k = 1, map%ntimes
        do i = 1, mask%nlats
          do j = 1, mask%nlons
            if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k,l) = map%FillValue
            if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k,l).eq.map%FillValue) map%ncdata(i,j,k,l) = 0
          end do
        end do
      end do
    end do
    !"'$omp'" end parallel do
  end if
end subroutine setfvalue4d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}_l${arrid[$m]}"
done
done
done
done
done
