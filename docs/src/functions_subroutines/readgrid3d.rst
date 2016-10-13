readgrid3d (3-dimensional Dataset)
``````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

readgrid3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` subroutine is used to read and alloc a 3-dimensional NetCDF dataset into a datatype structure. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **f90NetCDF** library (``[byte, short, int, float, double]``), 
``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double and
``[tdt]`` by a defined suffix for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double).

readgrid3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` (ifile, idata)
----------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
 :``[tdt]``: time datatype `[byte, short, int, float or double]`
:Subroutine Parameters:
 :``ifile``: file path `[character]` 
 :``idata``: 3d dataset structure `[f90NetCDF defined type structure]` 
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
:Return:
 :``ntimes``: time dimension size from ``ifile`` `[integer]`
 :``nlons``: longitude dimension size from ``ifile`` `[integer]`
 :``nlats``: latitude dimesnion size from ``ifile`` `[integer]`
 :``timeunits``: time units `[character]` 
 :``lonunits``: longitude units `[character]` 
 :``latunits``: latitude units `[character]`
 :``varunits``: variable units `[character]`
 :``idata``: array with dataset was read ``[vdt]``
 :``long_name``: long name defined in dataset `[character]`
 :``_FillValue``: fill value defined in dataset ``[vdt]``

**Example:**

Read a 3-dimensional NetCDF dataset with variable declared as integer and coordinates declared as double (readgrid3d _ ``int`` _ll ``d``).

::

  !NetCDF <variable int> (longitude <double>, latitude <double>)
  subroutine readgrid3d_int_lld(ifile, idata)
    character(*), intent(in) :: ifile
    type(nc3d_int_lld) :: idata
  
    integer(kind=intgr) :: ncid, varid, xvarid, yvarid
  
    call ncoords(ifile, idata)
  
    allocate(idata%ncdata(idata%nlons, idata%nlats))
    allocate(idata%longitudes(idata%nlons))
    allocate(idata%latitudes(idata%nlats))
  
    !Open NetCDF
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
    !Get Lons, Lats and variable values
    call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
    call check(nf90_get_var(ncid, xvarid, idata%longitudes))
    call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)
  
    call check(nf90_inq_varid(ncid, idata%latname, yvarid))
    call check(nf90_get_var(ncid, yvarid, idata%latitudes))
    call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)
  
    !Get Variable name
    call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
    call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)
  
    !Get some attributes
    call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
    call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
    call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)
  
    call check(nf90_close(ncid))
  end subroutine readgrid3d_int_lld