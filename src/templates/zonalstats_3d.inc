subroutine FPL_SUBR(zones, data, nzones, zcount, zmean, zmin, zmax, zsum, zvar)
  type (FPL_ZONE_TYPE), intent(in) :: zones
  type (FPL_DATA_TYPE), intent(in) :: data
  integer(kind=intgr), intent(in) :: nzones
  integer(kind=intgr), dimension(nzones, data%ntimes), intent(out) :: zcount
  real(kind=double), dimension(nzones, data%ntimes), intent(out) :: zmean, zmin, zmax, zsum, zvar

  integer(kind=intgr) :: i, j, k, z
  real(kind=double), dimension(nzones) :: zsumsq
  real(kind=double) :: val

  zcount = 0
  zsum = 0.0d0
  zmin = huge(1.0d0)
  zmax = -huge(1.0d0)

  !$omp parallel do private(i, j, z, val, zsumsq)
  do k = 1, data%ntimes
    zsumsq = 0.0d0
    do j = 1, zones%nlats
      do i = 1, zones%nlons
        z = int(zones%ncdata(i,j), kind=intgr)
        if (z < 1 .or. z > nzones) cycle
        if (data%ncdata(i,j,k) == data%FillValue) cycle
        val = real(data%ncdata(i,j,k), kind=double)
        zcount(z,k) = zcount(z,k) + 1
        zsum(z,k) = zsum(z,k) + val
        zsumsq(z) = zsumsq(z) + val * val
        if (val < zmin(z,k)) zmin(z,k) = val
        if (val > zmax(z,k)) zmax(z,k) = val
      end do
    end do

    do z = 1, nzones
      if (zcount(z,k) > 0) then
        zmean(z,k) = zsum(z,k) / real(zcount(z,k), kind=double)
        zvar(z,k) = zsumsq(z) / real(zcount(z,k), kind=double) - zmean(z,k) * zmean(z,k)
      else
        zmean(z,k) = 0.0d0
        zmin(z,k) = 0.0d0
        zmax(z,k) = 0.0d0
        zvar(z,k) = 0.0d0
      end if
    end do
  end do
  !$omp end parallel do
end subroutine FPL_SUBR
