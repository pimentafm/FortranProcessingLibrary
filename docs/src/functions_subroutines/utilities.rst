.. highlight:: fortran
   :linenothreshold: 2

File Utilities
--------------

Functions and subroutines for text files handling tasks.


file_exists
```````````

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

count_keys
``````````

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

readheader
``````````

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

numRows
```````

::
  
  !:=== row number counter.
  function numRows(fileunit) result(nrows)
    integer(kind=4) :: fileunit, nrows
    nrows = 0
    do
      read(fileunit, *, end=101)
      nrows = nrows + 1
    end do
  101 continue
    rewind(fileunit)
  end function numRows

Time Utilities
--------------

Functions and subroutines for date and time tasks.

fdate_time
``````````

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

exec_time
`````````

::

  subroutine exec_time(time)
    real(kind=4) :: time
    character(len=10) :: t

    call date_and_time(TIME=t) 
    read(t, *)time
  end subroutine exec_time


Sorting Utilities
-----------------

bubbleSort
``````````

::

  Subroutine Order(p,q, dp, dq)
    integer p,q,temp
    character(len=100) :: dp, dq, tempd
    if (p>q) then
      temp=p
      tempd=dp
      p=q
      dp=dq
      q=temp
      dq=tempd
    end if
  end subroutine Order
  
  Subroutine bubbleSort(dimid, dimname, n)
    integer dimid(1:n), j, n, i
    character(len=100) :: dimname(1:n)
    do i=1, n
      do j=n, i+1, -1
        call Order(dimid(j-1), dimid(j), dimname(j-1), dimname(j))
      end do
    end do
  end subroutine bubbleSort
