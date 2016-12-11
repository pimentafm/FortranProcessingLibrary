nc4d (4-dimensional Dataset)
````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

nc4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]`` structure is used to declare a 4-dimensional NetCDF dataset. 
Combinations can be made for the declaration of the structure by replacing ``[vdt]`` by one of the data types 
defined in the **FPL** library (``[byte, short, int, float, double]``), ``[cdt]`` by a defined suffix 
for the data type of the coordinates (``f`` for float and ``d`` for double), ``[tdt]`` by a defined suffix 
for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double) and for a level suffix ((``f`` for float and ``d`` for double).

nc4d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` _l ``[ldt]``
--------------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float[f] or double[d]).
 :``[tdt]``: time datatype(integer ``i``, float ``f`` or double ``d``).
 :``[ldt]``: level datatype(integer ``i`` or float ``f``).
:Name parameters:
 :``varname``: dataset variable name `[character]`
 :``lonname``: longitude name `[character]`
 :``latname``: latitude name `[character]`
 :``timename``: time name `[character]`
 :``levelname``: level name `[character]`
 :``long_name``: title for dataset `[character]`
:Unit parameters: 
 :``varunits``: variable units `[character]` 
 :``lonunits``: longitudes units `[character]`
 :``latunits``: latitude units `[character]`
 :``timeunits``: time units `[character]`
 :``levelunits``: level units `[character]`
:Coordinate parameters: 
 :``nlons``: number of longitudes of the dataset `[integer]`
 :``nlats``: number of latitudes of the dataset `[integer]`
 :``longitudes(nlons)``: longitude array `[float or double]`
 :``latitudes(nlats)``:  latitude array `[float or double]`
:Time parameters:
 :``ntimes``: number of times of the dataset `[integer]`
 :``times(ntimes)``: time array `[integer, float or double]`
:Level parameters:
 :``nlevels``: number of levels of the dataset `[integer]`
 :``levels(nlevels)``: level array `[float or double]`
:Data parameters: 
 :``data(lon, lat, time, level)``: data array `[byte, short, integer, float or double]`
 :``vartype``: type number for NetCDF-Fortran library `[integer]`
 :``FillValue``: fill value `[byte, short, integer, float or doubl]`

**Example:**

Using a 4-dimensional NetCDF dataset with variable declared as integer,
coordinates declared as double, time declared as double and level declared 
as float (nc4d _ ``int`` _ll ``d`` _t ``d`` _l ``f``). 

::

  !NetCDF(lon, lat, time, level) int
  type :: nc4d_int_lld_td_lf
  
    sequence
    character(len=100) :: varname, timename, levelname, lonname, latname, &
                          long_name, varunits, lonunits, latunits, &
                          timeunits, levelunits
    integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
    integer(kind=intgr) :: FillValue
    real(kind=float), dimension(:), allocatable :: levels
    real(kind=double), dimension(:), allocatable :: times
    real(kind=double), dimension(:), allocatable :: longitudes, latitudes
    integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
  end type nc4d_int_lld_td_lf


