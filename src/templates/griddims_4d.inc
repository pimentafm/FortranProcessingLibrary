subroutine FPL_SUBR(ifile, idata)
  type (FPL_TYPE), intent(inout) :: idata
  integer(kind=intgr) :: ncid, varid, i
  character(*), intent(in) :: ifile
  integer :: alloc_stat
  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Inquire variable type and number of dimensions
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype, idata%ndims, idata%dims))

  allocate(idata%dimid(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimid")
  allocate(idata%varids(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "varids")
  allocate(idata%dimunits(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimunits")
  allocate(idata%dimname(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimname")
  allocate(idata%dimsize(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimsize")

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
    call check(nf90_get_att(ncid, idata%varids(i), "units", idata%dimunits(i)), idata%dimunits(i), ifile)
  end do

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  do i = 1, idata%ndims
    if(idata%dimname(i).eq."longitude".or.idata%dimname(i).eq."lon") then
      idata%nlons = idata%dimsize(i)
      idata%lonunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."latitude".or.idata%dimname(i).eq."lat") then
      idata%nlats = idata%dimsize(i)
      idata%latunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."time") then
      idata%ntimes = idata%dimsize(i)
      idata%timeunits = idata%dimunits(i)
    end if
    if(idata%dimname(i).eq."level") then
      idata%nlevels = idata%dimsize(i)
      idata%levelunits = idata%dimunits(i)
    end if
  end do

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine FPL_SUBR
