program test_griddims
  use fpl
  implicit none

  type(nc2d_float_llf) :: grid_out, grid_dims
  integer :: failures
  character(200) :: testfile

  failures = 0
  testfile = "test_griddims.nc"

  write(*,*) "=== Test: Grid Dimensions ==="

  ! --- Create a test file with known dimensions ---
  grid_out%varname   = "elevation"
  grid_out%lonname   = "lon"
  grid_out%latname   = "lat"
  grid_out%long_name = "Test Elevation"
  grid_out%varunits  = "m"
  grid_out%lonunits  = "degrees_east"
  grid_out%latunits  = "degrees_north"
  grid_out%FillValue = -9999.0

  call gengrid(grid_out, -60.0, -30.0, -50.0, -20.0, 0.5)

  ! Fill with data so writegrid has something to write
  grid_out%ncdata = 100.0

  call writegrid(testfile, grid_out)

  ! --- Read dimensions only ---
  grid_dims%varname = "elevation"
  grid_dims%lonname = "lon"
  grid_dims%latname = "lat"

  call griddims(testfile, grid_dims)

  ! Verify dimensions
  if (grid_dims%nlons /= grid_out%nlons) then
    write(*,*) "FAIL: nlons =", grid_dims%nlons, " expected", grid_out%nlons
    failures = failures + 1
  else
    write(*,*) "PASS: nlons =", grid_dims%nlons
  end if

  if (grid_dims%nlats /= grid_out%nlats) then
    write(*,*) "FAIL: nlats =", grid_dims%nlats, " expected", grid_out%nlats
    failures = failures + 1
  else
    write(*,*) "PASS: nlats =", grid_dims%nlats
  end if

  if (grid_dims%ndims /= 2) then
    write(*,*) "FAIL: ndims =", grid_dims%ndims, " expected 2"
    failures = failures + 1
  else
    write(*,*) "PASS: ndims =", grid_dims%ndims
  end if

  ! Verify variable type (should be NF90_FLOAT = 5)
  if (grid_dims%vartype /= 5) then
    write(*,*) "FAIL: vartype =", grid_dims%vartype, " expected 5 (NF90_FLOAT)"
    failures = failures + 1
  else
    write(*,*) "PASS: vartype =", grid_dims%vartype
  end if

  ! Verify FillValue was read
  if (abs(grid_dims%FillValue - (-9999.0)) > 0.01) then
    write(*,*) "FAIL: FillValue =", grid_dims%FillValue, " expected -9999.0"
    failures = failures + 1
  else
    write(*,*) "PASS: FillValue =", grid_dims%FillValue
  end if

  call dealloc(grid_out)
  ! griddims allocates dimid, dimsize, etc. - deallocate what was allocated
  if (allocated(grid_dims%dimid)) deallocate(grid_dims%dimid)
  if (allocated(grid_dims%dimsize)) deallocate(grid_dims%dimsize)
  if (allocated(grid_dims%dimname)) deallocate(grid_dims%dimname)
  if (allocated(grid_dims%dimunits)) deallocate(grid_dims%dimunits)
  if (allocated(grid_dims%varids)) deallocate(grid_dims%varids)

  ! Clean up
  open(unit=99, file=testfile, status='old')
  close(unit=99, status='delete')

  ! --- Summary ---
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All grid dimensions tests passed."
  end if

end program test_griddims
