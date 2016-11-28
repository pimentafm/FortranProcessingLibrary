griddims4d (4-dimensional Dataset)
``````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

griddims4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` subroutine is used to read the dimension informations in a 4-dimensional NetCDF dataset. 
Combinations can be made for the statements of this structure by replacing ``[vdt]`` by one of the data types 
defined in the **FPL** library (``[byte, short, int, float, double]``), ``[cdt]`` by a defined suffix 
for the data type of the coordinates (``f`` for float and ``d`` for double), ``[tdt]`` by a defined suffix 
for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double) and ``[ldt]`` for a level suffix ((``f`` for float and ``d`` for double).

griddims4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` (ifile, idata)
-----------------------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float, double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``)
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``d``)
 :``[ldt]``: level datatype (integer ``i``, float ``f``)
:Subroutine Parameters:
 :``ifile``: file path `[character]` 
 :``idata``: 4d dataset structure `[FPL defined type structure]` 
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``ldimid``: level dimension ID `[integer]`
 :``tdimid``: time dimension ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
:Return:
 :``nlevels``: level dimension size from ``ifile`` `[integer]`
 :``ntimes``: time dimension size from ``ifile`` `[integer]`
 :``nlons``: longitude dimension size from ``ifile`` `[integer]`
 :``nlats``: latitude dimension size from ``ifile`` `[integer]`
 :``vartype``: number of variable datatype `[integer]` according to `NetCDF Library (C/C++ and Fortran) <https://github.com/Unidata/netcdf-fortran>`_ 

**Example:**

Read variable datatype ID, level, time and coordinates dimensions of a 4-dimensional NetCDF dataset with variable declared as double, 
coordinates declared as double, time declared as double and level declared as float(nc4d _ ``double`` _ll ``d`` _t ``d`` _l ``f``).

::

  !NetCDF <var double> (longitude <double>, latitude <double>, time <double>, level <float>)
  subroutine griddims4d_double_lld_td_lf(ifile, idata)
    type (nc4d_double_lld_td_lf) :: idata 
    integer(kind=intgr) :: ncid, ldimid, tdimid, xdimid, ydimid, varid
    character(*), intent(in) :: ifile
  
    !Open NetCDF File
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
    !Get level Number
    call checkdimid(nf90_inq_dimid(ncid, idata%levelname, ldimid), idata%levelname)
    call check(nf90_inquire_dimension(ncid, ldimid, idata%levelname, idata%nlevels))
  
    !Get Time Number
    call checkdimid(nf90_inq_dimid(ncid, idata%timename, tdimid), idata%timename)
    call check(nf90_inquire_dimension(ncid, tdimid, idata%timename, idata%ntimes))
  
    !Get Coordinate values and put them in nx, ny
    call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
    call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))
  
    call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
    call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))
  
    !Inquire variable type
    call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
    call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))
  
    idata%FillValue = nf90_fill_double
  
    !Close NetCDF
    call check(nf90_close(ncid))
  end subroutine griddims4d_double_lld_td_lf
