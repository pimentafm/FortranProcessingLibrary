gengrid2d (2-dimensional Dataset)
`````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

gengrid2d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to create a 2-dimensional dataset defined by user. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **FPL** library (``byte, short, int, float, double``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates (``f`` for float and ``d`` for double).

gengrid2d _ ``[vdt]`` _ll ``[cdt]`` (idata, Xmin, Ymin, Xmax, Ymax, res)
------------------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype `[float` ``f`` `, double` ``d`` `]`
:Subroutine Parameters:
 :``idata``: map to be created  `[FPL defined type structure]`
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

Generate a grid of type byte with latitude and longitude defined as float. (gengrid2d _ ``byte`` _ll ``f``).

::

  subroutine gengrid2d_byte_llf(idata, Xmin, Ymin, Xmax, Ymax, res)
    type (nc2d_byte_llf) :: idata
    integer(kind=intgr) :: i
    integer(kind=intgr), dimension(2) :: dimsizes, ids
    character(len=100), dimension(2) :: dimnames, dimunits
    real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res
  
    idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
    idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))
  
    allocate(idata%dimunits(idata%ndims))
    allocate(idata%dimname(idata%ndims))
    allocate(idata%dimid(idata%ndims))
    allocate(idata%dimsize(idata%ndims))
    allocate(idata%varids(idata%ndims))
  
    allocate(idata%longitudes(idata%nlons))  
    allocate(idata%latitudes(idata%nlats))
    
    ids = (/ 2, 1 /)
    dimsizes = (/ idata%nlats, idata%nlons /)
    dimnames = (/ idata%latname, idata%lonname /)
    dimunits = (/ idata%latunits, idata%lonunits /)
  
    do i = 1, idata%ndims
      idata%dimsize(i) = dimsizes(i)
      idata%dimname(i) = dimnames(i)
      idata%dimunits(i) = dimunits(i)
      idata%dimid(i) = ids(i)
      idata%varids(i) = ids(i) + 10
      idata%dims(i) = ids(i)
    end do
  
    allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
    
    idata%vartype = nf90_byte
  
    idata%longitudes(1) = Xmin
    do i = 1, idata%nlons - 1
      idata%longitudes(i+1) = idata%longitudes(i) + res
    end do
  
    idata%latitudes(1) = Ymin
    do i = 1, idata%nlats - 1
      idata%latitudes(i+1) = idata%latitudes(i) + res
    end do
  
    idata%ncdata = idata%FillValue
  
  end subroutine gengrid2d_byte_llf

