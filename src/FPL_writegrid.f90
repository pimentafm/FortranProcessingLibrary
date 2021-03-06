!:=============================================================================
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
!:=============================================================================

!NetCDF <var byte> (lon <float>, lat <float>)
subroutine writegrid2d_byte_llf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_byte_llf) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_float, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_byte_llf

!NetCDF <var short> (lon <float>, lat <float>)
subroutine writegrid2d_short_llf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_short_llf) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_float, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_short_llf

!NetCDF <var int> (lon <float>, lat <float>)
subroutine writegrid2d_int_llf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_int_llf) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_float, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_int_llf

!NetCDF <var float> (lon <float>, lat <float>)
subroutine writegrid2d_float_llf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_float_llf) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_float, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_float_llf

!NetCDF <var double> (lon <float>, lat <float>)
subroutine writegrid2d_double_llf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_double_llf) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_float, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_double_llf

!NetCDF <var byte> (lon <double>, lat <double>)
subroutine writegrid2d_byte_lld(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_byte_lld) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_double, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_byte_lld

!NetCDF <var short> (lon <double>, lat <double>)
subroutine writegrid2d_short_lld(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_short_lld) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_double, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_short_lld

!NetCDF <var int> (lon <double>, lat <double>)
subroutine writegrid2d_int_lld(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_int_lld) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_double, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_int_lld

!NetCDF <var float> (lon <double>, lat <double>)
subroutine writegrid2d_float_lld(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_float_lld) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_double, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_float_lld

!NetCDF <var double> (lon <double>, lat <double>)
subroutine writegrid2d_double_lld(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc2d_double_lld) :: odata
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
    call check(nf90_def_var(ncid, odata%dimname(i), nf90_double, odata%dimid(i), odata%varids(i)))
    call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
  end do

  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid2d_double_lld

!NetCDF <var byte> (lon <float>, lat <float>, time <int>)
subroutine writegrid3d_byte_llf_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_byte_llf_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_byte_llf_ti

!NetCDF <var short> (lon <float>, lat <float>, time <int>)
subroutine writegrid3d_short_llf_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_short_llf_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_short_llf_ti

!NetCDF <var int> (lon <float>, lat <float>, time <int>)
subroutine writegrid3d_int_llf_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_int_llf_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_int_llf_ti

!NetCDF <var float> (lon <float>, lat <float>, time <int>)
subroutine writegrid3d_float_llf_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_float_llf_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_float_llf_ti

!NetCDF <var double> (lon <float>, lat <float>, time <int>)
subroutine writegrid3d_double_llf_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_double_llf_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_double_llf_ti

!NetCDF <var byte> (lon <double>, lat <double>, time <int>)
subroutine writegrid3d_byte_lld_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_byte_lld_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_byte_lld_ti

!NetCDF <var short> (lon <double>, lat <double>, time <int>)
subroutine writegrid3d_short_lld_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_short_lld_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_short_lld_ti

!NetCDF <var int> (lon <double>, lat <double>, time <int>)
subroutine writegrid3d_int_lld_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_int_lld_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_int_lld_ti

!NetCDF <var float> (lon <double>, lat <double>, time <int>)
subroutine writegrid3d_float_lld_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_float_lld_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_float_lld_ti

!NetCDF <var double> (lon <double>, lat <double>, time <int>)
subroutine writegrid3d_double_lld_ti(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_double_lld_ti) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_double_lld_ti

!NetCDF <var byte> (lon <float>, lat <float>, time <float>)
subroutine writegrid3d_byte_llf_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_byte_llf_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_byte_llf_tf

!NetCDF <var short> (lon <float>, lat <float>, time <float>)
subroutine writegrid3d_short_llf_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_short_llf_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_short_llf_tf

!NetCDF <var int> (lon <float>, lat <float>, time <float>)
subroutine writegrid3d_int_llf_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_int_llf_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_int_llf_tf

!NetCDF <var float> (lon <float>, lat <float>, time <float>)
subroutine writegrid3d_float_llf_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_float_llf_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_float_llf_tf

!NetCDF <var double> (lon <float>, lat <float>, time <float>)
subroutine writegrid3d_double_llf_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_double_llf_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_double_llf_tf

!NetCDF <var byte> (lon <double>, lat <double>, time <float>)
subroutine writegrid3d_byte_lld_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_byte_lld_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_byte_lld_tf

!NetCDF <var short> (lon <double>, lat <double>, time <float>)
subroutine writegrid3d_short_lld_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_short_lld_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_short_lld_tf

