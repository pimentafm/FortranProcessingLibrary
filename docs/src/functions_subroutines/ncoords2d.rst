ncoords2d (2-dimensional Dataset)
`````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

ncoords2d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to read the dimension informations in a 2-dimensional NetCDF dataset. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **f90NetCDF** library (``[byte, short, int, float, double]``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double.

ncoords2d _ ``[vdt]`` _ll ``[cdt]`` (ifile, idata)
--------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
:Subroutine Parameters:
 :``ifile``: file path `[character]` 
 :``idata``: 2d dataset structure `[f90NetCDF defined type structure]` 
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
:Return:
 :``nlons``: longitude dimension size from ``ifile`` `[integer]`
 :``nlats``: latitude dimesnion size from ``ifile`` `[integer]`
 :``vartype``: number of variable datatype `[integer]` according to `NetCDF Library (C/C++ and Fortran) <https://github.com/Unidata/netcdf-fortran>`_ 

**Example:**

Read variable datatype ID and coordinates dimensions of a 2-dimensional NetCDF dataset with variable declared as byte and coordinates declared as float (nc2d _ ``byte`` _ll ``f``).

::

  !NetCDF <variable byte> (longitude <float>, latitude <float>)
  subroutine ncoords2d_byte_llf(ifile, idata)
    type (nc2d_byte_llf) :: idata
    integer(kind=intgr) :: ncid, xdimid, ydimid, varid
    character(*), intent(in) :: ifile
  
    !Open NetCDF File
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
    !Get Coordinate values and put them in nx, ny
    call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
    call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))
  
    call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
    call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))
  
    !Inquire variable type
    call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
    call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))
  
    idata%FillValue = nf90_fill_byte
  
    !Close NetCDF
    call check(nf90_close(ncid))
  end subroutine ncoords2d_byte_llf
