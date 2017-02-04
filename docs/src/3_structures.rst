API
***
.. highlight:: fortran
   :linenothreshold: 2

FPL module
================

**FPL** works as a module and can be compiled with other programs.
Its structure is composed of several files containing all definitions of data types, 
external libraries and intrinsic functions.

::

  !:=========================== FPL Main Module =================================
  module FPL
    use omp_lib
    use netcdf
    use iso_c_binding
    implicit none
    include "FPL_constants.f90"    !Parameter variables
    include "FPL_datatypes.f90"    !Datatype structure declarations
    include "FPL_interfaces.f90"   !Interfaces for subroutines definitions and datatypes
  
    contains
    include "FPL_checkerror.f90"   !Error checker subroutines
    include "FPL_datetime.f90"     !System date-time subroutine
    include "FPL_griddims.f90"     !Subroutines to get the number of coordinates from NetCDF file
    include "FPL_readgrid.f90"     !NetCDF file reader subroutines
    include "FPL_writegrid.f90"    !NetCDF file writer subroutines
    include "FPL_setfillvalue.f90" !Set FillValue and mask creator subroutines
    include "FPL_gengrid.f90"      !Generate custom grid 
    include "FPL_dealloc.f90"      !Deallocate subroutines
    include "FPL_fileutils.f90"    !File Utilities
    include "FPL_misc.f90"         !Miscelanious
    include "FPL_sort.f90"         !Bubble sort subroutine
  end module FPL

Data Types and Parameter Definitions
====================================

**FPL** supports 5 datatype structures: **BYTE**, **SHORT**, **INTEGER**, **FLOAT** and **DOUBLE**.

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

Numeric datatypes are defined using **ISO_C_BINDINGS** module into the file **FPL_constants.f90**.
Parameters can be defined into this file too.

::

  integer, parameter :: byte = C_SIGNED_CHAR
  integer, parameter :: short = C_SHORT
  integer, parameter :: intgr = C_INT
  integer, parameter :: float = C_FLOAT
  integer, parameter :: double = C_DOUBLE
  
  real(kind=double), parameter :: pi = 4*atan(1.0)                ! pi
  real(kind=double), parameter :: earth_radius = 6371.0           ! average radius of earth ~ km
  real(kind=double), parameter :: acc_gravity = 9.80616           ! acceleration of gravity ~ m/s^2
  real(kind=double), parameter :: stefan_boltzmann = 5.670373e-8  ! Stefan-Boltzmann constant ~ W/m^2K^4
  real(kind=double), parameter :: boltzmann = 1.38064852e-23      ! Boltzmann constant ~ JK^-1
  real(kind=double), parameter :: speed_of_light = 299792458.0    ! Speed of the light ~ m/s
  real(kind=double), parameter :: atomic_mass = 1.660539040e-27   ! Atomic mass constant ~ kg
  real(kind=double), parameter :: avogadro = 6.022140857e23       ! Avogadro constant ~ mol^-1


**FPL** can read and write data up to 4 dimensions in a much simpler way using dynamic data structures and dynamic modules as follows:

Type Structures
===============

.. toctree::
   :maxdepth: 2

   datatypes/nc2d
   datatypes/nc3d
   datatypes/nc4d

Interfaces
==========

Interfaces can be used to invoke different functions using the same name.

.. toctree::
   :maxdepth: 2

   interfaces/interfaces

Functions and Subroutines
=========================

.. toctree::
   :maxdepth: 2

   functions_subroutines/gengrid2d
   functions_subroutines/gengrid3d
   functions_subroutines/gengrid4d
   functions_subroutines/griddims2d
   functions_subroutines/griddims3d
   functions_subroutines/griddims4d
   functions_subroutines/readgrid2d
   functions_subroutines/readgrid3d
   functions_subroutines/readgrid4d
   functions_subroutines/writegrid2d
   functions_subroutines/writegrid3d
   functions_subroutines/writegrid4d
   functions_subroutines/setfillvalue2d
   functions_subroutines/setfillvalue3d
   functions_subroutines/setfillvalue4d
   functions_subroutines/dealloc2d
   functions_subroutines/dealloc3d
   functions_subroutines/dealloc4d

Utilities
---------

.. toctree::
   :maxdepth: 2

   functions_subroutines/utilities

Error Checker
-------------

.. toctree::
   :maxdepth: 2

   functions_subroutines/checkerrors

