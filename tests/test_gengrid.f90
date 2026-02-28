program test_gengrid
  use fpl
  implicit none

  type(nc2d_float_llf) :: grid2d
  type(nc3d_float_llf_tf) :: grid3d
  type(nc4d_float_llf_tf_lf) :: grid4d

  integer :: failures
  integer :: expected_nlons, expected_nlats

  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  failures = 0

  write(*,*) "=== Test: Grid Generation ==="

  ! Parameters for a simple grid
  Xmin = -50.0
  Ymin = -20.0
  Xmax = -40.0
  Ymax = -10.0
  res  = 1.0

  expected_nlons = 10  ! abs(ceiling((-40 - (-50)) / 1.0))
  expected_nlats = 10  ! abs(ceiling((-10 - (-20)) / 1.0))

  ! --- Test 2D grid generation ---
  grid2d%varname  = "test"
  grid2d%lonname  = "lon"
  grid2d%latname  = "lat"
  grid2d%varunits = "unit"
  grid2d%lonunits = "degrees_east"
  grid2d%latunits = "degrees_north"
  grid2d%FillValue = -9999.0

  call gengrid(grid2d, Xmin, Ymin, Xmax, Ymax, res)

  if (grid2d%nlons /= expected_nlons) then
    write(*,*) "FAIL: 2D nlons =", grid2d%nlons, " expected", expected_nlons
    failures = failures + 1
  else
    write(*,*) "PASS: 2D nlons =", grid2d%nlons
  end if

  if (grid2d%nlats /= expected_nlats) then
    write(*,*) "FAIL: 2D nlats =", grid2d%nlats, " expected", expected_nlats
    failures = failures + 1
  else
    write(*,*) "PASS: 2D nlats =", grid2d%nlats
  end if

  ! Check first longitude value
  if (abs(grid2d%longitudes(1) - Xmin) > 0.01) then
    write(*,*) "FAIL: 2D longitudes(1) =", grid2d%longitudes(1), " expected", Xmin
    failures = failures + 1
  else
    write(*,*) "PASS: 2D longitudes(1) =", grid2d%longitudes(1)
  end if

  ! Check first latitude value
  if (abs(grid2d%latitudes(1) - Ymin) > 0.01) then
    write(*,*) "FAIL: 2D latitudes(1) =", grid2d%latitudes(1), " expected", Ymin
    failures = failures + 1
  else
    write(*,*) "PASS: 2D latitudes(1) =", grid2d%latitudes(1)
  end if

  ! Check that ncdata is allocated and initialized to FillValue
  if (.not. allocated(grid2d%ncdata)) then
    write(*,*) "FAIL: 2D ncdata not allocated"
    failures = failures + 1
  else
    write(*,*) "PASS: 2D ncdata allocated, shape =", shape(grid2d%ncdata)
    if (grid2d%ncdata(1,1) /= grid2d%FillValue) then
      write(*,*) "FAIL: 2D ncdata(1,1) =", grid2d%ncdata(1,1), " expected FillValue"
      failures = failures + 1
    else
      write(*,*) "PASS: 2D ncdata initialized to FillValue"
    end if
  end if

  call dealloc(grid2d)

  ! --- Test 3D grid generation ---
  grid3d%varname   = "test"
  grid3d%lonname   = "lon"
  grid3d%latname   = "lat"
  grid3d%timename  = "time"
  grid3d%varunits  = "unit"
  grid3d%lonunits  = "degrees_east"
  grid3d%latunits  = "degrees_north"
  grid3d%timeunits = "hours"
  grid3d%ntimes    = 5
  grid3d%FillValue = -9999.0

  call gengrid(grid3d, Xmin, Ymin, Xmax, Ymax, res)

  if (grid3d%nlons /= expected_nlons) then
    write(*,*) "FAIL: 3D nlons =", grid3d%nlons, " expected", expected_nlons
    failures = failures + 1
  else
    write(*,*) "PASS: 3D nlons =", grid3d%nlons
  end if

  if (grid3d%nlats /= expected_nlats) then
    write(*,*) "FAIL: 3D nlats =", grid3d%nlats, " expected", expected_nlats
    failures = failures + 1
  else
    write(*,*) "PASS: 3D nlats =", grid3d%nlats
  end if

  if (grid3d%ntimes /= 5) then
    write(*,*) "FAIL: 3D ntimes =", grid3d%ntimes, " expected 5"
    failures = failures + 1
  else
    write(*,*) "PASS: 3D ntimes =", grid3d%ntimes
  end if

  if (.not. allocated(grid3d%ncdata)) then
    write(*,*) "FAIL: 3D ncdata not allocated"
    failures = failures + 1
  else
    write(*,*) "PASS: 3D ncdata allocated, shape =", shape(grid3d%ncdata)
  end if

  call dealloc(grid3d)

  ! --- Test 4D grid generation ---
  grid4d%varname    = "test"
  grid4d%lonname    = "lon"
  grid4d%latname    = "lat"
  grid4d%timename   = "time"
  grid4d%levelname  = "level"
  grid4d%varunits   = "unit"
  grid4d%lonunits   = "degrees_east"
  grid4d%latunits   = "degrees_north"
  grid4d%timeunits  = "hours"
  grid4d%levelunits = "m"
  grid4d%ntimes     = 3
  grid4d%nlevels    = 4
  grid4d%FillValue  = -9999.0

  call gengrid(grid4d, Xmin, Ymin, Xmax, Ymax, res)

  if (grid4d%nlons /= expected_nlons) then
    write(*,*) "FAIL: 4D nlons =", grid4d%nlons, " expected", expected_nlons
    failures = failures + 1
  else
    write(*,*) "PASS: 4D nlons =", grid4d%nlons
  end if

  if (grid4d%nlats /= expected_nlats) then
    write(*,*) "FAIL: 4D nlats =", grid4d%nlats, " expected", expected_nlats
    failures = failures + 1
  else
    write(*,*) "PASS: 4D nlats =", grid4d%nlats
  end if

  if (grid4d%nlevels /= 4) then
    write(*,*) "FAIL: 4D nlevels =", grid4d%nlevels, " expected 4"
    failures = failures + 1
  else
    write(*,*) "PASS: 4D nlevels =", grid4d%nlevels
  end if

  if (.not. allocated(grid4d%ncdata)) then
    write(*,*) "FAIL: 4D ncdata not allocated"
    failures = failures + 1
  else
    write(*,*) "PASS: 4D ncdata allocated, shape =", shape(grid4d%ncdata)
  end if

  call dealloc(grid4d)

  ! --- Summary ---
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All grid generation tests passed."
  end if

end program test_gengrid
