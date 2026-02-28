program test_readgrid
  use fpl
  implicit none

  type(nc3d_float_llf_ti) :: grid_out, grid_in
  integer :: failures, i, j, k
  character(200) :: testfile

  failures = 0
  testfile = "test_readgrid_3d.nc"

  write(*,*) "=== Test: Read Grid (3D) ==="

  ! --- Generate a 3D grid, write it, then read and verify ---
  grid_out%varname   = "precipitation"
  grid_out%lonname   = "lon"
  grid_out%latname   = "lat"
  grid_out%timename  = "time"
  grid_out%long_name = "Test Precipitation"
  grid_out%varunits  = "mm"
  grid_out%lonunits  = "degrees_east"
  grid_out%latunits  = "degrees_north"
  grid_out%timeunits = "days"
  grid_out%ntimes    = 3
  grid_out%FillValue = -9999.0

  call gengrid(grid_out, -45.0, -15.0, -40.0, -10.0, 1.0)

  ! Fill with known data
  do k = 1, grid_out%ntimes
    do j = 1, grid_out%nlats
      do i = 1, grid_out%nlons
        grid_out%ncdata(i,j,k) = real(i + j * 10 + k * 100)
      end do
    end do
  end do

  call writegrid(testfile, grid_out)

  ! Read back
  grid_in%varname  = "precipitation"
  grid_in%lonname  = "lon"
  grid_in%latname  = "lat"
  grid_in%timename = "time"

  call readgrid(testfile, grid_in)

  ! Verify dimensions
  if (grid_in%nlons /= grid_out%nlons) then
    write(*,*) "FAIL: nlons mismatch:", grid_in%nlons, "vs", grid_out%nlons
    failures = failures + 1
  else
    write(*,*) "PASS: nlons =", grid_in%nlons
  end if

  if (grid_in%nlats /= grid_out%nlats) then
    write(*,*) "FAIL: nlats mismatch:", grid_in%nlats, "vs", grid_out%nlats
    failures = failures + 1
  else
    write(*,*) "PASS: nlats =", grid_in%nlats
  end if

  if (grid_in%ntimes /= grid_out%ntimes) then
    write(*,*) "FAIL: ntimes mismatch:", grid_in%ntimes, "vs", grid_out%ntimes
    failures = failures + 1
  else
    write(*,*) "PASS: ntimes =", grid_in%ntimes
  end if

  ! Verify data at several points
  if (abs(grid_in%ncdata(1,1,1) - grid_out%ncdata(1,1,1)) > 0.01) then
    write(*,*) "FAIL: ncdata(1,1,1) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: ncdata(1,1,1) =", grid_in%ncdata(1,1,1)
  end if

  if (abs(grid_in%ncdata(3,3,2) - grid_out%ncdata(3,3,2)) > 0.01) then
    write(*,*) "FAIL: ncdata(3,3,2) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: ncdata(3,3,2) =", grid_in%ncdata(3,3,2)
  end if

  if (abs(grid_in%ncdata(grid_in%nlons, grid_in%nlats, grid_in%ntimes) - &
          grid_out%ncdata(grid_out%nlons, grid_out%nlats, grid_out%ntimes)) > 0.01) then
    write(*,*) "FAIL: ncdata(end,end,end) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: ncdata(end,end,end) =", &
               grid_in%ncdata(grid_in%nlons, grid_in%nlats, grid_in%ntimes)
  end if

  ! Verify coordinates
  if (abs(grid_in%longitudes(1) - grid_out%longitudes(1)) > 0.01) then
    write(*,*) "FAIL: longitudes(1) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: longitudes(1) =", grid_in%longitudes(1)
  end if

  if (abs(grid_in%latitudes(grid_in%nlats) - grid_out%latitudes(grid_out%nlats)) > 0.01) then
    write(*,*) "FAIL: latitudes(end) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: latitudes(end) =", grid_in%latitudes(grid_in%nlats)
  end if

  call dealloc(grid_out)
  call dealloc(grid_in)

  ! Clean up
  open(unit=99, file=testfile, status='old')
  close(unit=99, status='delete')

  ! --- Summary ---
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All read grid tests passed."
  end if

end program test_readgrid
