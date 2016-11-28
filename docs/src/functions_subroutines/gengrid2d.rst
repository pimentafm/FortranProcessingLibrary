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
:Result:
 A grid with latitude, longitude and resolution defined by the user.

**Code Example:**

Generate a grid of type byte with latitude and longitude defined as float. (gengrid _ ``byte`` _ll ``f``).

::

  !NetCDF <var byte> (lon <float>, lat <float>)
  subroutine gengrid2d_byte_llf(idata, Xmin, Ymin, Xmax, Ymax, res)
    type (nc2d_byte_llf) :: idata
    integer(kind=intgr) :: i
    real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res
  
    idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
    idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))
  
    allocate(idata%ncdata(idata%nlons, idata%nlats))
    allocate(idata%longitudes(idata%nlons))  
    allocate(idata%latitudes(idata%nlats))
  
    idata%vartype = byte
  
    idata%longitudes(1) = Xmin
    do i = 1, idata%nlons - 1
      idata%longitudes(i+1) = idata%longitudes(i) + res
    end do
  
    idata%latitudes(1) = Ymin
    do i = 1, idata%nlats - 1
      idata%latitudes(i+1) = idata%latitudes(i) + res
    end do
  end subroutine gengrid2d_byte_llf
