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

declare -a arr=("byte" "short" "int" "float" "double")
declare -a arrid=("b" "s" "i" "f" "d")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

echo "!Set FillValue in map using mask FillValue - NetCDF(i,j) ==========="

for k in {3..4}; do #lon, lat
for j in {0..4}; do
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$j]}-${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$i]}>)
subroutine setfvalue2d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}(mask, map, num)
  type (nc2d_${arr[$j]}_ll${arrid[$k]}) :: mask
  type (nc2d_${arr[$i]}_ll${arrid[$k]}) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}

"
done
done
done

echo "!Set FillValue in map using mask FillValue - NetCDF(i,j,k) ==========="

for l in {2..4}; do #time
for k in {3..4}; do #lon, lat
for j in {0..4}; do
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$j]}-${arr[$i]}> (lon <${arr[$k]}>, lat <${arr[$k]}>, time <${arr[$l]}>)
subroutine setfvalue3d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}(mask, map, num)
  type (nc2d_${arr[$j]}_ll${arrid[$k]}) :: mask
  type (nc3d_${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}

"
done
done
done
done

