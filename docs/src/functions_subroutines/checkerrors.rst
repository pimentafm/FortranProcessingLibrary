Check Error Subroutines
-----------------------

.. highlight:: fortran
   :linenothreshold: 2

Customized Subroutines was developed for checking errors to facilitate the identification of problems in I/O processing.

General checkerror
``````````````````

:: 

  !General check
  subroutine checkerror(ncstatus)
    integer, intent(in) :: ncstatus
    if(ncstatus.ne.nf90_noerr)then
      write(*,*) achar(27)//"[1"//achar(59)// &
                 "91m"//trim(adjustl(nf90_strerror(ncstatus)))//achar(27)//"[0m"
      stop
    end if
  end subroutine checkerror

.. note::
   
  **checkerror** subroutine returns status value indicates an error. You can handle it in any way desired to printing an associated error message likewise the subroutines below. 

checkvarid
``````````

Check if a variable name exists in a NetCDF file.

::
  
  !Check nf90_inq_varid and nf90_inq_dimid -> ncf90api_griddims.f90 =============
  !These subroutine was not added in ncf90api_interfaces.f90 because it's ambiguous with checkatt.
  subroutine checkvarid(ncstatus, varname)
    integer, intent(in) :: ncstatus
    character(*), intent(in) :: varname
    if(ncstatus.ne.nf90_noerr)then
      write(*,*) achar(27)//"[1"//achar(59)// &
                 "91m"//trim(adjustl(nf90_strerror(ncstatus)))//achar(27)//"[0m"
      write(*,*) achar(27)//"[0"//achar(59)// &
                 "91m        "//trim(adjustl(varname))//" does not exist"//achar(27)//"[0m"
      write(*,*) achar(27)//"[0"//achar(59)// &
                 "94mAdd the correct name of the variable."//achar(27)//"[0m"
      stop
    end if
  end subroutine checkvarid

checkdimid
``````````

Check if a dimension name exists in a NetCDF file.

::
  
  subroutine checkdimid(ncstatus, dimname)
    integer, intent(in) :: ncstatus
    character(*), intent(in) :: dimname
    if(ncstatus.ne.nf90_noerr)then
      write(*,*) achar(27)//"[1"//achar(59)// &
                 "91m"//trim(adjustl(nf90_strerror(ncstatus)))//achar(27)//"[0m"
      write(*,*) achar(27)//"[0"//achar(59)// &
                 "91m        "//trim(adjustl(dimname))//" does not exist!"//achar(27)//"[0m"
      write(*,*) achar(27)//"[0"//achar(59)// &
                 "94m        Add the correct name of the dimension."//achar(27)//"[0m"
      stop
    end if
  end subroutine checkdimid

checktype
`````````

Check if the data type declared is the same data to be read.

::
  
  !Check nf90_get_var -> ncf90api_readgrid.f90 ===================================
  subroutine checktype(ncstatus, rvar, dvar, ifile)
    integer, intent(in) :: ncstatus, rvar
    character(*), intent(in) :: dvar, ifile
    character(len(dvar)) :: dvaraux
  
    if(rvar.eq.6) dvaraux = "DOUBLE"
    if(rvar.eq.5) dvaraux = "FLOAT"
    if(rvar.eq.4) dvaraux = "INTEGER"
    if(rvar.eq.3) dvaraux = "SHORT"
    if(rvar.eq.1) dvaraux = "BYTE"
  
    if(dvar.ne.dvaraux)then !.and.ncstatus.eq.nf90_noerr
      write(*,*) trim(adjustl(nf90_strerror(ncstatus)))
      write(*,*) achar(27)//"[1"//achar(59)// &
                 "91m Check data type of the input file and data type declared!" &
                 //achar(27)//"[0m"
      select case (rvar)
        case (6)
          write(*,*) achar(27)//"[0"//achar(59)// &
                     "91m WARNING: Input type: DOUBLE | Declared type: " &
                     //trim(adjustl(dvar))//achar(27)//"[0m"
        case (5)
          write(*,*) achar(27)//"[0"//achar(59)// &
                     "91m WARNING: Input type: FLOAT | Declared type: " &
                     //trim(adjustl(dvar))//achar(27)//"[0m"
        case (4)
          write(*,*) achar(27)//"[0"//achar(59)// &
                     "91m WARNING: Input type: INTEGER | Declared type: " &
                     //trim(adjustl(dvar))//achar(27)//"[0m"
        case (3)
          write(*,*) achar(27)//"[0"//achar(59)// &
                     "91m WARNING: Input type: SHORT | Declared type: " &
                     //trim(adjustl(dvar))//achar(27)//"[0m"
        case (1)
          write(*,*) achar(27)//"[0"//achar(59)// &
                     "91m WARNING: Input type: BYTE | Declared type: " &
                     //trim(adjustl(dvar))//achar(27)//"[0m"
      end select
      call system(" echo "//trim(adjustl(ifile))//" | sed 's/.*\// File: /'")
      stop
    end if
  end subroutine checktype

checkatt
````````

Check if some attributes exist within the netcdf file.


::
  
  !Check nf90_get_att -> ncf90api_readgrid.f90 ==================================
  subroutine checkatt(ncstatus, uname, ifile)
    integer, intent(in) :: ncstatus
    character(*), intent(in) :: uname, ifile
    
    if(ncstatus.ne.nf90_noerr)then
      if(uname.eq."_FillValue")then
        write(*,*) achar(27)//"[1"//achar(59)// &
                   "91m FAULT: Declare _FillValue in your NetCDF!" &
                   //achar(27)//"[0m"  
        write(*,*) achar(27)//"[1"//achar(59)// &
                   "94m Use the GDAL Library to add _FillValue into your file!" &
                   //achar(27)//"[0m"
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "94m  Try this: gdal_translate -of netcdf -a_nodata <nodata_value> input.nc output.nc" &
                   //achar(27)//"[0m"  
        call system(" echo "//trim(adjustl(ifile))//" | sed 's/.*\// File: /'")
        stop
        else
          write(*,*)trim(adjustl(nf90_strerror(ncstatus)))
          write(*,*) achar(27)//"[38"//achar(59)//"5"//achar(59)// &
                     "166m WARNING: Declare "//trim(adjustl(uname))//" in your NetCDF!" &
                     //achar(27)//"[0m"
          write(*,*) achar(27)//"[1"//achar(59)// &
                     "94m You can set "//trim(adjustl(uname))//" into your NetCDF file" &
                     //achar(27)//"[0m"
          write(*,*) achar(27)//"[1"//achar(59)//"94m or set it into your code!" &
                     //achar(27)//"[0m"
          write(*,*) achar(27)//"[0"//achar(59)//"94m       Example: "//achar(27)//"[0m"
          write(*,*) achar(27)//"[0"//achar(59)// &
                     "94m       If you declared type(nc2d_<type>) :: yourdata"//achar(27)//"[0m"
          write(*,*) achar(27)//"[0"//achar(59)// &
                     "94m         Set in your file: yourdata%"//trim(adjustl(uname))// &
                     " = units (degrees, km, ...)"//achar(27)//"[0m"
          call system(" echo "//trim(adjustl(ifile))//" | sed 's/.*\// File: /'")
      end if
    end if
  end subroutine checkatt
  !==============================================================================
