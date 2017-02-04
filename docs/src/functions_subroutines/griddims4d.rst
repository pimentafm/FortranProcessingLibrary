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

  subroutine griddims4d_double_lld_td_lf(ifile, idata)
    type (nc4d_double_lld_td_lf) :: idata 
    integer(kind=intgr) :: ncid, varid, i
    character(*), intent(in) :: ifile
    !Open NetCDF File
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
    !Inquire variable type and number of dimensions
    call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
    call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype, idata%ndims, idata%dims))
   
    allocate(idata%dimid(idata%ndims))
    allocate(idata%varids(idata%ndims))
    allocate(idata%dimunits(idata%ndims))
    allocate(idata%dimname(idata%ndims))
    allocate(idata%dimsize(idata%ndims)) 
  
    idata%dimname(1) = idata%levelname 
    idata%dimname(2) = idata%timename
    idata%dimname(3) = idata%lonname
    idata%dimname(4) = idata%latname
    
    !Get number of
    do i = 1, idata%ndims 
      call checkdimid(nf90_inq_dimid(ncid, idata%dimname(i), idata%dimid(i)), idata%dimname(i))
    end do
  
    call bubbleSort(idata%dimid, idata%dimname, idata%ndims)
  
    !Get dimension sizes
    do i = 1, idata%ndims
      call check(nf90_inquire_dimension(ncid, idata%dimid(i), idata%dimname(i), idata%dimsize(i)))
    end do
  
    !Get 
    do i = 1, idata%ndims
      call check(nf90_inq_varid(ncid, idata%dimname(i), idata%varids(i)))
      call check(nf90_get_att(ncid, idata%varids(i), "units", idata%dimunits(i)), idata%dimunits(i), ifile)
    end do 
    
    !Get some attributes
    call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
    call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
    call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)
  
    do i = 1, idata%ndims
      if(idata%dimname(i).eq."longitude".or.idata%dimname(i).eq."lon") then
        idata%nlons = idata%dimsize(i)
        idata%lonunits = idata%dimunits(i)
      end if
      if(idata%dimname(i).eq."latitude".or.idata%dimname(i).eq."lat") then
        idata%nlats = idata%dimsize(i)
        idata%latunits = idata%dimunits(i)
      end if
      if(idata%dimname(i).eq."time") then
        idata%ntimes = idata%dimsize(i)
        idata%timeunits = idata%dimunits(i)
      end if
      if(idata%dimname(i).eq."level") then
        idata%nlevels = idata%dimsize(i)
        idata%levelunits = idata%dimunits(i)
      end if
    end do
  
    !Close NetCDF
    call check(nf90_close(ncid))
  end subroutine griddims4d_double_lld_td_lf

