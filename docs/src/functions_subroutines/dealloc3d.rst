dealloc3d (2-dimensional Dataset)
`````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

dealloc3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` subroutine is used to deallocate a 3-dimensional NetCDF dataset. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **FPL** library (``[byte, short, int, float, double]``), 
``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double and
``[tdt]`` by a defined suffix for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double).

dealloc3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` (idata)
--------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype `[float` ``f`` `, double` ``d`` `]`
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``i``)
:Subroutine Parameters:
 :``idata``: map to be created  `[FPL defined type structure]`
:Result:
 idata structure with ncdata, longitudes, latitudes and times deallocated.

**Code Example:**

 Deallocate a grid of type short with coordinates and time defined as float. (dealloc3d _ ``short`` _ll ``f`` _t ``f``).

::

  !NetCDF(lon, lat, time) short
  subroutine dealloc3d_short_llf_tf(idata)
    type(nc3d_short_llf_tf) :: idata
    deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata)
  end subroutine dealloc3d_short_llf_tf
