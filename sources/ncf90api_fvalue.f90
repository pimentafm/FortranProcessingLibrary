subroutine fvbm_di(mask, map)
  type (nc2d_double) :: map
  type (nc2d_int) :: mask
  integer(kind=4) :: i, j

 do i = 1, mask%nlats
   do j = 1, mask%nlons
     !write(*,*)mask%f_value
     if(mask%ncdata(i,j).eq.mask%f_value) map%ncdata(i,j) = map%f_value
   end do
 end do
end subroutine fvbm_di

subroutine fvbm_dd(mask, map)
  type (nc2d_double) :: map
  type (nc2d_double) :: mask
  integer(kind=4) :: i, j

 do i = 1, mask%nlats
   do j = 1, mask%nlons
     !write(*,*)mask%f_value
     if(mask%ncdata(i,j).eq.mask%f_value) map%ncdata(i,j) = map%f_value
   end do
 end do
end subroutine fvbm_dd

subroutine fvbm_sd(mask, map)
  type (nc2d_double) :: map
  type (nc2d_short) :: mask
  integer(kind=4) :: i, j

 do i = 1, mask%nlats
   do j = 1, mask%nlons
     !write(*,*)mask%f_value
     if(mask%ncdata(i,j).eq.mask%f_value) map%ncdata(i,j) = map%f_value
   end do
 end do
end subroutine fvbm_sd

