dealloc4d (2-dimensional Dataset)
`````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

dealloc4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` subroutine is used to deallocate a 3-dimensional NetCDF dataset. 
Combinations can be made for the statements of this structure by replacing ``[vdt]`` by one of the data types 
defined in the **FPL** library (``[byte, short, int, float, double]``), ``[cdt]`` by a defined suffix 
for the data type of the coordinates (``f`` for float and ``d`` for double), ``[tdt]`` by a defined suffix 
for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double) and ``[ldt]`` for a level suffix ((``f`` for float and ``d`` for double).

dealloc4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` (idata)
---------------------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype `[float` ``f`` `, double` ``d`` `]`
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``i``)
 :``[ldt]``: level datatype (integer ``i``, float ``f``)
:Subroutine Parameters:
 :``idata``: map to be created  `[FPL defined type structure]`
:Result:
 idata structure with ncdata, longitudes, latitudes and times deallocated.

**Code Example:**

 Deallocate a grid of type double with latitude and longitude defined as float, time and level defined as integer. (dealloc4d _ ``double`` _ll ``f`` _t ``i``  _l ``i``).

::

  subroutine dealloc4d_double_llf_ti_li(idata)
    type(nc4d_double_llf_ti_li) :: idata
    deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata)
    deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids)
  end subroutine dealloc4d_double_llf_ti_li

