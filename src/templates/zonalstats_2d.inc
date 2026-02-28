subroutine FPL_SUBR(zones, data, nzones, zcount, zmean, zmin, zmax, zsum, zvar)
  type (FPL_ZONE_TYPE), intent(in) :: zones
  type (FPL_DATA_TYPE), intent(in) :: data
  integer(kind=intgr), intent(in) :: nzones
  integer(kind=intgr), dimension(nzones), intent(out) :: zcount
  real(kind=double), dimension(nzones), intent(out) :: zmean, zmin, zmax, zsum, zvar

  integer(kind=intgr) :: i, j, z
  real(kind=double), dimension(nzones) :: zsumsq
  real(kind=double) :: val

  zcount = 0
  zsum = 0.0d0
  zsumsq = 0.0d0
  zmin = huge(1.0d0)
  zmax = -huge(1.0d0)

  !$omp parallel do private(i, z, val) &
  !$omp reduction(+:zcount, zsum, zsumsq) reduction(min:zmin) reduction(max:zmax)
  do j = 1, zones%nlats
    do i = 1, zones%nlons
      z = int(zones%ncdata(i,j), kind=intgr)
      if (z < 1 .or. z > nzones) cycle
      if (data%ncdata(i,j) == data%FillValue) cycle
      val = real(data%ncdata(i,j), kind=double)
      zcount(z) = zcount(z) + 1
      zsum(z) = zsum(z) + val
      zsumsq(z) = zsumsq(z) + val * val
      if (val < zmin(z)) zmin(z) = val
      if (val > zmax(z)) zmax(z) = val
    end do
  end do
  !$omp end parallel do

  do z = 1, nzones
    if (zcount(z) > 0) then
      zmean(z) = zsum(z) / real(zcount(z), kind=double)
      zvar(z) = zsumsq(z) / real(zcount(z), kind=double) - zmean(z) * zmean(z)
    else
      zmean(z) = 0.0d0
      zmin(z) = 0.0d0
      zmax(z) = 0.0d0
      zvar(z) = 0.0d0
    end if
  end do
end subroutine FPL_SUBR
