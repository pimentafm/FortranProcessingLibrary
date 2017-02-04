writegrid3d (3-dimensional Dataset)
```````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

writegrid3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` subroutine is used to write a 3-dimensional NetCDF dataset into a file. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **FPL** library (``[byte, short, int, float, double]``), 
``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double and
``[tdt]`` by a defined suffix for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double).

writegrid3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` (ifile, idata)
-----------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``d``)
:Subroutine Parameters:
 :``ofile``: file path `[character]` 
 :``odata``: 2d dataset structure. See :ref:`structurefields`. 
 :``headerfile``: text file `[character]` `[optional]`
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``tdimid``: time dimension ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``dimids``: Array of dimension IDs corresponding to the variable dimensions `[integer]`
 :``tvarid``: time array ID `[integer]`
 :``xvarid``: longitude array ID `[integer]`
 :``yvarid``: latitude array ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
 :``attribute``: attribute text from ``headerfile`` `[character]`
 :``content``: content text from ``headerfile`` `[character]`
 :``nkeys``: number of attributes of ``headerfile`` `[integer]`
:Result:
 Save data into a NetCDF file format.

**Example:**

Write a 3-dimensional NetCDF dataset with variable declared as short coordinates declared as float and time declared as integer (writegrid3d _ ``short`` _ll ``f`` _t ``i``).

::

  subroutine writegrid3d_short_llf_ti(ofile, odata, headerfile)
    character(*), intent(in) :: ofile
    character(*),  optional, intent(in) :: headerfile
    character(len=21) :: sysdatetime
    type(nc3d_short_llf_ti) :: odata
    integer(kind=intgr) :: ncid, varid, i
  
    !:=== Header file
    character(len=100), dimension(:), allocatable :: attribute, content
    integer(kind=4) :: nkeys
    nkeys = 0
  
    !Create Netcdf
    call check(nf90_create(ofile, nf90_clobber, ncid))
  
    !Define dimensions
  
    do i = 1, odata%ndims
      call check(nf90_def_dim(ncid, odata%dimname(i), odata%dimsize(i), odata%dimid(i)))
    end do
  
    !Define variables
    call check(nf90_def_var(ncid, odata%dimname(1), nf90_float, odata%dimid(1), odata%varids(1)))
    call check(nf90_put_att(ncid, odata%varids(1), "units", odata%dimunits(1)))
    
    call check(nf90_def_var(ncid, odata%dimname(2), nf90_float, odata%dimid(2), odata%varids(2)))
    call check(nf90_put_att(ncid, odata%varids(2), "units", odata%dimunits(2)))
  
    call check(nf90_def_var(ncid, odata%dimname(3), nf90_int, odata%dimid(3), odata%varids(3)))
    call check(nf90_put_att(ncid, odata%varids(3), "units", odata%dimunits(3)))
  
  
    call check(nf90_def_var(ncid, odata%varname, odata%vartype, odata%dims, varid))
    call check(nf90_put_att(ncid, varid, "long_name", odata%long_name))
    call check(nf90_put_att(ncid, varid, "_FillValue", odata%FillValue))
           
    call check(nf90_put_att(ncid, varid, "valid_min", & 
               minval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
    call check(nf90_put_att(ncid, varid, "valid_max", & 
               maxval(odata%ncdata, mask=odata%ncdata.ne.odata%FillValue)))
  
    call check(nf90_put_att(ncid, varid, "units", odata%varunits))
  
    !Put Global Attributes
    call fdate_time(sysdatetime)
    call check(nf90_put_att(ncid, nf90_global, "History", sysdatetime//fpl_libversion()))
    call check(nf90_put_att(ncid, nf90_global, "NetCDF-Version", trim(nf90_inq_libvers())))
   
    !Check if headerfile was setted
    if(present(headerfile))then
      if(file_exists(headerfile))then !Check if headerfile exists
        call countkeys(headerfile, nkeys)!Count number of keys inside headerfile
  
        allocate(attribute(nkeys))
        allocate(content(nkeys))
  
        call readheader(headerfile, attribute, content) !Allocate the content of keys into arrays
  
        do nkeys = 1, size(attribute) !Put the attrubutes and contents into netcdf
          call check(nf90_put_att(ncid, nf90_global, attribute(nkeys), content(nkeys)))
        end do
      end if
    end if
    call check(nf90_enddef(ncid))
  
    !Write times, levels, lats and lons
    do i = 1, odata%ndims
      if(odata%dimname(i).eq."longitude".or.odata%dimname(i).eq."lon") then
        call check(nf90_put_var(ncid, odata%varids(i), odata%longitudes))
      end if
      if(odata%dimname(i).eq."latitude".or.odata%dimname(i).eq."lat") then
        call check(nf90_put_var(ncid, odata%varids(i), odata%latitudes))
      end if
      if(odata%dimname(i).eq."time") then
        call check(nf90_put_var(ncid, odata%varids(i), odata%times))
      end if
    end do
  
    !Write variable
    call check(nf90_put_var(ncid, varid, odata%ncdata))
  
    call check(nf90_close(ncid))
  end subroutine writegrid3d_short_llf_ti