!NetCDF <var int> (lon <double>, lat <double>, time <float>)
subroutine writegrid3d_int_lld_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_int_lld_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_int_lld_tf

!NetCDF <var float> (lon <double>, lat <double>, time <float>)
subroutine writegrid3d_float_lld_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_float_lld_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_float_lld_tf

!NetCDF <var double> (lon <double>, lat <double>, time <float>)
subroutine writegrid3d_double_lld_tf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_double_lld_tf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_double_lld_tf

!NetCDF <var byte> (lon <float>, lat <float>, time <double>)
subroutine writegrid3d_byte_llf_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_byte_llf_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_byte_llf_td

!NetCDF <var short> (lon <float>, lat <float>, time <double>)
subroutine writegrid3d_short_llf_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_short_llf_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_short_llf_td

!NetCDF <var int> (lon <float>, lat <float>, time <double>)
subroutine writegrid3d_int_llf_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_int_llf_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_int_llf_td

!NetCDF <var float> (lon <float>, lat <float>, time <double>)
subroutine writegrid3d_float_llf_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_float_llf_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_float_llf_td

!NetCDF <var double> (lon <float>, lat <float>, time <double>)
subroutine writegrid3d_double_llf_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_double_llf_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_double_llf_td

!NetCDF <var byte> (lon <double>, lat <double>, time <double>)
subroutine writegrid3d_byte_lld_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_byte_lld_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_byte_lld_td

!NetCDF <var short> (lon <double>, lat <double>, time <double>)
subroutine writegrid3d_short_lld_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_short_lld_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_short_lld_td

!NetCDF <var int> (lon <double>, lat <double>, time <double>)
subroutine writegrid3d_int_lld_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_int_lld_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_int_lld_td

!NetCDF <var float> (lon <double>, lat <double>, time <double>)
subroutine writegrid3d_float_lld_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_float_lld_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_float_lld_td

!NetCDF <var double> (lon <double>, lat <double>, time <double>)
subroutine writegrid3d_double_lld_td(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc3d_double_lld_td) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))

  call check(nf90_close(ncid))
end subroutine writegrid3d_double_lld_td

!NetCDF <var byte> (lon <float>, lat <float>, time <int>, level <int>)
subroutine writegrid4d_byte_llf_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_llf_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_llf_ti_li

!NetCDF <var short> (lon <float>, lat <float>, time <int>, level <int>)
subroutine writegrid4d_short_llf_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_llf_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_llf_ti_li

!NetCDF <var int> (lon <float>, lat <float>, time <int>, level <int>)
subroutine writegrid4d_int_llf_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_llf_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_llf_ti_li

!NetCDF <var float> (lon <float>, lat <float>, time <int>, level <int>)
subroutine writegrid4d_float_llf_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_llf_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_llf_ti_li

!NetCDF <var double> (lon <float>, lat <float>, time <int>, level <int>)
subroutine writegrid4d_double_llf_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_llf_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_llf_ti_li

!NetCDF <var byte> (lon <double>, lat <double>, time <int>, level <int>)
subroutine writegrid4d_byte_lld_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_lld_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_lld_ti_li

!NetCDF <var short> (lon <double>, lat <double>, time <int>, level <int>)
subroutine writegrid4d_short_lld_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_lld_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_lld_ti_li

!NetCDF <var int> (lon <double>, lat <double>, time <int>, level <int>)
subroutine writegrid4d_int_lld_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_lld_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_lld_ti_li

!NetCDF <var float> (lon <double>, lat <double>, time <int>, level <int>)
subroutine writegrid4d_float_lld_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_lld_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_lld_ti_li

!NetCDF <var double> (lon <double>, lat <double>, time <int>, level <int>)
subroutine writegrid4d_double_lld_ti_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_lld_ti_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_lld_ti_li

!NetCDF <var byte> (lon <float>, lat <float>, time <float>, level <int>)
subroutine writegrid4d_byte_llf_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_llf_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_llf_tf_li

!NetCDF <var short> (lon <float>, lat <float>, time <float>, level <int>)
subroutine writegrid4d_short_llf_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_llf_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_llf_tf_li

!NetCDF <var int> (lon <float>, lat <float>, time <float>, level <int>)
subroutine writegrid4d_int_llf_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_llf_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_llf_tf_li

!NetCDF <var float> (lon <float>, lat <float>, time <float>, level <int>)
subroutine writegrid4d_float_llf_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_llf_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_llf_tf_li

