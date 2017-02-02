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
subroutine griddims2d_${arr[$i]}_ll${arrid[$j]}(ifile, idata)
  type (nc2d_${arr[$i]}_ll${arrid[$j]}) :: idata
  integer(kind=intgr) :: ncid, varid, i
  character(*), intent(in) :: ifile
  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Inquire variable type and number of dimensions
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype, idata%ndims, idata%dims))
 
  allocate(idata%dimid(idata%ndims))
  allocate(idata%varids(idata%ndims))
  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimsize(idata%ndims)) 

  idata%dimname(1) = idata%lonname
  idata%dimname(2) = idata%latname
  
  !Get number of
  do i = 1, idata%ndims 
    call checkdimid(nf90_inq_dimid(ncid, idata%dimname(i), idata%dimid(i)), idata%dimname(i))
  end do

  call bubbleSort(idata%dimid, idata%dimname, idata%ndims)

  !Get dimension sizes
  do i = 1, idata%ndims
    call check(nf90_inquire_dimension(ncid, idata%dimid(i), idata%dimname(i), idata%dimsize(i)))
  end do

  !Get 
  do i = 1, idata%ndims
    call check(nf90_inq_varid(ncid, idata%dimname(i), idata%varids(i)))
    call check(nf90_get_att(ncid, idata%varids(i), "'"units"'", idata%dimunits(i)), idata%dimunits(i), ifile)
  end do 
  
  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."'"longitude"'".or.idata%dimname(i).eq."'"lon"'") then
      idata%nlons = idata%dimsize(i)
      idata%lonunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."'"latitude"'".or.idata%dimname(i).eq."'"lat"'") then
      idata%nlats = idata%dimsize(i)
      idata%latunits = idata%dimunits(i)
    end if
  end do

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine griddims2d_${arr[$i]}_ll${arrid[$j]}"
done
done

# 3d datasets
for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>)
subroutine griddims3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}(ifile, idata)
  type (nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}) :: idata 
  integer(kind=intgr) :: ncid, varid, i
  character(*), intent(in) :: ifile
  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Inquire variable type and number of dimensions
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype, idata%ndims, idata%dims))
 
  allocate(idata%dimid(idata%ndims))
  allocate(idata%varids(idata%ndims))
  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimsize(idata%ndims)) 

  idata%dimname(1) = idata%timename
  idata%dimname(2) = idata%lonname
  idata%dimname(3) = idata%latname
  
  !Get number of
  do i = 1, idata%ndims 
    call checkdimid(nf90_inq_dimid(ncid, idata%dimname(i), idata%dimid(i)), idata%dimname(i))
  end do

  call bubbleSort(idata%dimid, idata%dimname, idata%ndims)

  !Get dimension sizes
  do i = 1, idata%ndims
    call check(nf90_inquire_dimension(ncid, idata%dimid(i), idata%dimname(i), idata%dimsize(i)))
  end do

  !Get 
  do i = 1, idata%ndims
    call check(nf90_inq_varid(ncid, idata%dimname(i), idata%varids(i)))
    call check(nf90_get_att(ncid, idata%varids(i), "'"units"'", idata%dimunits(i)), idata%dimunits(i), ifile)
  end do 
  
  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."'"longitude"'".or.idata%dimname(i).eq."'"lon"'") then
      idata%nlons = idata%dimsize(i)
      idata%lonunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."'"latitude"'".or.idata%dimname(i).eq."'"lat"'") then
      idata%nlats = idata%dimsize(i)
      idata%latunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."'"time"'") then
      idata%ntimes = idata%dimsize(i)
      idata%timeunits = idata%dimunits(i)
    end if
  end do

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine griddims3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}"
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
subroutine griddims4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}(ifile, idata)
  type (nc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}) :: idata 
  integer(kind=intgr) :: ncid, varid, i
  character(*), intent(in) :: ifile
  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Inquire variable type and number of dimensions
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype, idata%ndims, idata%dims))
 
  allocate(idata%dimid(idata%ndims))
  allocate(idata%varids(idata%ndims))
  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimsize(idata%ndims)) 

  idata%dimname(1) = idata%levelname 
  idata%dimname(2) = idata%timename
  idata%dimname(3) = idata%lonname
  idata%dimname(4) = idata%latname
  
  !Get number of
  do i = 1, idata%ndims 
    call checkdimid(nf90_inq_dimid(ncid, idata%dimname(i), idata%dimid(i)), idata%dimname(i))
  end do

  call bubbleSort(idata%dimid, idata%dimname, idata%ndims)

  !Get dimension sizes
  do i = 1, idata%ndims
    call check(nf90_inquire_dimension(ncid, idata%dimid(i), idata%dimname(i), idata%dimsize(i)))
  end do

  !Get 
  do i = 1, idata%ndims
    call check(nf90_inq_varid(ncid, idata%dimname(i), idata%varids(i)))
    call check(nf90_get_att(ncid, idata%varids(i), "'"units"'", idata%dimunits(i)), idata%dimunits(i), ifile)
  end do 
  
  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."'"longitude"'".or.idata%dimname(i).eq."'"lon"'") then
      idata%nlons = idata%dimsize(i)
      idata%lonunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."'"latitude"'".or.idata%dimname(i).eq."'"lat"'") then
      idata%nlats = idata%dimsize(i)
      idata%latunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."'"time"'") then
      idata%ntimes = idata%dimsize(i)
      idata%timeunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."'"level"'") then
      idata%nlevels = idata%dimsize(i)
      idata%levelunits = idata%dimunits(i)
    end if
  end do

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine griddims4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}"
done
done
done
done
