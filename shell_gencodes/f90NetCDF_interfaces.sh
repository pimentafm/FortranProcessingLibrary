#!/bin/bash

echo "!:=============================================================================
! This file is part of f90NetCDF (Fortran 90 API for NetCDF).

! Copyright (C) 2015 Fernando Martins Pimenta

! f90NetCDF is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! f90NetCDF is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with f90NetCDF.  If not, see <http://www.gnu.org/licenses/>.

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
declare -a arr2=("integer(kind=C_SIGNED_CHAR)" "integer(kind=C_SHORT)" "integer(kind=C_INT)" "real(kind=C_FLOAT)" "real(kind=C_DOUBLE)")

echo "
interface check
  module procedure checkerror, checktype, checkatt
end interface check"

#NCOORDS
echo "
interface griddims
  module procedure" 
for j in {3..4}; do # 2d datasets lon, lat
  for i in {0..4}; do 
    echo "                griddims2d_${arr[$i]}_ll${arrid[$j]}, &" #16 spaces
  done
done
for k in {2..4}; do # 3d datasets time
  for j in {3..4}; do # lon, lat
    for i in {0..4}; do 
      echo "                griddims3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}, &"
    done
  done
done
for l in {2..3}; do # 4d datasets level
  for k in {2..4}; do # time
    for j in {3..4}; do # lon, lat
      for i in {0..4}; do 
        echo "                griddims4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}, &"
      done
    done
  done
done
echo "end interface griddims"

#READGRID
echo "
interface readgrid
  module procedure" 
for j in {3..4}; do # 2d datasets lon, lat
  for i in {0..4}; do 
    echo "                readgrid2d_${arr[$i]}_ll${arrid[$j]}, &"
  done
done
for k in {2..4}; do # 3d datasets time
  for j in {3..4}; do # lon, lat
    for i in {0..4}; do 
      echo "                readgrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}, &"
    done
  done
done
for l in {2..3}; do # 4d datasets level
  for k in {2..4}; do # time
    for j in {3..4}; do # lon, lat
      for i in {0..4}; do 
        echo "                readgrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}, &"
      done
    done
  done
done
echo "end interface readgrid"

#WRITEGRID
echo "
interface writegrid
  module procedure" 
for j in {3..4}; do # 2d datasets lon , lat
  for i in {0..4}; do 
    echo "                writegrid2d_${arr[$i]}_ll${arrid[$j]}, &"
  done
done
for k in {2..4}; do # 3d datasets time
  for j in {3..4}; do # lon, lat
    for i in {0..4}; do 
      echo "                writegrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}, &"
    done
  done
done
for l in {2..3}; do # 4d datasets level
  for k in {2..4}; do # time
    for j in {3..4}; do # lon, lat
      for i in {0..4}; do 
        echo "                writegrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}, &"
      done
    done
  done
done
echo "end interface writegrid"

#SETFVALUE
echo "
interface setFillValue
  module procedure"
for k in {3..4}; do # 2d datasets lon, lat
  for j in {0..4}; do
    for i in {0..4}; do 
      echo "                setfvalue2d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}, &"
    done
  done
done
for l in {2..4}; do # 3d datasets time
  for k in {3..4}; do # lon, lat
    for j in {0..4}; do 
      for i in {0..4}; do 
        echo "                setfvalue3d_${arr[$j]}${arr[$i]}_ll${arrid[$k]}_t${arrid[$l]}, &"
      done
    done
  done
done
for l in {2..3}; do # 4d datasets level
  for k in {2..4}; do # time
    for j in {3..4}; do # lon, lat
      for i in {0..4}; do # datatypes
        for h in {0..4}; do
          echo "                setfvalue4d_${arr[$h]}${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}, &"
        done
      done
    done
  done
done
echo "end interface setFillValue"

#GENGRID
echo "
interface gengrid
  module procedure" 
for j in {3..4}; do # 2d datasets lon, lat
  for i in {0..4}; do 
    echo "                gengrid2d_${arr[$i]}_ll${arrid[$j]}, &" #16 spaces
  done
done
for k in {2..4}; do # 3d datasets time
  for j in {3..4}; do # lon, lat
    for i in {0..4}; do 
      echo "                gengrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}, &"
    done
  done
done
for l in {2..3}; do # 4d datasets level
  for k in {2..4}; do # time
    for j in {3..4}; do # lon, lat
      for i in {0..4}; do 
        echo "                gengrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}, &"
      done
    done
  done
done
echo "end interface gengrid"

#DEALLOC
echo "
interface dealloc
  module procedure" 
for j in {3..4}; do # 2d datasets lon, lat
  for i in {0..4}; do 
    echo "                dealloc2d_${arr[$i]}_ll${arrid[$j]}, &" #16 spaces
  done
done
for k in {2..4}; do # 3d datasets time
  for j in {3..4}; do # lon, lat
    for i in {0..4}; do 
      echo "                dealloc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}, &"
    done
  done
done
for l in {2..3}; do # 4d datasets level
  for k in {2..4}; do # time
    for j in {3..4}; do # lon, lat
      for i in {0..4}; do 
        echo "                dealloc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}, &"
      done
    done
  done
done
echo "end interface dealloc"
