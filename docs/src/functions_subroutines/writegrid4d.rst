writegrid4d (4-dimensional Dataset)
```````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

writegrid4d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to write a 4-dimensional NetCDF dataset into a file. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
defined in the **f90NetCDF** library (``[byte, short, int, float, double]``), ``[cdt]`` by a defined suffix 
for the data type of the coordinates (``f`` for float and ``d`` for double), ``[tdt]`` by a defined suffix 
for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double) and ``[ldt]`` for a level suffix ((``f`` for float and ``d`` for double).

writegrid4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` (ifile, idata)
------------------------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``d``)
 :``[ldt]``: level datatype (integer ``i``, float ``f``)
:Subroutine Parameters:
 :``ofile``: file path `[character]` 
 :``odata``: 4d dataset structure `[f90NetCDF defined type structure]` 
 :``headerfile``: text file `[character]` `[optional]`
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``ldimid``: level dimension ID `[integer]`
 :``tdimid``: time dimension ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``dimids``: Array of dimension IDs corresponding to the variable dimensions `[integer]`
 :``lvarid``: level array ID `[integer]`
 :``tvarid``: time array ID `[integer]`
 :``xvarid``: longitude array ID `[integer]`
 :``yvarid``: latitude array ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
 :``headerfile``: text file `[character]`
 :``attribute``: attribute text from ``headerfile`` `[character]`
 :``content``: content text from ``headerfile`` `[character]`
 :``nkeys``: key number identification from text into ``headerfile`` `[integer]`
:Result:
 Save data into a NetCDF file format.

**Example:**

Write a 4-dimensional NetCDF dataset with variable declared as short coordinates declared as float and time declared, float and level declared as integer (writegrid4d _ ``short`` _ll ``f`` _t ``f`` _l ``i``).

::


  !NetCDF <variable short> (longitude <float>, latitude <float>, time <float>, level <int>)
  subroutine writegrid4d_short_llf_tf_li(ofile, odata, headerfile)
    character(*), intent(in) :: ofile
    character(*),  optional, intent(in) :: headerfile
    character(len=21) :: sysdatetime
    type(nc4d_short_llf_tf_li) :: odata
    integer(kind=intgr) :: ncid, varid, ldimid, tdimid, xdimid, ydimid, lvarid, tvarid, xvarid, yvarid
    integer(kind=intgr), dimension(4) :: dimids
  
    !:=== Header file
    character(len=100), dimension(:), allocatable :: attribute, content
    integer(kind=4) :: nkeys
    nkeys = 0
  
    !Create Netcdf
    call check(nf90_create(ofile, nf90_clobber, ncid))
  
    !Define dimensions
    call check(nf90_def_dim(ncid, odata%levelname, odata%nlevels, ldimid))
    call check(nf90_def_dim(ncid, odata%timename, odata%ntimes, tdimid))
    call check(nf90_def_dim(ncid, odata%lonname, odata%nlons, xdimid))
    call check(nf90_def_dim(ncid, odata%latname, odata%nlats, ydimid))
    dimids = (/xdimid, ydimid, tdimid, ldimid/)
  
    !Define variables
    call check(nf90_def_var(ncid, odata%levelname, nf90_int, ldimid, lvarid))
    call check(nf90_put_att(ncid, lvarid, "units", odata%levelunits))
    
    call check(nf90_def_var(ncid, odata%timename, nf90_float, tdimid, tvarid))
    call check(nf90_put_att(ncid, tvarid, "units", odata%timeunits))
  
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
  
    !Write times
    call check(nf90_put_var(ncid, lvarid, odata%levels))
  
    !Write times
    call check(nf90_put_var(ncid, tvarid, odata%times))
   
    !Write longitudes
    call check(nf90_put_var(ncid, xvarid, odata%longitudes))
  
    !Write latitudes
    call check(nf90_put_var(ncid, yvarid, odata%latitudes))
  
    !Write variable
    call check(nf90_put_var(ncid, varid, odata%ncdata))
  
    call check(nf90_close(ncid))
  end subroutine writegrid4d_short_llf_tf_li
