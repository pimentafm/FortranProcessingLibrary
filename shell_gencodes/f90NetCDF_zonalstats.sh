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

declare -a arr=("byte" "short" "int" "float" "double")
declare -a arrid=("b" "s" "i" "f" "d")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

echo "!Zonal Statistics ============================================================="

# 2d datasets
for i in {0..4}; do
for j in {0..4}; do
  echo "!NetCDF(i,j)-> ${arr[$i]}-${arr[$j]}
subroutine zonalstats_${arrid[$i]}${arrid[$j]}(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_${arr[$j]}), intent(in) :: mask
  type(nc2d_${arr[$i]}), intent(in) :: map
  type(zonal_${arr[$i]}) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')
    
    !:Count file line numbers -------------------------------------------------
    nlines = 0
    do
      read(100, *, end=101)
      nlines = nlines +1
    end do
101 continue
    rewind(100)

    allocate(zstats%zclass(nlines))
    allocate(zstats%zcount(nlines))
    allocate(zstats%zsum(nlines))
    allocate(zstats%zaverage(nlines))
    allocate(zstats%zmin(nlines))
    allocate(zstats%zmax(nlines))
    allocate(zstats%zstdeviation(nlines))
    allocate(zstats%zvariance(nlines))

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do
    
    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do
      
      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
  else
    nlines = 1
    allocate(zstats%zclass(nlines))
    allocate(zstats%zcount(nlines))
    allocate(zstats%zsum(nlines))
    allocate(zstats%zaverage(nlines))
    allocate(zstats%zmin(nlines))
    allocate(zstats%zmax(nlines))
    allocate(zstats%zstdeviation(nlines))
    allocate(zstats%zvariance(nlines))
    
    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0
    
    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"'"Class"'", "'"Count"'", "'"Sum"'", "'"Average"'", "'"Min"'", "'"Max"'", "'"Standard Deviation"'"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_${arrid[$i]}${arrid[$j]}
"
done
done

