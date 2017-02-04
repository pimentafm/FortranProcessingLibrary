nc3d (3-dimensional Dataset)
````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

nc3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]`` structure is used to declare a 3-dimensional NetCDF dataset. 
Combinations can be made for the declaration of the structure by replacing ``[vdt]`` 
by one of the data types defined in the **FPL** library (``[byte, short, int, float, double]``), 
``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double and
``[tdt]`` by a defined suffix for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double).

nc3d _ ``[vdt]`` _ll ``[cdt]`` _t ``[tdt]``
-------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float[f] or double[d]).
 :``[tdt]``: time datatype(integer ``i``, float ``f`` or double ``d``).
:Name parameters:
 :``varname``: dataset variable name `[character]`
 :``lonname``: longitude name `[character]`
 :``latname``: latitude name `[character]`
 :``timename``: time name `[character]`
 :``long_name``: title for dataset `[character]`
 :``dimname``: array of dimension names `[character]`
:Unit parameters: 
 :``varunits``: variable units `[character]` 
 :``lonunits``: longitudes units `[character]`
 :``latunits``: latitude units `[character]`
 :``timeunits``: time units `[character]`
 :``dimunits``: dimension units array `[character]`
:Dimension parameters:
 :``ndims``: number of variable dimensions `[integer]`
 :``dimid``: array of dimension IDs `[integer]`
 :``dims``: dimension IDs corresponding to the variable dimensions `[integer]`
 :``dimsize``: array of size of dimensions `[integer]`
 :``varids``: array of variables IDs `[integer]`
:Coordinate parameters: 
 :``nlons``: number of longitudes of the dataset `[integer]`
 :``nlats``: number of latitudes of the dataset `[integer]`
 :``longitudes``: longitude array `[float or double]`
 :``latitudes``:  latitude array `[float or double]`
:Time parameters:
 :``ntimes``: number of times of the dataset `[integer]`
 :``times``: time array `[integer, float or double]`
:Data parameters: 
 :``data``: data array `[byte, short, integer, float or double]`
 :``vartype``: type number for NetCDF-Fortran library `[integer]`
 :``FillValue``: fill value `[byte, short, integer, float or doubl]`

**Example:**

Using a 3-dimensional NetCDF dataset with variable declared as short,
coordinates declared as float and time declared as double (nc3d _ ``short`` _ll ``f`` _t ``d``). 

::

  type :: nc3d_short_llf_td
    sequence
    character(len=100) :: varname, timename, lonname, latname, long_name, &
                          varunits, lonunits, latunits, timeunits
    character(len=100), dimension(:), allocatable :: dimname, dimunits
    integer(kind=intgr) :: nlons, nlats, ntimes, ndims, vartype
    integer(kind=intgr), dimension(:), allocatable :: dimid, dimsize, varids
    integer(kind=intgr), dimension(3) :: dims
    integer(kind=short) :: FillValue
    real(kind=double), dimension(:), allocatable :: times
    real(kind=float), dimension(:), allocatable :: longitudes, latitudes
    integer(kind=short), dimension(:,:,:), allocatable :: ncdata
  end type nc3d_short_llf_td

