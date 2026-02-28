program test_writegrid
  use fpl
  implicit none

  type(nc2d_float_llf) :: grid_out, grid_in
  integer :: failures, i, j
  character(200) :: testfile

  failures = 0
  testfile = "test_output_2d.nc"

  write(*,*) "=== Test: Write Grid (round-trip) ==="

  ! --- Generate a 2D grid, fill with known data, write, read back ---
  grid_out%varname   = "temperature"
  grid_out%lonname   = "lon"
  grid_out%latname   = "lat"
  grid_out%long_name = "Test Temperature"
  grid_out%varunits  = "K"
  grid_out%lonunits  = "degrees_east"
  grid_out%latunits  = "degrees_north"
  grid_out%FillValue = -9999.0

  call gengrid(grid_out, -10.0, -5.0, 10.0, 5.0, 1.0)

  ! Fill with deterministic data
  do j = 1, grid_out%nlats
    do i = 1, grid_out%nlons
      grid_out%ncdata(i,j) = real(i * 100 + j)
    end do
  end do

  ! Write to file
  call writegrid(testfile, grid_out)

  write(*,*) "PASS: writegrid completed without error"

  ! Read back
  grid_in%varname = "temperature"
  grid_in%lonname = "lon"
  grid_in%latname = "lat"

  call readgrid(testfile, grid_in)

  ! Verify dimensions
  if (grid_in%nlons /= grid_out%nlons) then
    write(*,*) "FAIL: nlons mismatch:", grid_in%nlons, "vs", grid_out%nlons
    failures = failures + 1
  else
    write(*,*) "PASS: nlons match =", grid_in%nlons
  end if

  if (grid_in%nlats /= grid_out%nlats) then
    write(*,*) "FAIL: nlats mismatch:", grid_in%nlats, "vs", grid_out%nlats
    failures = failures + 1
  else
    write(*,*) "PASS: nlats match =", grid_in%nlats
  end if

  ! Verify data values (spot check corners and center)
  if (abs(grid_in%ncdata(1,1) - grid_out%ncdata(1,1)) > 0.01) then
    write(*,*) "FAIL: ncdata(1,1) mismatch:", grid_in%ncdata(1,1), "vs", grid_out%ncdata(1,1)
    failures = failures + 1
  else
    write(*,*) "PASS: ncdata(1,1) =", grid_in%ncdata(1,1)
  end if

  if (abs(grid_in%ncdata(grid_in%nlons, grid_in%nlats) - &
          grid_out%ncdata(grid_out%nlons, grid_out%nlats)) > 0.01) then
    write(*,*) "FAIL: ncdata(nlons,nlats) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: ncdata(nlons,nlats) =", grid_in%ncdata(grid_in%nlons, grid_in%nlats)
  end if

  ! Verify coordinates
  if (abs(grid_in%longitudes(1) - grid_out%longitudes(1)) > 0.01) then
    write(*,*) "FAIL: longitudes(1) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: longitudes(1) =", grid_in%longitudes(1)
  end if

  if (abs(grid_in%latitudes(1) - grid_out%latitudes(1)) > 0.01) then
    write(*,*) "FAIL: latitudes(1) mismatch"
    failures = failures + 1
  else
    write(*,*) "PASS: latitudes(1) =", grid_in%latitudes(1)
  end if

  ! Verify FillValue
  if (abs(grid_in%FillValue - grid_out%FillValue) > 0.01) then
    write(*,*) "FAIL: FillValue mismatch:", grid_in%FillValue, "vs", grid_out%FillValue
    failures = failures + 1
  else
    write(*,*) "PASS: FillValue =", grid_in%FillValue
  end if

  call dealloc(grid_out)
  call dealloc(grid_in)

  ! Clean up test file
  open(unit=99, file=testfile, status='old')
  close(unit=99, status='delete')

  ! --- Summary ---
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All write grid round-trip tests passed."
  end if

end program test_writegrid
