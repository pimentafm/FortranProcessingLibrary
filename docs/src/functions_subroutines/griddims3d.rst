griddims3d (3-dimensional Dataset)
``````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

griddims3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` subroutine is used to read the dimension informations in a 3-dimensional NetCDF dataset. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **f90NetCDF** library (``[byte, short, int, float, double]``), 
``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double and
``[tdt]`` by a defined suffix for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double).

griddims3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` (ifile, idata)
----------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``)
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``i``)
:Subroutine Parameters:
 :``ifile``: file path `[character]` 
 :``idata``: 3d dataset structure `[f90NetCDF defined type structure]` 
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``tdimid``: time dimension ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
:Return:
 :``ntimes``: time dimension size from ``ifile`` `[integer]`
 :``nlons``: longitude dimension size from ``ifile`` `[integer]`
 :``nlats``: latitude dimension size from ``ifile`` `[integer]`
 :``vartype``: number of variable datatype `[integer]` according to `NetCDF Library (C/C++ and Fortran) <https://github.com/Unidata/netcdf-fortran>`_ 

**Example:**

Read variable datatype ID, time and coordinates dimensions of a 3-dimensional NetCDF dataset with variable declared as short, 
coordinates declared as double and time declared as integer (nc3d _ ``short`` _ll ``double`` _t ``i``).

::

  !NetCDF <variable short> (longitude <double>, latitude <double>, time <int>)
  subroutine griddims3d_short_lld_ti(ifile, idata)
    type (nc3d_short_lld_ti) :: idata 
    integer(kind=intgr) :: ncid, tdimid, xdimid, ydimid, varid
    character(*), intent(in) :: ifile
  
    !Open NetCDF File
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
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
  
    idata%FillValue = nf90_fill_short
  
    !Close NetCDF
    call check(nf90_close(ncid))
  end subroutine griddims3d_short_lld_ti
