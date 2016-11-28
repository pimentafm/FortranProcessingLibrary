readgrid4d (4-dimensional Dataset)
``````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

readgrid4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` subroutine is used to read and alloc a 4-dimensional NetCDF dataset into a datatype structure. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` by one of the data types 
defined in the **FPL** library (``[byte, short, int, float, double]``), ``[cdt]`` by a defined suffix 
for the data type of the coordinates (``f`` for float and ``d`` for double), ``[tdt]`` by a defined suffix 
for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double) and ``[ldt]`` for a level suffix ((``f`` for float and ``d`` for double).

readgrid4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` (ifile, idata)
-----------------------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float, double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
 :``[tdt]``: time datatype (int ``i``, float ``f``, double ``d``)
 :``[ldt]``: level datatype (integer ``i``,float ``f``)
:Subroutine Parameters:
 :``ifile``: file path `[character]` 
 :``idata``: 4d dataset structure `[FPL defined type structure]` 
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
:Return:
 :``nlevels``: level dimension size from ``ifile`` `[integer]`
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

Read a 4-dimensional NetCDF dataset with variable declared as double, coordinates declared as double, time declared as 
integer and level declared as integer (readgrid4d _ ``double`` _ll ``d`` _t ``i`` _l ``i``).

::

  !NetCDF <variable double> (longitude <double>, latitude <double>, time <int, level <int>)
  subroutine readgrid4d_double_lld_ti_li(ifile, idata)
    character(*), intent(in) :: ifile
    type(nc4d_double_lld_ti_li) :: idata
  
    integer(kind=intgr) :: ncid, varid, lvarid, tvarid, xvarid, yvarid
  
    call ncoords(ifile, idata)
  
    allocate(idata%ncdata(idata%nlons, idata%nlats, idata%ntimes, idata%nlevels))
    allocate(idata%levels(idata%nlevels))
    allocate(idata%times(idata%ntimes))
    allocate(idata%longitudes(idata%nlons))
    allocate(idata%latitudes(idata%nlats))
  
    !Open NetCDF
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
    !Get level
    call check(nf90_inq_varid(ncid, idata%levelname, lvarid))
    call check(nf90_get_var(ncid, lvarid, idata%levels))
    call check(nf90_get_att(ncid, lvarid, "units", idata%levelunits),"levelunits", ifile)
    
    !Get time
    call check(nf90_inq_varid(ncid, idata%timename, tvarid))
    call check(nf90_get_var(ncid, tvarid, idata%times))
    call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)
  
    !Get Lons, Lats and variable values
    call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
    call check(nf90_get_var(ncid, xvarid, idata%longitudes))
    call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)
  
    call check(nf90_inq_varid(ncid, idata%latname, yvarid))
    call check(nf90_get_var(ncid, yvarid, idata%latitudes))
    call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)
  
    !Get Variable name
    call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
    call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)
  
    !Get some attributes
    call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
    call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
    call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)
  
    call check(nf90_close(ncid))
  end subroutine readgrid4d_double_lld_ti_li
