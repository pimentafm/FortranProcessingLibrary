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
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

# 2d datasets
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>)
subroutine readgrid2d_${arr[$i]}_ll${arrid[$j]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_${arr[$i]}_ll${arrid[$j]}) :: idata

  integer(kind=intgr) :: ncid, varid, i

  call griddims(ifile, idata)

  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  allocate(idata%ncdata(idata%dimsize(idata%dims(1)), idata%dimsize(idata%dims(2))))
  
  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."'"longitude"'".or.idata%dimname(i).eq."'"lon"'")then
      call check(nf90_get_var(ncid, idata%varids(i), idata%longitudes))
      idata%lonunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."'"latitude"'".or.idata%dimname(i).eq."'"lat"'") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%latitudes))
      idata%latunits = idata%dimunits(i)
    end if
  end do
 
  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'$(tr [a-z] [A-Z] <<< ${arr[$i]})'"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_${arr[$i]}_ll${arrid[$j]}"
done
done

# 3d datasets
for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>)
subroutine readgrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}) :: idata

  integer(kind=intgr) :: ncid, varid, i

  call griddims(ifile, idata)

  allocate(idata%times(idata%ntimes))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  allocate(idata%ncdata(idata%dimsize(idata%dims(1)), idata%dimsize(idata%dims(2)), & 
           idata%dimsize(idata%dims(3))))
  
  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."'"longitude"'".or.idata%dimname(i).eq."'"lon"'")then
      call check(nf90_get_var(ncid, idata%varids(i), idata%longitudes))
      idata%lonunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."'"latitude"'".or.idata%dimname(i).eq."'"lat"'") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%latitudes))
      idata%latunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."'"time"'") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%times))
      idata%timeunits = idata%dimunits(i)
    end if
  end do
 
  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'$(tr [a-z] [A-Z] <<< ${arr[$i]})'"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}"
done
done
done

# 4d datasets
for l in {2..3}; do # level
for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}, level <${arr[$l]}>)
subroutine readgrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}) :: idata

  integer(kind=intgr) :: ncid, varid, i

  call griddims(ifile, idata)

  allocate(idata%levels(idata%nlevels))
  allocate(idata%times(idata%ntimes))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  allocate(idata%ncdata(idata%dimsize(idata%dims(1)), idata%dimsize(idata%dims(2)), & 
           idata%dimsize(idata%dims(3)), idata%dimsize(idata%dims(4))))
  
  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."'"longitude"'".or.idata%dimname(i).eq."'"lon"'")then
      call check(nf90_get_var(ncid, idata%varids(i), idata%longitudes))
      idata%lonunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."'"latitude"'".or.idata%dimname(i).eq."'"lat"'") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%latitudes))
      idata%latunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."'"time"'") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%times))
      idata%timeunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."'"level"'") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%levels))
      idata%levelunits = idata%dimunits(i)
    end if
  end do
 
  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'$(tr [a-z] [A-Z] <<< ${arr[$i]})'"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}"
done
done
done
done
