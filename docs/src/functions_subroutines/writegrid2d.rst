writegrid2d (2-dimensional Dataset)
```````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

writegrid2d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to write a 2-dimensional NetCDF dataset into a file. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **f90NetCDF** library (``[byte, short, int, float, double]``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates (``f`` for float and ``d`` for double).

writegrid2d _ ``[vdt]`` _ll ``[cdt]`` (ifile, idata)
----------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
:Subroutine Parameters:
 :``ofile``: file path `[character]` 
 :``odata``: 2d dataset structure `[f90NetCDF defined type structure]` 
 :``headerfile``: text file `[character]` `[optional]`
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``dimids``: Array of dimension IDs corresponding to the variable dimensions `[integer]`
 :``xvarid``: longitude array ID `[integer]`
 :``yvarid``: latitude array ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
 :``headerfile``:
 :``attribute``:
 :``content``:
 :``nkeys``:
:Result:
 Save data into a NetCDF file format.

**Example:**

Write a 2-dimensional NetCDF dataset with variable declared as integer and coordinates declared as float (writegrid2d _ ``int`` _ll ``f``).

::

  !NetCDF <variable int> (longitude <float>, latitude <float>)
  subroutine writegrid2d_int_llf(ofile, odata, headerfile)
    character(*), intent(in) :: ofile
    character(*),  optional, intent(in) :: headerfile
    character(len=21) :: sysdatetime
    type(nc2d_int_llf) :: odata
    integer(kind=intgr) :: ncid, varid, xdimid, ydimid, xvarid, yvarid
    integer(kind=intgr), dimension(2) :: dimids
  
    !:=== Header file
    character(len=100), dimension(:), allocatable :: attribute, content
    integer(kind=4) :: nkeys
    nkeys = 0
  
    !Create Netcdf
    call check(nf90_create(ofile, nf90_clobber, ncid))
  
    !Define dimensions
    call check(nf90_def_dim(ncid, odata%lonname, odata%nlons, xdimid))
    call check(nf90_def_dim(ncid, odata%latname, odata%nlats, ydimid))
    dimids = (/xdimid, ydimid/)
  
    !Define variables
    call check(nf90_def_var(ncid, odata%lonname, nf90_float, xdimid, xvarid))
    call check(nf90_put_att(ncid, xvarid, "units", odata%lonunits))
  
    call check(nf90_def_var(ncid, odata%latname, nf90_float, ydimid, yvarid))
    call check(nf90_put_att(ncid, yvarid, "units", odata%latunits))
  
    call check(nf90_def_var(ncid, odata%varname, odata%vartype, dimids, varid))
    call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
    call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
           
    call check(nf90_put_att(ncid, varid, "valid_min", & 
               minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
    call check(nf90_put_att(ncid, varid, "valid_max", & 
               maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  
    call check(nf90_put_att(ncid, varid, "units", odata%varunits))
   
    !Put Global Attributes
    call fdate_time(sysdatetime)
    call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//" Created by f90NetCDF API v0.1"))
    call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
    
   !Check if headerfile was setted
    if(present(headerfile))then
      call file_exists(headerfile) !Check if headerfile exists
      call countkeys(headerfile, nkeys)!Count number of keys inside headerfile
  
      allocate(attribute(nkeys))
      allocate(content(nkeys))
  
      call readheader(headerfile, attribute, content) !Allocate the content of keys into arrays
  
      do nkeys = 1, size(attribute) !Put the attrubutes and contents into netcdf
        call check(nf90_put_att(ncid, nf90_global, attribute(nkeys), content(nkeys)))
      end do
    end if
    call check(nf90_enddef(ncid))
   
    !Write longitudes
    call check(nf90_put_var(ncid, xvarid, odata%longitudes))
  
    !Write latitudes
    call check(nf90_put_var(ncid, yvarid, odata%latitudes))
  
    !Write variable
    call check(nf90_put_var(ncid, varid, odata%ncdata))
  
    call check(nf90_close(ncid))
  end subroutine writegrid2d_int_llf
