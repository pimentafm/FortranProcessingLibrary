program test_zonalstats
  use fpl
  implicit none

  type(nc2d_float_llf) :: zones, data_grid
  integer(kind=intgr) :: nzones, failures, i, j
  integer(kind=intgr), dimension(2) :: zcount
  real(kind=double), dimension(2) :: zmean, zmin, zmax, zsum, zvar

  failures = 0
  nzones = 2

  write(*,*) "=== Test: zonalStats ==="

  ! --- Create zone grid: 10x10, left half = zone 1, right half = zone 2 ---
  zones%varname   = "zones"
  zones%lonname   = "lon"
  zones%latname   = "lat"
  zones%varunits  = "class"
  zones%lonunits  = "degrees_east"
  zones%latunits  = "degrees_north"
  zones%FillValue = -9999.0

  call gengrid(zones, 0.0, 0.0, 10.0, 10.0, 1.0)

  do j = 1, zones%nlats
    do i = 1, zones%nlons
      if (i <= zones%nlons / 2) then
        zones%ncdata(i,j) = 1.0
      else
        zones%ncdata(i,j) = 2.0
      end if
    end do
  end do

  ! --- Create data grid: zone 1 all 10.0, zone 2 all 20.0 ---
  data_grid%varname   = "data"
  data_grid%lonname   = "lon"
  data_grid%latname   = "lat"
  data_grid%varunits  = "unit"
  data_grid%lonunits  = "degrees_east"
  data_grid%latunits  = "degrees_north"
  data_grid%FillValue = -9999.0

  call gengrid(data_grid, 0.0, 0.0, 10.0, 10.0, 1.0)

  do j = 1, data_grid%nlats
    do i = 1, data_grid%nlons
      if (i <= data_grid%nlons / 2) then
        data_grid%ncdata(i,j) = 10.0
      else
        data_grid%ncdata(i,j) = 20.0
      end if
    end do
  end do

  ! --- Test 1: Basic zonal statistics ---
  write(*,*) "Test 1: Basic zonal statistics"
  call zonalStats(zones, data_grid, nzones, zcount, zmean, zmin, zmax, zsum, zvar)

  ! Zone 1: 50 pixels, all 10.0
  if (zcount(1) /= 50) then
    write(*,*) "FAIL: zone 1 count =", zcount(1), " expected 50"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 count = 50"
  end if

  if (abs(zmean(1) - 10.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 1 mean =", zmean(1), " expected 10.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 mean = 10.0"
  end if

  if (abs(zmin(1) - 10.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 1 min =", zmin(1), " expected 10.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 min = 10.0"
  end if

  if (abs(zmax(1) - 10.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 1 max =", zmax(1), " expected 10.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 max = 10.0"
  end if

  if (abs(zsum(1) - 500.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 1 sum =", zsum(1), " expected 500.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 sum = 500.0"
  end if

  if (abs(zvar(1)) > 1.0d-10) then
    write(*,*) "FAIL: zone 1 var =", zvar(1), " expected 0.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 var = 0.0"
  end if

  ! Zone 2: 50 pixels, all 20.0
  if (zcount(2) /= 50) then
    write(*,*) "FAIL: zone 2 count =", zcount(2), " expected 50"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 2 count = 50"
  end if

  if (abs(zmean(2) - 20.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 2 mean =", zmean(2), " expected 20.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 2 mean = 20.0"
  end if

  if (abs(zsum(2) - 1000.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 2 sum =", zsum(2), " expected 1000.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 2 sum = 1000.0"
  end if

  ! --- Test 2: FillValue exclusion ---
  write(*,*) ""
  write(*,*) "Test 2: FillValue exclusion"

  ! Set 10 pixels in zone 1 to FillValue
  do j = 1, 2
    do i = 1, 5
      data_grid%ncdata(i,j) = data_grid%FillValue
    end do
  end do

  call zonalStats(zones, data_grid, nzones, zcount, zmean, zmin, zmax, zsum, zvar)

  ! Zone 1 should now have 40 pixels (50 - 10)
  if (zcount(1) /= 40) then
    write(*,*) "FAIL: zone 1 count with fill =", zcount(1), " expected 40"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 count with fill = 40"
  end if

  if (abs(zmean(1) - 10.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 1 mean with fill =", zmean(1), " expected 10.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 mean with fill = 10.0"
  end if

  if (abs(zsum(1) - 400.0d0) > 1.0d-10) then
    write(*,*) "FAIL: zone 1 sum with fill =", zsum(1), " expected 400.0"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 1 sum with fill = 400.0"
  end if

  ! Zone 2 should be unchanged
  if (zcount(2) /= 50) then
    write(*,*) "FAIL: zone 2 count unchanged =", zcount(2), " expected 50"
    failures = failures + 1
  else
    write(*,*) "PASS: zone 2 count unchanged = 50"
  end if

  call dealloc(zones)
  call dealloc(data_grid)

  ! --- Summary ---
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All zonalStats tests passed."
  end if

end program test_zonalstats
