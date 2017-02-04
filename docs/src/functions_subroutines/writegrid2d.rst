writegrid2d (2-dimensional Dataset)
```````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

writegrid2d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to write a 2-dimensional NetCDF dataset into a file. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **FPL** library (``[byte, short, int, float, double]``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates (``f`` for float and ``d`` for double).

writegrid2d _ ``[vdt]`` _ll ``[cdt]`` (ifile, idata)
----------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
:Subroutine Parameters:
 :``ofile``: file path `[character]` 
 :``odata``: 2d dataset structure. See :ref:`structurefields`. 
 :``headerfile``: text file `[character]` `[optional]`
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``dimids``: Array of dimension IDs corresponding to the variable dimensions `[integer]`
 :``xvarid``: longitude array ID `[integer]`
 :``yvarid``: latitude array ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
 :``attribute``: attribute text from ``headerfile`` `[character]`
 :``content``: content text from ``headerfile`` `[character]`
 :``nkeys``: number of attributes of ``headerfile`` `[integer]`
:Result:
 Save data into a NetCDF file format.

**Example:**

Write a 2-dimensional NetCDF dataset with variable declared as integer and coordinates declared as float (writegrid2d _ ``int`` _ll ``f``).

::

  subroutine writegrid2d_int_llf(ofile, odata, headerfile)
    character(*), intent(in) :: ofile
    character(*),  optional, intent(in) :: headerfile
    character(len=21) :: sysdatetime
    type(nc2d_int_llf) :: odata
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
      !Define variables
      call check(nf90_def_var(ncid, odata%dimname(i), nf90_float, odata%dimid(i), odata%varids(i)))
      call check(nf90_put_att(ncid, odata%varids(i), "units", odata%dimunits(i)))
    end do
  
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
    end do
  
    !Write variable
    call check(nf90_put_var(ncid, varid, odata%ncdata))
  
    call check(nf90_close(ncid))
  end subroutine writegrid2d_int_llf

