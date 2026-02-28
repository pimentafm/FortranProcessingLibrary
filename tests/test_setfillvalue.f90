program test_setfillvalue
  use fpl
  implicit none

  type(nc2d_float_llf) :: mask, data_grid
  integer :: failures, i, j
  integer :: masked_count, zero_count, data_count

  failures = 0

  write(*,*) "=== Test: setFillValue (Masking) ==="

  ! --- Create mask grid: left half = 1, right half = 2 ---
  mask%varname   = "mask"
  mask%lonname   = "lon"
  mask%latname   = "lat"
  mask%varunits  = "class"
  mask%lonunits  = "degrees_east"
  mask%latunits  = "degrees_north"
  mask%FillValue = -9999.0

  call gengrid(mask, -10.0, -5.0, 10.0, 5.0, 1.0)

  do j = 1, mask%nlats
    do i = 1, mask%nlons
      if (i <= mask%nlons / 2) then
        mask%ncdata(i,j) = 1.0
      else
        mask%ncdata(i,j) = 2.0
      end if
    end do
  end do

  ! --- Create data grid with all values = 42.0 ---
  data_grid%varname   = "data"
  data_grid%lonname   = "lon"
  data_grid%latname   = "lat"
  data_grid%varunits  = "unit"
  data_grid%lonunits  = "degrees_east"
  data_grid%latunits  = "degrees_north"
  data_grid%FillValue = -9999.0

  call gengrid(data_grid, -10.0, -5.0, 10.0, 5.0, 1.0)

  data_grid%ncdata = 42.0

  ! --- Apply mask with num=1 (keep only where mask==1, i.e., left half) ---
  call setFillValue(mask, data_grid, 1)

  ! Count masked vs data points
  masked_count = 0
  zero_count = 0
  data_count = 0
  do j = 1, data_grid%nlats
    do i = 1, data_grid%nlons
      if (data_grid%ncdata(i,j) == data_grid%FillValue) then
        masked_count = masked_count + 1
      else if (data_grid%ncdata(i,j) == 42.0) then
        data_count = data_count + 1
      else if (data_grid%ncdata(i,j) == 0.0) then
        zero_count = zero_count + 1
      end if
    end do
  end do

  ! Left half (mask==1) should be preserved (42.0)
  ! Right half (mask==2) should be FillValue
  write(*,*) "Data points (42.0):", data_count
  write(*,*) "Masked points (FillValue):", masked_count
  write(*,*) "Zero points:", zero_count

  if (data_count == 0) then
    write(*,*) "FAIL: No data points preserved after masking"
    failures = failures + 1
  else
    write(*,*) "PASS: Data points preserved where mask==1:", data_count
  end if

  if (masked_count == 0) then
    write(*,*) "FAIL: No points were masked"
    failures = failures + 1
  else
    write(*,*) "PASS: Points masked where mask!=1:", masked_count
  end if

  ! Total should equal grid size
  if (data_count + masked_count + zero_count /= data_grid%nlons * data_grid%nlats) then
    write(*,*) "FAIL: Point count mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: Total points =", data_grid%nlons * data_grid%nlats
  end if

  call dealloc(mask)
  call dealloc(data_grid)

  ! --- Summary ---
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All setFillValue tests passed."
  end if

end program test_setfillvalue
