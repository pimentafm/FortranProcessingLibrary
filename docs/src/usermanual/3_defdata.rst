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

    :nc[2d,3d,4d]: dimension nominations. Change ``[2d,3d,4d]`` to one of the nominations ``2d``, ``3d``, or ``4d``.
    :_[byte,short,int,float,double]: variable nominations. Change ``[byte,short,int,float,double]`` to one of the type nominations: ``byte``, ``short``, ``int``, ``float`` or ``double``.
    :_ll[f,d]: coordinates `[longitude, latitude]` nomination. Change ``[f,d]`` to one of the coordinates nominations: ``f`` for float and ``d`` for double.
    :_t[i,f,d]: time nomination **(used when 3d denomination is set)**. Change ``[i,f,d]`` to one of the time nomination: ``i`` for integer, ``f`` for float and ``d`` for double.
    :_l[i,f]: level nomination **(used when 4d denomination is set)**. Change ``[i,f]`` to one of the level nomination: ``i`` for integer, ``f`` for float.

    **some examples in fortran 90**

    ::

      type(nc2d_double_llf) :: grid2d ! 2d double dataset with float coordinates array. 
      type(nc3d_int_llf_ti) :: grid3d ! 3d integer dataset with float coordinates  and integer time array.
      type(nc4d_short_lld_ti_li) :: grid4d ! 4d short dataset with double coordinates, integer time and integer level array. 


Structure Fields
================

.. f:type:: nc[2d,3d,4d]_[byte,short,int,float,double]_ll[f,d]_t[i,f,d]_l[i,f]

    :Dimension naming: 2d, 3d, 4d [#f1]_
    :Type naming: byte, short, int, float, double [#f1]_
    :Coordinates naming: f, d [#f1]_
    :Time naming: i, f, d ``[3d and 4d datasets]`` [#f1]_
    :level naming: i, f ``[4d datasets]`` [#f1]_
    :f varname: variable name `[character]` [#f1]_
    :f timename: time name `[character]` ``[3d and 4d datasets]`` [#f1]_
    :f levelname: level name `[character]` ``[4d datasets]`` [#f1]_
    :f lonname: longitude name `[character]` [#f1]_
    :f latname: latitude name `[character]` [#f1]_
    :f long_name: `[long name dataset title]` [#f1]_ [#f2]_
    :f varunits: variable units `[character]` [#f1]_ [#f2]_
    :f lonunits: longitude units `[character]` [#f1]_ [#f2]_
    :f latunits: latitude units `[character]` [#f1]_ [#f2]_
    :f timeunits: time units `[character]` ``[3d and 4d datasets]`` [#f1]_ [#f2]_
    :f levelunits: level units `[character]` ``[4d datasets]`` [#f1]_ [#f2]_
    :f nlons: number of dataset longitudes `[integer]` [#f1]_ [#f2]_
    :f nlats: number of dataset latitudes `[integer]` [#f1]_ [#f2]_
    :f ntimes: number of dataset times `[integer]` ``[3d and 4d datasets]`` [#f1]_ [#f2]_
    :f nlevels: number of dataset level `[integer]` ``[4d datasets]`` [#f1]_ [#f2]_
    :f vartype: type number for NetCDF-fortran library `[integer]` [#f2]_
    :f FillValue: fill value `[byte, short, integer, float, double]` [#f1]_ [#f2]_
    :f levels: levels array `[integer, float]` ``[4d datasets]`` [#f1]_ [#f2]_
    :f times: times array `[integer, float, double]` ``[3d and 4d datasets]`` [#f1]_ [#f2]_
    :f longitudes: longitudes array `[float, double]` [#f1]_ [#f2]_
    :f latitudes: latitudes array `[float, double]` [#f1]_ [#f2]_
    :f ncdata: data array `[byte, short, integer, float, double]` [#f1]_ [#f2]_


.. [#f1] Defined by user 
.. [#f2] Defined on read and/or write data


[Code example] Set dataset fields in fortran 90
-----------------------------------------------

.. literalinclude:: fortran/3_setfield.f90
   :language: fortran

Save as file (**setfields.f90**) and compiling using gfortran.

.. highlight:: sh

::

   #RedHat based systems
   gfortran -o setfields.out setfields.f90 -I/usr/lib64/gfortran/modules/ -lf90NetCDF
   
   #Debian based systems
   gfortran -o setfields.out setfields.f90 -I/usr/include/ -lf90NetCDF

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(f90NetCDF_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./setfields.f90``

