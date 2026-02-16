subroutine FPL_SUBR(mask, map, num)
  type (FPL_MASK_TYPE), intent(in) :: mask
  type (FPL_MAP_TYPE), intent(inout) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    !$omp parallel do private(k, i, j)
    do k = 1, map%ntimes
      do j = 1, mask%nlats
        do i = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
    !$omp end parallel do
  else
    !$omp parallel do private(k, i, j)
    do k = 1, map%ntimes
      do j = 1, mask%nlats
        do i = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
    !$omp end parallel do
  end if
end subroutine FPL_SUBR
