Data Types and Structures
*************************

.. highlight:: fortran

ncf90api module
===============

**ncf90api** functions as a module that can be compiled with other programs.
Its structure is composed of several files containing all definitions of data types, 
external libraries and intrinsic functions.

::

  module ncf90api
    use netcdf
    use iso_c_binding
    implicit none
    include "ncf90api_constants.f90"   !Parameter variables
    include "ncf90api_datatypes.f90"   !Datatype structure declarations
    include "ncf90api_interfaces.f90"  !Interfaces for subroutines definitions and datatypes

    contains
    include "ncf90api_checkerror.f90"  !Error checker subroutines
    include "ncf90api_datetime.f90"    !System date-time subroutine
    include "ncf90api_griddims.f90"    !Subroutines to get the number of coordinates from NetCDF file
    include "ncf90api_readgrid.f90"    !NetCDF file reader subroutines
    include "ncf90api_writegrid.f90"   !NetCDF file writer subroutines
    include "ncf90api_fvalue.f90"      !Set FillValue and mask creator subroutines
    include "ncf90api_fileutils.f90"   !File Utilities
  end module ncf90api

Data Types and Parameters Definition
====================================

**ncf90api** supports 5 datatype structures.

**BYTE**, **SHORT**, **INTEGER**, **FLOAT** and **DOUBLE**.

Datatypes are defined using **ISO_C_BINDINGS** module into the file **ncf90api_constants.f90**.
Parameters can be defined into this file too.

::

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

The structures following the syntax below:

For 2d dataset:

::

  !NetCDF(lon, lat)
  type :: nc2d_DATATYPE_llLATLONDATATYPE
    sequence
    character(len=20) :: varname, lonname, latname, varunits, long_name, &
                         lonunits, latunits
    integer(kind=intgr) :: nlons, nlats, vartype
    integer(kind=DATATYPE) :: FillValue
    real(kind=LATLONDATATYPE), dimension(:), allocatable :: longitudes, latitudes
    integer(kind=DATATYPE), dimension(:,:), allocatable :: ncdata
  end type nc2d_DATATYPE_llLATLONDATATYPE

For 3d dataset:

::

  !NetCDF(lon, lat, time)
  type :: nc3d_DATATYPE_llLONLATDATATYPE_tTIMEDATATYPE
    sequence
    character(len=20) :: varname, timename, lonname, latname, varunits, &
                         long_name, lonunits, latunits, timeunits
    integer(kind=intgr) :: nlons, nlats, ntimes, vartype
    integer(kind=DATATYPE) :: FillValue
    real(kind=TIMEDATATYPE), dimension(:), allocatable :: times
    real(kind=LONLATDATATYPE), dimension(:), allocatable :: longitudes, latitudes
    integer(kind=DATATYPE), dimension(:,:,:), allocatable :: ncdata
  end type nc3d_DATATYPE_llLONLATDATATYPE_tTIMEDATATYPE

Functions
=========

ncoords
-------

ncoords2d
.........

ncoords3d
.........

readgrid
--------

readgrid2d
..........

readgrid3d
..........

writegrid
---------

writegrid2d
...........

writegrid3d
...........

setFillValue
------------

setFillvalue2d
..............

setFillvalue3d
..............

Interfaces
==========
