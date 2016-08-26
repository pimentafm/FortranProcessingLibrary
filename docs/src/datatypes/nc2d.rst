nc2d (2-dimensional Dataset)
````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

nc2d _ ``[vdt]`` _ll ``[cdt]`` structure is used to declare a 2-dimensional NetCDF dataset. 
Combinations can be made for the declaration of the structure by replacing ``[vdt]`` 
by one of the data types defined in the **f90NetCDF** library (``[byte, short, int, float, double]``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double.

nc2d _ ``[vdt]`` _ll ``[cdt]``
------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f`` or double ``d``).
:Name parameters:
 :``varname``: dataset variable name `[character]`
 :``lonname``: longitude name `[character]`
 :``latname``: latitude name `[character]`
 :``long_name``: Title for dataset `[character]`
:Unit parameters: 
 :``varunits``: variable units `[character]` 
 :``lonunits``: longitudes units `[character]`
 :``latunits``: latitude units `[character]`
:Coordinate parameters: 
 :``nlons``: number of longitudes of dataset `[integer]`
 :``nlats``: number of latitudes of dataset `[integer]`
 :``longitudes``: longitude array `[float or double]`
 :``latitudes``:  latitude array `[float or double]`
:Data parameters: 
 :``data``: data array `[byte, short, integer, float or double]`
 :``vartype``: type number for NetCDF-Fortran library `[integer]`
 :``FillValue``: fill value `[byte, short, integer, float or doubl]`

**Example:**

Using a 2-dimensional NetCDF dataset with variable declared as double and coordinates declared as float (nc2d _ ``double`` _ll ``f``).

::

  type :: nc2d_double_llf
    sequence
    character(len=100) :: varname, lonname, latname, long_name, varunits, &
                          lonunits, latunits
    integer(kind=intgr) :: nlons, nlats, vartype
    integer(kind=double) :: FillValue
    real(kind=float), dimension(:), allocatable :: longitudes, latitudes
    integer(kind=double), dimension(:,:), allocatable :: ncdata
  end type nc2d_double_llf


