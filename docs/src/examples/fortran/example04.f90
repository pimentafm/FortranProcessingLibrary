! FPL - Example 04
!
! Purpose:       Checks if file exists and count its number of rows
! FPL datatypes:  
! FPL tools:     file_exist, numRows  

program utils
  use fpl
  implicit none

  integer(kind=4) :: nrows

  write(*,*) "Count line number"
  write(*,*) "============================"

  !Checks if file exists
  if(file_exists("database/data.txt")) then
    write(*,*) "File OK!"
    open(100, file="database/data.txt", status="old")
  end if

  !Count line numbers
  nrows = numRows(100)

  write(*,*) nrows, file_exists("database/data.txt")

end program utils
