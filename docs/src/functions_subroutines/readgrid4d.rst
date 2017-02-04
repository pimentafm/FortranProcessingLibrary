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
 :``idata``: 4d dataset structure. See :ref:`structurefields`. 
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``varid``: variable ID `[integer]`
 :``i``: auxiliary variable `[integer]`
:Return:
 :``idata``: map structure with readed fields. See :ref:`structurefields`.
 :``levels``: array of map levels `[integer or float]`
 :``times``: array of map times `[integer, float or double]`
 :``longitudes``: array of longitudes `[float or double]`
 :``latitudes``: array of latitudes `[float or double]`

**Example:**

Read a 4-dimensional NetCDF dataset with variable declared as double, coordinates declared as double, time declared as 
integer and level declared as integer (readgrid4d _ ``double`` _ll ``d`` _t ``i`` _l ``i``).

::

  subroutine readgrid4d_double_lld_ti_li(ifile, idata)
    character(*), intent(in) :: ifile
    type(nc4d_double_lld_ti_li) :: idata
  
    integer(kind=intgr) :: ncid, varid, i
  
    call griddims(ifile, idata)
  
    allocate(idata%levels(idata%nlevels))
    allocate(idata%times(idata%ntimes))
    allocate(idata%longitudes(idata%nlons))
    allocate(idata%latitudes(idata%nlats))
  
    allocate(idata%ncdata(idata%dimsize(idata%dims(1)), idata%dimsize(idata%dims(2)), & 
             idata%dimsize(idata%dims(3)), idata%dimsize(idata%dims(4))))
    
    !Open NetCDF
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
    do i = 1, idata%ndims
      if(idata%dimname(i).eq."longitude".or.idata%dimname(i).eq."lon")then
        call check(nf90_get_var(ncid, idata%varids(i), idata%longitudes))
        idata%lonunits = idata%dimunits(i)
      end if
  
      if(idata%dimname(i).eq."latitude".or.idata%dimname(i).eq."lat") then
        call check(nf90_get_var(ncid, idata%varids(i), idata%latitudes))
        idata%latunits = idata%dimunits(i)
      end if
  
      if(idata%dimname(i).eq."time") then
        call check(nf90_get_var(ncid, idata%varids(i), idata%times))
        idata%timeunits = idata%dimunits(i)
      end if
  
      if(idata%dimname(i).eq."level") then
        call check(nf90_get_var(ncid, idata%varids(i), idata%levels))
        idata%levelunits = idata%dimunits(i)
      end if
    end do
   
    !Get Variable name
    call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
    call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)
  
    call check(nf90_close(ncid))
  end subroutine readgrid4d_double_lld_ti_li

