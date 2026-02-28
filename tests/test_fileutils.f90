program test_fileutils
  use fpl
  implicit none

  integer :: failures, nrows, nkeys
  logical :: exists

  failures = 0

  write(*,*) "=== Test: File Utilities ==="

  ! --- Test file_exists with an existing file ---
  exists = file_exists("testdata/data.txt")
  if (.not. exists) then
    write(*,*) "FAIL: file_exists('testdata/data.txt') returned .false."
    failures = failures + 1
  else
    write(*,*) "PASS: file_exists('testdata/data.txt') returned .true."
  end if

  ! --- Test file_exists with a nonexistent file ---
  exists = file_exists("testdata/nonexistent_file.xyz")
  if (exists) then
    write(*,*) "FAIL: file_exists('nonexistent_file.xyz') returned .true."
    failures = failures + 1
  else
    write(*,*) "PASS: file_exists('nonexistent_file.xyz') returned .false."
  end if

  ! --- Test numRows ---
  open(100, file="testdata/data.txt", status="old")
  nrows = numRows(100)
  close(100)

  if (nrows /= 6) then
    write(*,*) "FAIL: numRows('testdata/data.txt') =", nrows, " expected 6"
    failures = failures + 1
  else
    write(*,*) "PASS: numRows('testdata/data.txt') =", nrows
  end if

  ! --- Test countkeys ---
  nkeys = 0
  call countkeys("testdata/gridHeader.txt", nkeys)

  if (nkeys /= 2) then
    write(*,*) "FAIL: countkeys('testdata/gridHeader.txt') =", nkeys, " expected 2"
    failures = failures + 1
  else
    write(*,*) "PASS: countkeys('testdata/gridHeader.txt') =", nkeys
  end if

  ! --- Test countkeys with diasetal header ---
  nkeys = 0
  call countkeys("testdata/diasetal_headerfile.txt", nkeys)

  if (nkeys /= 6) then
    write(*,*) "FAIL: countkeys('testdata/diasetal_headerfile.txt') =", nkeys, " expected 6"
    failures = failures + 1
  else
    write(*,*) "PASS: countkeys('testdata/diasetal_headerfile.txt') =", nkeys
  end if

  ! --- Summary ---
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All file utilities tests passed."
  end if

end program test_fileutils
