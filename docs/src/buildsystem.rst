Build System
************

.. highlight:: sh

Download f90NetCDF API Source Code
==================================

Download the `f90NetCDF <http://www.biosfera.dea.ufv.br>`_ source code 

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

The **f90NetCDF** library was developed in Fedora Linux operating system. The compilation was tested in Fedora 23 and Debian 8.4.

.. note::
   
  If your operating system has different architecture you can define the variables according to it in the Makefile.

:: 

  cd f90NetCDF/
  make

::
   
 #Check OS
 OS=$(shell lsb_release -si)
 ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
 VERSION=$(shell lsb_release -sr) 
 
 #f90NetCDF library and module names
 f90NetCDF_lib=libf90NetCDF.so
 f90NetCDF_mod=f90netcdf.mod
 
 COMPILER=gfortran
 FLAGS=-Wall -shared -O3 -fPIC -cpp
 OPENMP=-fopenmp

 #Modify the paths below according to your operating system ======
 ifeq ($(OS), Fedora)
   $(info "$(OS) $(VERSION) $(ARCH) bits")
 
   #RedHat netcdf modules path
   netcdf_libs=-I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
 
   #f90NetCDF source files and directories
   f90NetCDF_srcdir=$(shell pwd)/src/
   f90NetCDF_libdir=/usr/lib64/
   f90NetCDF_moddir=/usr/lib64/gfortran/modules/
 endif
 ifeq ($(OS), Debian)
   $(info "$(OS) $(VERSION) $(ARCH) bits")
   #Debian netcdf modules path
   netcdf_libs=-I/usr/include/ -lnetcdff -lnetcdf
   #f90NetCDF source files and directories
   f90NetCDF_srcdir=$(shell pwd)/src/
   f90NetCDF_libdir=/usr/lib/
   f90NetCDF_moddir=/usr/include/
 endif
 #================================================================

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

 #Check OS
 OS=$(shell lsb_release -si)
 ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
 VERSION=$(shell lsb_release -sr)
 
 #Modify the paths below according to your operating system ======
 ifeq ($(OS), Fedora)
   #Print OS
   $(info "$(OS) $(VERSION) $(ARCH) bits")
 
   #Set module path
   f90NetCDF_module=-I/usr/lib64/gfortran/modules/
 endif
 ifeq ($(OS), Debian)
   #Print OS
   $(info "$(OS) $(VERSION) $(ARCH) bits")
 
   #Set module path
   f90NetCDF_module=-I/usr/include/
 endif 
 #================================================================
 
 srcdir=$(shell pwd)/src/
 
 f90NetCDF_library=-lf90NetCDF
 
 #Debian based
 #f90NetCDF_module=-I/usr/include/
 
 progname=f90NetCDF_
 
 FLAGS=-Wall -O3
 
 ex1:
         gfortran $(FLAGS) -o $(progname)getinfo.out f90NetCDF_getinfo.f90 $(f90NetCDF_module) $(f90NetCDF_library)
 
 ex2:    
         gfortran $(FLAGS) -o $(progname)mask.out f90NetCDF_mask.f90 $(f90NetCDF_module) $(f90NetCDF_library)
 
 ex3:    
         gfortran $(FLAGS) -o $(progname)time.out f90NetCDF_time.f90 $(f90NetCDF_module) $(f90NetCDF_library)
 
 clean:
         rm -f *.out

