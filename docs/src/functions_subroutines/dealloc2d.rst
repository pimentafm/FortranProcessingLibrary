dealloc2d (2-dimensional Dataset)
`````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

dealloc2d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to deallocate a 2-dimensional dataset defined by user. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **FPL** library (``byte, short, int, float, double``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates (``f`` for float and ``d`` for double).

dealloc2d _ ``[vdt]`` _ll ``[cdt]`` (idata)
-------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype `[float` ``f`` `, double` ``d`` `]`
:Subroutine Parameters:
 :``idata``: map to be created. See :ref:`structurefields`.
:Result:
 idata structure with ncdata, longitudes and latitudes deallocated.

**Code Example:**

 Deallocate a grid of type integer with latitude and longitude defined as double. (dealloc2d _ ``byte`` _ll ``f``).

::

  subroutine dealloc2d_byte_llf(idata)
    type(nc2d_byte_llf) :: idata
    deallocate(idata%longitudes, idata%latitudes, idata%ncdata)
    deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids)
  end subroutine dealloc2d_byte_llf