!NetCDF <var double> (lon <float>, lat <float>, time <float>, level <int>)
subroutine writegrid4d_double_llf_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_llf_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_llf_tf_li

!NetCDF <var byte> (lon <double>, lat <double>, time <float>, level <int>)
subroutine writegrid4d_byte_lld_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_lld_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_lld_tf_li

!NetCDF <var short> (lon <double>, lat <double>, time <float>, level <int>)
subroutine writegrid4d_short_lld_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_lld_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_lld_tf_li

!NetCDF <var int> (lon <double>, lat <double>, time <float>, level <int>)
subroutine writegrid4d_int_lld_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_lld_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_lld_tf_li

!NetCDF <var float> (lon <double>, lat <double>, time <float>, level <int>)
subroutine writegrid4d_float_lld_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_lld_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_lld_tf_li

!NetCDF <var double> (lon <double>, lat <double>, time <float>, level <int>)
subroutine writegrid4d_double_lld_tf_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_lld_tf_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_lld_tf_li

!NetCDF <var byte> (lon <float>, lat <float>, time <double>, level <int>)
subroutine writegrid4d_byte_llf_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_llf_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_llf_td_li

!NetCDF <var short> (lon <float>, lat <float>, time <double>, level <int>)
subroutine writegrid4d_short_llf_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_llf_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_llf_td_li

!NetCDF <var int> (lon <float>, lat <float>, time <double>, level <int>)
subroutine writegrid4d_int_llf_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_llf_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_llf_td_li

!NetCDF <var float> (lon <float>, lat <float>, time <double>, level <int>)
subroutine writegrid4d_float_llf_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_llf_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_llf_td_li

!NetCDF <var double> (lon <float>, lat <float>, time <double>, level <int>)
subroutine writegrid4d_double_llf_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_llf_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_llf_td_li

!NetCDF <var byte> (lon <double>, lat <double>, time <double>, level <int>)
subroutine writegrid4d_byte_lld_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_lld_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_lld_td_li

!NetCDF <var short> (lon <double>, lat <double>, time <double>, level <int>)
subroutine writegrid4d_short_lld_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_lld_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_lld_td_li

!NetCDF <var int> (lon <double>, lat <double>, time <double>, level <int>)
subroutine writegrid4d_int_lld_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_lld_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_lld_td_li

!NetCDF <var float> (lon <double>, lat <double>, time <double>, level <int>)
subroutine writegrid4d_float_lld_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_lld_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_lld_td_li

!NetCDF <var double> (lon <double>, lat <double>, time <double>, level <int>)
subroutine writegrid4d_double_lld_td_li(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_lld_td_li) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_int, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_lld_td_li

!NetCDF <var byte> (lon <float>, lat <float>, time <int>, level <float>)
subroutine writegrid4d_byte_llf_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_llf_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_llf_ti_lf

!NetCDF <var short> (lon <float>, lat <float>, time <int>, level <float>)
subroutine writegrid4d_short_llf_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_llf_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_llf_ti_lf

!NetCDF <var int> (lon <float>, lat <float>, time <int>, level <float>)
subroutine writegrid4d_int_llf_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_llf_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_llf_ti_lf

!NetCDF <var float> (lon <float>, lat <float>, time <int>, level <float>)
subroutine writegrid4d_float_llf_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_llf_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_llf_ti_lf

!NetCDF <var double> (lon <float>, lat <float>, time <int>, level <float>)
subroutine writegrid4d_double_llf_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_llf_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_llf_ti_lf

!NetCDF <var byte> (lon <double>, lat <double>, time <int>, level <float>)
subroutine writegrid4d_byte_lld_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_lld_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_lld_ti_lf

!NetCDF <var short> (lon <double>, lat <double>, time <int>, level <float>)
subroutine writegrid4d_short_lld_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_lld_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_lld_ti_lf

!NetCDF <var int> (lon <double>, lat <double>, time <int>, level <float>)
subroutine writegrid4d_int_lld_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_lld_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_lld_ti_lf

!NetCDF <var float> (lon <double>, lat <double>, time <int>, level <float>)
subroutine writegrid4d_float_lld_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_lld_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_lld_ti_lf

!NetCDF <var double> (lon <double>, lat <double>, time <int>, level <float>)
subroutine writegrid4d_double_lld_ti_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_lld_ti_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_lld_ti_lf

!NetCDF <var byte> (lon <float>, lat <float>, time <float>, level <float>)
subroutine writegrid4d_byte_llf_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_llf_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_llf_tf_lf

