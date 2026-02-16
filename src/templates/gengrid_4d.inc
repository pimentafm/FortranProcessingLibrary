subroutine FPL_SUBR(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (FPL_TYPE), intent(inout) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res
  integer :: alloc_stat

  idata%ndims = 4

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimunits")
  allocate(idata%dimname(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimname")
  allocate(idata%dimid(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimid")
  allocate(idata%dimsize(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "dimsize")
  allocate(idata%varids(idata%ndims), stat=alloc_stat)
  call check_alloc(alloc_stat, "varids")

  allocate(idata%longitudes(idata%nlons), stat=alloc_stat)
  call check_alloc(alloc_stat, "longitudes")
  allocate(idata%latitudes(idata%nlats), stat=alloc_stat)
  call check_alloc(alloc_stat, "latitudes")
  allocate(idata%times(idata%ntimes), stat=alloc_stat)
  call check_alloc(alloc_stat, "times")
  allocate(idata%levels(idata%nlevels), stat=alloc_stat)
  call check_alloc(alloc_stat, "levels")

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)), stat=alloc_stat)
  call check_alloc(alloc_stat, "ncdata")

  idata%vartype = FPL_NF90_VARTYPE

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine FPL_SUBR
