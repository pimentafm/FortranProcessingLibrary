Build System
************

.. highlight:: sh

Download ncf90api Source Code
=============================

`Download the ncf90api source code <http://www.biosfera.dea.ufv.br>`__

Directory Structure
===================

::

  ncf90api
          -->src
                ncf90api.f90
                ncf90api_constants.f90
                ncf90api_datatypes.f90
                ncf90api_interfaces.f90
                ncf90api_griddims.f90
                ncf90api_readgrid.f90
                ncf90api_writegrid.f90        
                ncf90api_fvalue.f90
                ncf90api_checkerror.f90
                ncf90api_datetime.f90
                ncf90api_fileutils.f90
          -->shell_gencodes
                           ncf90api_datatype.sh
                           ncf90api_interfaces.sh
                           ncf90api_ncoords.sh
                           ncf90api_readgrid.sh
                           ncf90api_writegrid2d.sh
                           ncf90api_fvalue.sh
          -->examples
                     Makefile
                     ncf90api_getinfo.f90
                     ncf90api_mask.f90
                     ncf90api_time.f90
          -->docs
          Makefile
          GNUGPL
          README

Instalation
===========

The **ncf90api** library was developed in Fedora Linux operating system. The compilation was tested in Fedora 23 and Debian 8.4.

.. note::
   
  If your operating system has different architecture you can define the variables according to it in the Makefile.

:: 

  cd ncf90api/
  make

::
   
 #Check OS
 OS=$(shell lsb_release -si)
 ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
 VERSION=$(shell lsb_release -sr) 
 
 #ncf90api library and module names
 ncf90api_lib=libncf90api.so
 ncf90api_mod=ncf90api.mod
 
 COMPILER=gfortran
 FLAGS=-Wall -shared -O3 -fPIC -cpp
 OPENMP=-fopenmp

 #Modify the paths below according to your operating system ======
 ifeq ($(OS), Fedora)
   $(info "$(OS) $(VERSION) $(ARCH) bits")
 
   #RedHat netcdf modules path
   netcdf_libs=-I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
 
   #ncf90api source files and directories
   ncf90api_srcdir=$(shell pwd)/src/
   ncf90api_libdir=/usr/lib64/
   ncf90api_moddir=/usr/lib64/gfortran/modules/
 endif
 ifeq ($(OS), Debian)
   $(info "$(OS) $(VERSION) $(ARCH) bits")
   #Debian netcdf modules path
   netcdf_libs=-I/usr/include/ -lnetcdff -lnetcdf
   #ncf90api source files and directories
   ncf90api_srcdir=$(shell pwd)/src/
   ncf90api_libdir=/usr/lib/
   ncf90api_moddir=/usr/include/
 endif
 #================================================================

 compile:
         $(COMPILER) $(OPENMP) $(FLAGS) -o $(ncf90api_lib) $(ncf90api_srcdir)ncf90api.f90 $(netcdf_libs)
         mv $(ncf90api_lib) $(ncf90api_libdir)
         mv $(ncf90api_mod) $(ncf90api_moddir)


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
   ncf90api_module=-I/usr/lib64/gfortran/modules/
 endif
 ifeq ($(OS), Debian)
   #Print OS
   $(info "$(OS) $(VERSION) $(ARCH) bits")
 
   #Set module path
   ncf90api_module=-I/usr/include/
 endif 
 #================================================================
 
 srcdir=$(shell pwd)/src/
 
 ncf90api_library=-lncf90api
 
 #Debian based
 #ncf90api_module=-I/usr/include/
 
 progname=ncf90api_
 
 FLAGS=-Wall -O3
 
 ex1:
         gfortran $(FLAGS) -o $(progname)getinfo.out ncf90api_getinfo.f90 $(ncf90api_module) $(ncf90api_library    )
 
 ex2:    
         gfortran $(FLAGS) -o $(progname)mask.out ncf90api_mask.f90 $(ncf90api_module) $(ncf90api_library)
 
 ex3:    
         gfortran $(FLAGS) -o $(progname)time.out ncf90api_time.f90 $(ncf90api_module) $(ncf90api_library)
 
 clean:
         rm -f *.out

