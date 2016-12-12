!:==================== File utilities =========================================
program utils
  use fpl
  implicit none

  integer(kind=4) :: nlines

  write(*,*) "Count line number"
  write(*,*) "============================"

  if(file_exists("database/data.txt")) then
    write(*,*) "File OK!"
    open(100, file="database/data.txt", status="old")
  end if

  nlines = lineNumber(100)

  write(*,*) nlines, file_exists("database/data.txt")

end program utils
