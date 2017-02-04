!:==================== File utilities =========================================
program utils
  use fpl
  implicit none

  integer(kind=4) :: nrows

  write(*,*) "Count line number"
  write(*,*) "============================"

  if(file_exists("database/data.txt")) then
    write(*,*) "File OK!"
    open(100, file="database/data.txt", status="old")
  end if

  nrows = numRows(100)

  write(*,*) nrows, file_exists("database/data.txt")

end program utils
