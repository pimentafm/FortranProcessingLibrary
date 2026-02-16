subroutine FPL_SUBR(ifile, idata)
  character(*), intent(in) :: ifile
  type(FPL_TYPE), intent(inout) :: idata

  integer(kind=intgr) :: ncid, varid, i
  integer :: alloc_stat

  call griddims(ifile, idata)

  allocate(idata%times(idata%ntimes), stat=alloc_stat)
  call check_alloc(alloc_stat, "times")
  allocate(idata%longitudes(idata%nlons), stat=alloc_stat)
  call check_alloc(alloc_stat, "longitudes")
  allocate(idata%latitudes(idata%nlats), stat=alloc_stat)
  call check_alloc(alloc_stat, "latitudes")

  allocate(idata%ncdata(idata%dimsize(idata%dims(1)), idata%dimsize(idata%dims(2)), &
           idata%dimsize(idata%dims(3))), stat=alloc_stat)
  call check_alloc(alloc_stat, "ncdata")

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."longitude".or.idata%dimname(i).eq."lon")then
      call check(nf90_get_var(ncid, idata%varids(i), idata%longitudes))
      idata%lonunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."latitude".or.idata%dimname(i).eq."lat") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%latitudes))
      idata%latunits = idata%dimunits(i)
    end if

    if(idata%dimname(i).eq."time") then
      call check(nf90_get_var(ncid, idata%varids(i), idata%times))
      idata%timeunits = idata%dimunits(i)
    end if
  end do

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,FPL_LABEL, ifile)

  call check(nf90_close(ncid))
end subroutine FPL_SUBR
