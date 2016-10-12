Build System
************

.. highlight:: sh

.. **Download** `f90NetCDF <http://www.biosfera.dea.ufv.br>`_ **Source Code**


Directory Structure
===================

::

  f90NetCDF/
           |---src/
           |      |---f90NetCDF.f90
           |      |---f90NetCDF_constants.f90
           |      |---f90NetCDF_datatypes.f90
           |      |---f90NetCDF_interfaces.f90
           |      |---f90NetCDF_griddims.f90
           |      |---f90NetCDF_readgrid.f90
           |      |---f90NetCDF_writegrid.f90        
           |      |---f90NetCDF_fvalue.f90
           |      |---f90NetCDF_checkerror.f90
           |      |---f90NetCDF_datetime.f90
           |      |---f90NetCDF_fileutils.f90
           |---shell_gencodes/
           |                 |---f90NetCDF_datatype.sh
           |                 |---f90NetCDF_interfaces.sh
           |                 |---f90NetCDF_ncoords.sh
           |                 |---f90NetCDF_readgrid.sh
           |                 |---f90NetCDF_writegrid2d.sh
           |                 |---f90NetCDF_fvalue.sh
           |---examples/
           |           |---Makefile
           |           |---f90NetCDF_getinfo.f90
           |           |---f90NetCDF_mask.f90
           |           |---f90NetCDF_time.f90
           |---docs/
           |       |---**Sphinx document structure**  
           |---Makefile
           |---GNUGPL
           |---README

Instalation
===========

**f90NetCDF** library was developed in Fedora Linux operating system. The compilation was tested in Fedora 23 and Debian 8.4.


Compiling Dependencies
``````````````````````

Run make inside library directory

:: 

  cd f90NetCDF/
  make

.. important::
   * Compile all dependencies first
   * Is necessary to configure Makefile according to your system if errors occur in the compilation.


::
   
  #Check system name version and arch
  OS=$(shell lsb_release -si)
  VERSION=$(shell lsb_release -sr)
  ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
  
  
  #f90NetCDF library and module names
  f90NetCDF_lib=libf90NetCDF.so
  f90NetCDF_mod=f90netcdf.mod
  
  #Compilation parameters
  COMPILER=gfortran
  FLAGS=-Wall -O3 -shared -fPIC -cpp
  OPENMP=-fopenmp
  
  #Check distro
  ifeq ($(OS), $(filter $(OS), Fedora Korora))
    $(info "$(OS) $(VERSION) $(ARCH) bits")
  
    #RedHat netcdf modules path
    netcdf_libs=-I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
  
    #f90NetCDF source files and directories
    f90NetCDF_srcdir=$(shell pwd)/src/
    f90NetCDF_libdir=/usr/lib64/
    f90NetCDF_moddir=/usr/lib64/gfortran/modules/
  endif
  ifeq ($(OS), $(filter $(OS), Debian Ubuntu))
    $(info "$(OS) $(VERSION) $(ARCH) bits")
    #Debian netcdf modules path
    netcdf_libs=-I/usr/include/ -lnetcdff -lnetcdf
    #f90NetCDF source files and directories
    f90NetCDF_srcdir=$(shell pwd)/src/
    f90NetCDF_libdir=/usr/lib/
    f90NetCDF_moddir=/usr/include/
  endif
  
  compile:
  	$(COMPILER) $(OPENMP) $(FLAGS) -o $(f90NetCDF_lib) $(f90NetCDF_srcdir)f90NetCDF.f90 $(netcdf_libs)
  	mv $(f90NetCDF_lib) $(f90NetCDF_libdir)
  	mv $(f90NetCDF_mod) $(f90NetCDF_moddir)


Compile Examples
================

::

  cd examples/
  make ex<N> # N is the number of example

::

  #Check system name version and arch
  OS=$(shell lsb_release -si)
  VERSION=$(shell lsb_release -sr)
  ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
  
  
  #f90NetCDF library and module names
  f90NetCDF_lib=libf90NetCDF.so
  f90NetCDF_mod=f90netcdf.mod
  
  #Compilation parameters
  COMPILER=gfortran
  FLAGS=-Wall -O3 -shared -fPIC -cpp
  OPENMP=-fopenmp
  
  #Check distro
  ifeq ($(OS), $(filter $(OS), Fedora Korora))
    $(info "$(OS) $(VERSION) $(ARCH) bits")
  
    #RedHat netcdf modules path
    netcdf_libs=-I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
  
    #f90NetCDF source files and directories
    f90NetCDF_srcdir=$(shell pwd)/src/
    f90NetCDF_libdir=/usr/lib64/
    f90NetCDF_moddir=/usr/lib64/gfortran/modules/
  endif
  ifeq ($(OS), $(filter $(OS), Debian Ubuntu))
    $(info "$(OS) $(VERSION) $(ARCH) bits")
    #Debian netcdf modules path
    netcdf_libs=-I/usr/include/ -lnetcdff -lnetcdf
    #f90NetCDF source files and directories
    f90NetCDF_srcdir=$(shell pwd)/src/
    f90NetCDF_libdir=/usr/lib/
    f90NetCDF_moddir=/usr/include/
  endif
  
  compile:
  	$(COMPILER) $(OPENMP) $(FLAGS) -o $(f90NetCDF_lib) $(f90NetCDF_srcdir)f90NetCDF.f90 $(netcdf_libs)
  	mv $(f90NetCDF_lib) $(f90NetCDF_libdir)
  	mv $(f90NetCDF_mod) $(f90NetCDF_moddir)
  