!NetCDF <var short> (lon <float>, lat <float>, time <float>, level <float>)
subroutine writegrid4d_short_llf_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_llf_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_llf_tf_lf

!NetCDF <var int> (lon <float>, lat <float>, time <float>, level <float>)
subroutine writegrid4d_int_llf_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_llf_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_llf_tf_lf

!NetCDF <var float> (lon <float>, lat <float>, time <float>, level <float>)
subroutine writegrid4d_float_llf_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_llf_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_llf_tf_lf

!NetCDF <var double> (lon <float>, lat <float>, time <float>, level <float>)
subroutine writegrid4d_double_llf_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_llf_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_llf_tf_lf

!NetCDF <var byte> (lon <double>, lat <double>, time <float>, level <float>)
subroutine writegrid4d_byte_lld_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_lld_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_lld_tf_lf

!NetCDF <var short> (lon <double>, lat <double>, time <float>, level <float>)
subroutine writegrid4d_short_lld_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_lld_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_lld_tf_lf

!NetCDF <var int> (lon <double>, lat <double>, time <float>, level <float>)
subroutine writegrid4d_int_lld_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_lld_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_lld_tf_lf

!NetCDF <var float> (lon <double>, lat <double>, time <float>, level <float>)
subroutine writegrid4d_float_lld_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_lld_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_lld_tf_lf

!NetCDF <var double> (lon <double>, lat <double>, time <float>, level <float>)
subroutine writegrid4d_double_lld_tf_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_lld_tf_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_float, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_lld_tf_lf

!NetCDF <var byte> (lon <float>, lat <float>, time <double>, level <float>)
subroutine writegrid4d_byte_llf_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_llf_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_llf_td_lf

!NetCDF <var short> (lon <float>, lat <float>, time <double>, level <float>)
subroutine writegrid4d_short_llf_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_llf_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_llf_td_lf

!NetCDF <var int> (lon <float>, lat <float>, time <double>, level <float>)
subroutine writegrid4d_int_llf_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_llf_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_llf_td_lf

!NetCDF <var float> (lon <float>, lat <float>, time <double>, level <float>)
subroutine writegrid4d_float_llf_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_llf_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_llf_td_lf

!NetCDF <var double> (lon <float>, lat <float>, time <double>, level <float>)
subroutine writegrid4d_double_llf_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_llf_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_llf_td_lf

!NetCDF <var byte> (lon <double>, lat <double>, time <double>, level <float>)
subroutine writegrid4d_byte_lld_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_byte_lld_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_byte_lld_td_lf

!NetCDF <var short> (lon <double>, lat <double>, time <double>, level <float>)
subroutine writegrid4d_short_lld_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_short_lld_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_short_lld_td_lf

!NetCDF <var int> (lon <double>, lat <double>, time <double>, level <float>)
subroutine writegrid4d_int_lld_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_int_lld_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_int_lld_td_lf

!NetCDF <var float> (lon <double>, lat <double>, time <double>, level <float>)
subroutine writegrid4d_float_lld_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_float_lld_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_float_lld_td_lf

!NetCDF <var double> (lon <double>, lat <double>, time <double>, level <float>)
subroutine writegrid4d_double_lld_td_lf(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(nc4d_double_lld_td_lf) :: odata
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
  call check(nf90_def_var(ncid, odata%dimname(1), nf90_double, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
  
  call check(nf90_def_var(ncid, odata%dimname(2), nf90_double, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), nf90_double, odata%dimid(3), odata%varids(3)))
  call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  call check(nf90_def_var(ncid, odata%dimname(4), nf90_float, odata%dimid(4), odata%varids(4)))
  call check(nf90_put_att(ncid, odata%varids(4), "units", odata%dimunits(4)))


  call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
  call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
  call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
         
  call check(nf90_put_att(ncid, varid, "valid_min", & 
             minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  call check(nf90_put_att(ncid, varid, "valid_max", & 
             maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))

  call check(nf90_put_att(ncid, varid, "units", odata%varunits))

  !Put Global Attributes
  call fdate_time(sysdatetime)
  call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
  call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
 
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
    if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
    end if
    if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
    end if
    if(odata%dimname(i).eq."time") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%times))
    end if
    if(odata%dimname(i).eq."level") then
      call check(nf90_put_var(ncid, odata%varids(i), odata%levels))
   end if
  end do

  !Write variable
  call check(nf90_put_var(ncid, varid, odata%ncdata))
  
  call check(nf90_close(ncid))
end subroutine writegrid4d_double_lld_td_lf
