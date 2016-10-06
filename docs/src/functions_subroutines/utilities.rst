Utilities
---------

.. highlight:: fortran
   :linenothreshold: 2

File Utilities
``````````````

Functions and subroutines for text files handling tasks.

::

  !:=== Checks if file exists.
  subroutine file_exists(ifile)
    logical :: fexist
    character(*) :: ifile
  
    inquire(file=ifile, exist=fexist)
    
    if(.not.fexist)then
      write(*,*)"Header file don't exist"
      stop
    end if
  end subroutine file_exists

::
  
  !:=== This subroutine counts existing keys within a file.
  subroutine countkeys(ifile, nkeys)
    character(*) :: ifile
    character(300) :: inline
    integer(kind = 4) :: stats, nkeys
  
    open(100, file=ifile, status="old", action="read", position="rewind")
  
    loop: do
      read(100, '(a)', iostat=stats) inline
  
      if(stats < 0)then
        exit loop
      end if
  
      if(inline(1:1).eq.'[')then
        nkeys = nkeys + 1
      end if
  
    end do loop
    close(100)
  end subroutine countkeys

::
  
  !:=== Allocate attributes and contents into arrays.
  subroutine readheader(hfile, attribute, content)
    character(len=*) :: hfile
    character(len=200) :: inline
    character(len=*), dimension(:), allocatable :: attribute, content
    integer :: stats, n
  
    open(100, file=hfile, status="old", action="read", position="rewind")
  
    !:==== Read number of attribute keylines and the content of all keylines
    n = 0
    keys: do
      read(100, '(a)', iostat=stats) inline
  
      if(stats < 0)then
        exit keys
      end if
      !:==== Remove brackets '[ ]'
      if(inline(1:1).eq.'[')then
        n = n + 1
        attribute(n) = trim(adjustl(inline(2:len_trim(inline)-1)))
      end if
      if(inline(1:1).ne.'['.and.len_trim(inline).ne.0)then
          content(n) = trim(adjustl(inline))
      end if
    end do keys
    close(100)
  end subroutine readheader

::
  
  !:=== Line number counter.
  function lineNumber(sourcefile) result(nlines)
    character(len=*), intent(in) :: sourcefile
    integer(kind=4)  :: nlines
  
    open(100, file=sourcefile, status='old')
      nlines = 0
      do
        read(100, *, end=101)
        nlines = nlines + 1
      end do
  101 continue
      rewind(100)
  end function lineNumber

Time Utilities
``````````````

Functions and subroutines for date and time tasks.

::

  !Date and Time subroutine
  subroutine fdate_time(sysdatetime)
    integer(kind=4) :: date(3), systime(3)
    integer :: i
    character(len=3), dimension(12) :: month
    character(len=3) :: sysmonth
    character(len=2) :: strday
    character(len=4) :: stryear
    character(len=2) :: strhour
    character(len=2) :: strmin
    character(len=2) :: strsec
    character(len=21), intent(out) :: sysdatetime

    month = (/'Jan','Feb','Mar','Apr','May','Jun', 'Jul','Aug','Sep', &
              'Oct','Nov','Dec'/)

    call idate(date)    !date(1) = day, date(2) = month, date(3) = year
    call itime(systime) !systime(1) = hour, systime(2) = minute, systime(3) = second

    do i = 1, 12
      if(date(2).eq.i) sysmonth = month(i)
    end do

    !Integer to Character
    write (strday, '(i2)') date(1)
    write (stryear, '(i4)') date(3)
    write (strhour, '(i2.2)') systime(1)
    write (strmin, '(i2.2)') systime(2)
    write (strsec, '(i2.2)') systime(3)
    sysdatetime = sysmonth//" "//strday//" "//stryear//" "//strhour//':'//strmin//':'//strsec
  end subroutine fdate_time

::

  subroutine exec_time(time)
    real(kind=4) :: time
    character(len=10) :: t

    call date_and_time(TIME=t) 
    read(t, *)time
  end subroutine exec_time
