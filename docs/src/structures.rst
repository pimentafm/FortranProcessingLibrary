Data Types and Structures
*************************
.. highlight:: fortran
   :linenothreshold: 2

f90NetCDF module
================

**f90NetCDF** works as a module and can be compiled with other programs.
Its structure is composed of several files containing all definitions of data types, 
external libraries and intrinsic functions.

::

  !f90NetCDF.f90
  module f90NetCDF
    use omp_lib
    use netcdf
    use iso_c_binding
    implicit none
    include "f90NetCDF_constants.f90"   !Parameter definitions
    include "f90NetCDF_datatypes.f90"   !Datatype structure declarations
    include "f90NetCDF_interfaces.f90"  !Interfaces for subroutines/functions definitions and datatypes
  
    contains
    include "f90NetCDF_checkerror.f90"  !Error checker subroutines
    include "f90NetCDF_datetime.f90"    !System date-time subroutines
    include "f90NetCDF_griddims.f90"    !Subroutines to get the number of coordinates and basic info from NetCDF file
    include "f90NetCDF_readgrid.f90"    !NetCDF file reader subroutines
    include "f90NetCDF_writegrid.f90"   !NetCDF file writer subroutines
    include "f90NetCDF_fvalue.f90"      !Set FillValue and mask creator subroutines
    include "f90NetCDF_fileutils.f90"   !File utilities
  end module f90NetCDF

Data Types and Parameter Definitions
====================================

**f90NetCDF** supports 5 datatype structures: **BYTE**, **SHORT**, **INTEGER**, **FLOAT** and **DOUBLE**.

+---------+------------------+------------------+-----------------------+
|  Type   | Minimum value    | Maximum value    | Default FillValue     |
+=========+==================+==================+=======================+
|  byte   | -128             | 127              | -127                  |
+---------+------------------+------------------+-----------------------+
|  short  | -32768           | 32767            | -32767                |
+---------+------------------++-----------------+-----------------------+
| integer | -2147483648      | 2147483647       | 2147483647            |
+---------+------------------+------------------+-----------------------+
|  float  | +/- 1.175494e-38 | +/- 1.701411e+38 | 9.96921e+36           |
+---------+------------------+------------------+-----------------------+
| double  | +/- 2.22507e-308 | +/- 8.98846e+307 | 9.969209968386869e+36 |
+---------+------------------+------------------+-----------------------+

Numeric datatypes are defined using **ISO_C_BINDINGS** module into the file **f90NetCDF_constants.f90**.
Parameters can be defined into this file too.

::

  !f90NetCDF_constants.f90
  integer, parameter :: byte = C_SIGNED_CHAR
  integer, parameter :: short = C_SHORT
  integer, parameter :: intgr = C_INT
  integer, parameter :: float = C_FLOAT
  integer, parameter :: double = C_DOUBLE

  real(kind=double), parameter :: pi = 4*atan(1.0)
  real(kind=double), parameter :: earth_radius = 6371.0      ! average radius of earth ~ km
  real(kind=double), parameter :: acc_gravity = 9.80616      ! acceleration of gravity ~ m/s^2
  real(kind=double), parameter :: boltzman= 5.67e-8          ! Stefan-Boltzmann constant ~ W/m^2/K^4
  real(kind=double), parameter :: speed_of_light = 299792458 ! Speed of the light ~ m/s

**f90NetCDF** can read and write data up to 4 dimensions in a much simpler way using dynamic data structures and dynamic modules as follows:

Type Structures
===============

.. toctree::
   :maxdepth: 1

   datatypes/nc2d
   datatypes/nc3d
   datatypes/nc4d

Interfaces
==========

Interfaces can be used to invoke different functions using the same name.

.. toctree::
   :maxdepth: 1

   interfaces/interfaces

Functions and Subroutines
=========================

I/O processing
--------------

.. toctree::
   :maxdepth: 1

   functions_subroutines/ncoords2d
   functions_subroutines/ncoords3d
   functions_subroutines/ncoords4d
   functions_subroutines/readgrid2d
   functions_subroutines/readgrid3d
   functions_subroutines/readgrid4d
   functions_subroutines/writegrid2d
   functions_subroutines/writegrid3d
   functions_subroutines/writegrid4d

Array processing
----------------

.. toctree::
   :maxdepth: 1

   functions_subroutines/setfillvalue2d.rst

.. seealso::

   Module :py:mod:`zipfile`
      Documentation of the :py:mod:`zipfile` standard module.

   `GNU tar manual, Basic Tar Format <http://link>`_
      Documentation for tar archive files, including GNU tar extensions.

