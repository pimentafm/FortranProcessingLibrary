subroutine FPL_SUBR(ofile, odata, headerfile)
  character(*), intent(in) :: ofile
  character(*),  optional, intent(in) :: headerfile
  character(len=21) :: sysdatetime
  type(FPL_TYPE), intent(inout) :: odata
  integer(kind=intgr) :: ncid, varid, i

  !:=== Header file
  character(len=100), dimension(:), allocatable :: attribute, content
  integer(kind=4) :: nkeys
  integer :: alloc_stat
  nkeys = 0

  !Create Netcdf
  call check(nf90_create(ofile, nf90_hdf5, ncid))

  !Define dimensions

  do i = 1, odata%ndims
    call check(nf90_def_dim(ncid, odata%dimname(i), odata%dimsize(i), odata%dimid(i)))
  end do

  !Define variables
  call check(nf90_def_var(ncid, odata%dimname(1), FPL_NF90_COORD, odata%dimid(1), odata%varids(1)))
  call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))

  call check(nf90_def_var(ncid, odata%dimname(2), FPL_NF90_COORD, odata%dimid(2), odata%varids(2)))
  call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))

  call check(nf90_def_var(ncid, odata%dimname(3), FPL_NF90_TIME, odata%dimid(3), odata%varids(3)))
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

      allocate(attribute(nkeys), stat=alloc_stat)
      call check_alloc(alloc_stat, "attribute")
      allocate(content(nkeys), stat=alloc_stat)
      call check_alloc(alloc_stat, "content")

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
end subroutine FPL_SUBR
