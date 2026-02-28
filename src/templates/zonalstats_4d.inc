subroutine FPL_SUBR(zones, data, nzones, zcount, zmean, zmin, zmax, zsum, zvar)
  type (FPL_ZONE_TYPE), intent(in) :: zones
  type (FPL_DATA_TYPE), intent(in) :: data
  integer(kind=intgr), intent(in) :: nzones
  integer(kind=intgr), dimension(nzones, data%ntimes, data%nlevels), intent(out) :: zcount
  real(kind=double), dimension(nzones, data%ntimes, data%nlevels), intent(out) :: zmean, zmin, zmax, zsum, zvar

  integer(kind=intgr) :: i, j, k, l, z
  real(kind=double), dimension(nzones) :: zsumsq
  real(kind=double) :: val

  zcount = 0
  zsum = 0.0d0
  zmin = huge(1.0d0)
  zmax = -huge(1.0d0)

  !$omp parallel do collapse(2) private(i, j, z, val, zsumsq)
  do l = 1, data%nlevels
    do k = 1, data%ntimes
      zsumsq = 0.0d0
      do j = 1, zones%nlats
        do i = 1, zones%nlons
          z = int(zones%ncdata(i,j), kind=intgr)
          if (z < 1 .or. z > nzones) cycle
          if (data%ncdata(i,j,k,l) == data%FillValue) cycle
          val = real(data%ncdata(i,j,k,l), kind=double)
          zcount(z,k,l) = zcount(z,k,l) + 1
          zsum(z,k,l) = zsum(z,k,l) + val
          zsumsq(z) = zsumsq(z) + val * val
          if (val < zmin(z,k,l)) zmin(z,k,l) = val
          if (val > zmax(z,k,l)) zmax(z,k,l) = val
        end do
      end do

      do z = 1, nzones
        if (zcount(z,k,l) > 0) then
          zmean(z,k,l) = zsum(z,k,l) / real(zcount(z,k,l), kind=double)
          zvar(z,k,l) = zsumsq(z) / real(zcount(z,k,l), kind=double) - zmean(z,k,l) * zmean(z,k,l)
        else
          zmean(z,k,l) = 0.0d0
          zmin(z,k,l) = 0.0d0
          zmax(z,k,l) = 0.0d0
          zvar(z,k,l) = 0.0d0
        end if
      end do
    end do
  end do
  !$omp end parallel do
end subroutine FPL_SUBR
