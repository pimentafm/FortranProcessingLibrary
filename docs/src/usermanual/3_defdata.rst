Data Type Structures
********************

.. highlight:: fortran
   :linenothreshold: 2

Structures can be defined in five data types ``(byte, short, integer, float, double)`` and in up to 4-dimensions.
The f90NetCDF structure namming follow the sintax below:

Namming Structures
==================

**nc** ``[2d,3d,4d]`` **_** ``[byte,short,int,float,double]`` **_ll** ``[f,d]`` **_t** ``[i,f,d]`` **_l** ``[i,f]``
-------------------------------------------------------------------------------------------------------------------

    :nc[2d,3d,4d]: dimension denominations. Change ``[2d,3d,4d]`` to one of the denominations ``2d``, ``3d``, or ``4d``.
    :_[byte,short,int,float,double]: variable denominations. Change ``[byte,short,int,float,double]`` to one of the type denominations: ``byte``, ``short``, ``int``, ``float`` or ``double``.
    :_ll[f,d]: coordinates `[longitude, latitude]` denominations. Change ``[f,d]`` to one of the coordinates denominations: ``f`` for float and ``d`` for double.
    :_t[i,f,d]: time denominations **(used when 3d denomination is set)**. Change ``[i,f,d]`` to one of the time denominations: ``i`` for integer, ``f`` for float and ``d`` for double.
    :_l[i,f]: level denominations **(used when 4d denomination is set)**. Change ``[i,f]`` to one of the level denominations: ``i`` for integer, ``f`` for float.

    **some examples in fortran 90**

    ::

      type(nc2d_double_llf) :: grid2d ! 2d double dataset with float coordinates array. 
      type(nc3d_int_llf_ti) :: grid3d ! 3d integer dataset with float coordinates  and integer time array.
      type(nc4d_short_lld_ti_li) :: grid4d ! 4d short dataset with double coordinates, integer time and integer level array. 


Structure Fields
================

.. f:type:: nc[2d,3d,4d]_[byte,short,int,float,double]_ll[f,d]_t[i,f,d]_l[i,f]

    :Dimension naming: 2d, 3d, 4d
    :Type naming: byte, short, int, float, double
    :Coordinates naming: f, d
    :Time naming: i, f, d ``[3d and 4d datasets]``
    :level naming: i, f ``[4d datasets]``

    :f varname: variable name `[character]` 
    :f timename: time name `[character]` ``[3d and 4d datasets]``
    :f levelname: level name `[character]` ``[4d datasets]``
    :f lonname: longitude name `[character]`
    :f latname: latitude name `[character]`
    :f long_name: `[long name dataset title]`
    :f varunits: variable units `[character]`
    :f lonunits: longitude units `[character]`
    :f latunits: latitude units `[character]`
    :f timeunits: time units `[character]` ``[3d and 4d datasets]``
    :f levelunits: level units `[character]` ``[4d datasets]``
    :f nlons: number of dataset longitudes `[integer]`
    :f nlats: number of dataset latitudes `[integer]`
    :f ntimes: number of dataset times `[integer]` ``[3d and 4d datasets]``
    :f nlevels: number of dataset level `[integer]` ``[4d datasets]``
    :f vartype: type number for NetCDF-fortran library `[integer]`
    :f FillValue: fill value `[byte, short, integer, float, double]`
    :f levels: levels array `[integer, float]` ``[4d datasets]``
    :f times: times array `[integer, float, double]` ``[3d and 4d datasets]``
    :f longitudes: longitudes array `[float, double]`
    :f latitudes: latitudes array `[float, double]`
    :f ncdata: data array `[byte, short, integer, float, double]`


Set dataset fields in fortran 90
--------------------------------

::

  !dataset declarations
  nc2d_double_llf :: grid2d 
  nc3d_int_llf_ti :: grid3d
  nc4d_short_lld_ti_li) :: grid4d

  !Set dataset fields
  grid2d%varname = "temperature"
  grid2d%lonname = "longitude"
  grid2d%latname = "latitude"
   
  grid3d%varname = "temperature"
  grid3d%lonname = "longitude"
  grid3d%latname = "latitude"
  grid3d%timename = "time"

  grid4d%varname = "temperature"
  grid4d%lonname = "longitude"
  grid4d%latname = "latitude"
  grid4d%timename = "time"
  grid4d%level = "level"


Code example
------------


