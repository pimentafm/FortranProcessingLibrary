gengrid4d (3-dimensional Dataset)
`````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

gengrid4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` subroutine is used to create a 4-dimensional dataset defined by user. 
Combinations can be made for the statements of this structure by replacing ``[vdt]`` by one of the data types 
defined in the **FPL** library (``[byte, short, int, float, double]``), ``[cdt]`` by a defined suffix 
for the data type of the coordinates (``f`` for float and ``d`` for double), ``[tdt]`` by a defined suffix 
for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double) and ``[ldt]`` for a level suffix ((``f`` for float and ``d`` for double).

gengrid4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` (idata, Xmin, Ymin, Xmax, Ymax, res)
--------------------------------------------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype `[float` ``f`` `, double` ``d`` `]`
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``d``)
 :``[ldt]``: level datatype (integer ``i``, float ``f``)
:Subroutine Parameters:
 :``idata``: map to be created. See :ref:`structurefields`.
 :``Xmin``: westernmost longitude `[double` or `float]` 
 :``Ymin``: southernmost latitude `[double` or `float]`
 :``Xmax``: easternmost longitude `[double` or `float]`
 :``Ymax``: northernmost latitude `[double` or `float]`
 :``res``: map resolution `[double` or `float]`
:Local parameters: 
 :``i``: loop controler `[integer]`
 :``ids``: array of ID numbers `[integer]`
 :``dimnames``: array of dimension names `[integer]`
 :``dimsizes``: array of dimension sizes `[integer]`
 :``dimunits``: array of dimension units `[integer]`
:Result:
 A grid with latitude, longitude and resolution defined by the user.

**Code Example:**

Generate a grid of type byte with latitude and longitude defined as double, time and level defined as integer. (gengrid4d _ ``byte`` _ll ``d`` _t ``i`` _l ``i``).

::

  subroutine gengrid4d_byte_lld_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
    type (nc4d_byte_lld_ti_li) :: idata
    integer(kind=intgr) :: i
    integer(kind=intgr), dimension(4) :: dimsizes, ids
    character(len=100), dimension(4) :: dimnames, dimunits
    real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res
  
    idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
    idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))
  
    allocate(idata%dimunits(idata%ndims))
    allocate(idata%dimname(idata%ndims))
    allocate(idata%dimid(idata%ndims))
    allocate(idata%dimsize(idata%ndims))
    allocate(idata%varids(idata%ndims))
  
    allocate(idata%longitudes(idata%nlons))  
    allocate(idata%latitudes(idata%nlats))
    allocate(idata%times(idata%ntimes))
    allocate(idata%levels(idata%nlevels))
  
    ids = (/ 4, 3, 2, 1 /)
    dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
    dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
    dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)
  
    do i = 1, idata%ndims
      idata%dimsize(i) = dimsizes(i)
      idata%dimname(i) = dimnames(i)
      idata%dimunits(i) = dimunits(i)
      idata%dimid(i) = ids(i)
      idata%varids(i) = ids(i) + 10
      idata%dims(i) = ids(i)
    end do
  
    allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
    idata%vartype = nf90_byte
  
    do i = 1, idata%ntimes
      idata%times(i) = i
    end do
  
    do i = 1, idata%nlevels
      idata%levels(i) = i
    end do
  
    idata%longitudes(1) = Xmin
    do i = 1, idata%nlons - 1
      idata%longitudes(i+1) = idata%longitudes(i) + res
    end do
  
    idata%latitudes(1) = Ymin
    do i = 1, idata%nlats - 1
      idata%latitudes(i+1) = idata%latitudes(i) + res
    end do
  
    idata%ncdata = idata%FillValue
  
  end subroutine gengrid4d_byte_lld_ti_li

