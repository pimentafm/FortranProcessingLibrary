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
subroutine writegrid2d_${arr[$i]}_ll${arrid[$j]}(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_${arr[$i]}_ll${arrid[$j]}) :: odata
  integer(kind=intgr) :: ncid, varid, i

  !:=== Header file
  character(len=100), dimension(:), allocatable :: attribute, content
  integer(kind=4) :: nkeys
  nkeys = 0

  !Create Netcdf
  call check(nf90_create(ofile, nf90_hdf5, ncid))

  !Define dimensions
  do i = 1, odata%ndims
    call check(nf90_def_dim(ncid, odata%dimname(i), odata%dimsize(i), odata%dimid(i)))
    !Define variables
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_${arr[$j]}, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "'"units"'", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "'"long_name"'", odata%long_name))
  call check(nf90_put_att(ncid, varid, "'"_FillValue"'", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "'"valid_min"'", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "'"valid_max"'", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "'"units"'", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "'"History"'", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "'"NetCDF-Version"'", trim(nf90_inq_libvers())))
 
  !Check if headerfile was setted
  if(present(headerfile))then
    if(file_exists(headerfile))then !Check if headerfile exists
      call countkeys(headerfile, nkeys)!Count number of keys inside headerfile

      allocate(attribute(nkeys))
      allocate(content(nkeys))

      call readheader(headerfile, attribute, content) !Allocate the content of keys into arrays

      do nkeys = 1, size(attribute) !Put the attrubutes and contents into netcdf
        call check(nf90_put_att(ncid, nf90_global, attribute(nkeys), content(nkeys)))
      end do
    end if
  end if
  call check(nf90_enddef(ncid))

  !Write times, levels, lats and lons
  do i = 1, odata%ndims
    if(odata%dimname(i).eq."'"longitude"'".or.odata%dimname(i).eq."'"lon"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."'"latitude"'".or.odata%dimname(i).eq."'"lat"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_${arr[$i]}_ll${arrid[$j]}"
done
done

#3d datasets
for k in {2..4}; do # time
for j in {3..4}; do # lon,lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>)
subroutine writegrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}) :: odata
  integer(kind=intgr) :: ncid, varid, i

  !:=== Header file
  character(len=100), dimension(:), allocatable :: attribute, content
  integer(kind=4) :: nkeys
  nkeys = 0

  !Create Netcdf
  call check(nf90_create(ofile, nf90_hdf5, ncid))

  !Define dimensions

  do i = 1, odata%ndims
    call check(nf90_def_dim(ncid, odata%dimname(i), odata%dimsize(i), odata%dimid(i)))
  end do

  !Define variables
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_${arr[$j]}, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "'"units"'", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_${arr[$j]}, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "'"units"'", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_${arr[$k]}, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "'"units"'", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "'"long_name"'", odata%long_name))
  call check(nf90_put_att(ncid, varid, "'"_FillValue"'", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "'"valid_min"'", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "'"valid_max"'", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "'"units"'", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "'"History"'", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "'"NetCDF-Version"'", trim(nf90_inq_libvers())))
 
  !Check if headerfile was setted
  if(present(headerfile))then
    if(file_exists(headerfile))then !Check if headerfile exists
      call countkeys(headerfile, nkeys)!Count number of keys inside headerfile

      allocate(attribute(nkeys))
      allocate(content(nkeys))

      call readheader(headerfile, attribute, content) !Allocate the content of keys into arrays

      do nkeys = 1, size(attribute) !Put the attrubutes and contents into netcdf
        call check(nf90_put_att(ncid, nf90_global, attribute(nkeys), content(nkeys)))
      end do
    end if
  end if
  call check(nf90_enddef(ncid))

  !Write times, levels, lats and lons
  do i = 1, odata%ndims
    if(odata%dimname(i).eq."'"longitude"'".or.odata%dimname(i).eq."'"lon"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."'"latitude"'".or.odata%dimname(i).eq."'"lat"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."'"time"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}"
done
done
done

# 4d datasets 
for l in {2..3}; do # level
for k in {2..4}; do # time
for j in {3..4}; do # lon,lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>, level <${arr[$l]}>)
subroutine writegrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}) :: odata
  integer(kind=intgr) :: ncid, varid, i

  !:=== Header file
  character(len=100), dimension(:), allocatable :: attribute, content
  integer(kind=4) :: nkeys
  nkeys = 0

  !Create Netcdf
  call check(nf90_create(ofile, nf90_hdf5, ncid))

  !Define dimensions

  do i = 1, odata%ndims
    call check(nf90_def_dim(ncid, odata%dimname(i), odata%dimsize(i), odata%dimid(i)))
  end do

  !Define variables
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_${arr[$j]}, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "'"units"'", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_${arr[$j]}, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "'"units"'", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_${arr[$k]}, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "'"units"'", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_${arr[$l]}, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "'"units"'", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "'"long_name"'", odata%long_name))
  call check(nf90_put_att(ncid, varid, "'"_FillValue"'", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "'"valid_min"'", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "'"valid_max"'", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "'"units"'", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "'"History"'", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "'"NetCDF-Version"'", trim(nf90_inq_libvers())))
 
  !Check if headerfile was setted
  if(present(headerfile))then
    if(file_exists(headerfile))then !Check if headerfile exists
      call countkeys(headerfile, nkeys)!Count number of keys inside headerfile

      allocate(attribute(nkeys))
      allocate(content(nkeys))

      call readheader(headerfile, attribute, content) !Allocate the content of keys into arrays

      do nkeys = 1, size(attribute) !Put the attrubutes and contents into netcdf
        call check(nf90_put_att(ncid, nf90_global, attribute(nkeys), content(nkeys)))
      end do
    end if
  end if
  call check(nf90_enddef(ncid))

  !Write times, levels, lats and lons
  do i = 1, odata%ndims
    if(odata%dimname(i).eq."'"longitude"'".or.odata%dimname(i).eq."'"lon"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."'"latitude"'".or.odata%dimname(i).eq."'"lat"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."'"time"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."'"level"'") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}"
done
done
done
done
