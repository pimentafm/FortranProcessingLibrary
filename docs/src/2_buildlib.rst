.. _buildlib:

Build Library
*************

.. highlight:: sh

.. **Download** `FPL <http://www.biosfera.dea.ufv.br>`_ **Source Code**

Directory Structure
===================

::

  FPL/
           |---src/
           |      |---FPL.f90
           |      |---FPL_checkerror.f90
           |      |---FPL_constants.f90
           |      |---FPL_datatypes.f90
           |      |---FPL_datetime.f90
           |      |---FPL_dealloc.f90
           |      |---FPL_fileutils.f90        
           |      |---FPL_gengrid.f90
           |      |---FPL_griddims.f90
           |      |---FPL_interfaces.f90
           |      |---FPL_misc.f90
           |      |---FPL_readgrid.f90
           |      |---FPL_setfillvalue.f90
           |      |---FPL_sort.f90
           |      |---FPL_writegrid.f90
           |
           |---shell_gencodes/
           |                 |---fpl_datatype.sh
           |                 |---fpl_dealloc.sh
           |                 |---fpl_gengrid.sh
           |                 |---fpl_griddims.sh
           |                 |---fpl_interfaces.sh
           |                 |---fpl_readgrid.sh
           |                 |---fpl_setfillvalue.sh
           |                 |---fpl_writegrid.sh
           |
           |---examples/
           |           |---Makefile
           |           |---ex_libtest.f90
           |           |---ex1_readwrite.f90
           |           |---ex2_getinfo.f90
           |           |---ex3_time.f90
           |           |---ex4_gengrid.f90
           |           |---ex5_utils.f90
           |           |---ex6_dealloc.f90
           |
           |---docs/
           |       |---**Sphinx document structure**  
           |
           |---Makefile
           |---GNUGPL
           |---README

Dependencies
============

|links|

.. |links| raw:: html

  <ul>
    <li><a href="https://gcc.gnu.org/onlinedocs/gfortran" target="_blank">GNU Fortran Compiler</a></li>
    <li><a href="http://www.unidata.ucar.edu/software/netcdf/" target="_blank">netCDF Library (C/C++ and Fortran)</a></li>
    <li><a href="https://gcc.gnu.org/onlinedocs/gfortran/Interoperability-with-C.html" target="_blank">ISO_C_BINDINGS</a></li>
    <li><a href="http://openmp.org" target="_blank">OpenMP</a> (optional)</li>
  </ul> 
   


Instalation
===========
**FPL** was developed in Fedora Linux operating system. The compilation was tested in Fedora 23, Korora 25, Debian 8.4 and Ubuntu 15.10.

.. important::

  * Run make inside library directory after installing the dependencies.

:: 

  cd fpl/
  make

The required settings can be made in the Makefile according to each operating system.
Example below shows a configuration compatible with Fedora-based systems and some Debian-based systems.

::
   
  #Check system name version and arch
  OS=$(shell lsb_release -si)
  VERSION=$(shell lsb_release -sr)
  ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
  
  #FPL library and module names
  FPL_lib=libFPL.so
  FPL_mod=fpl.mod
  
  #Compilation parameters
  COMPILER=gfortran
  FLAGS=-Wall -O3 -shared -fPIC -cpp
  OPENMP=-fopenmp
  
  #Check distro
  ifeq ($(OS), $(filter $(OS), Fedora Korora))
    $(info "$(OS) $(VERSION) $(ARCH) bits")
  
    #RedHat netcdf modules path
    netcdf_libs=-I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
  
    #FPL source files and directories
    FPL_srcdir=$(shell pwd)/src/
    FPL_libdir=/usr/lib64/
    FPL_moddir=/usr/lib64/gfortran/modules/
  endif
  ifeq ($(OS), $(filter $(OS), Debian Ubuntu))
    $(info "$(OS) $(VERSION) $(ARCH) bits")
    #Debian netcdf modules path
    netcdf_libs=-I/usr/include/ -lnetcdff -lnetcdf
    #FPL source files and directories
    FPL_srcdir=$(shell pwd)/src/
    FPL_libdir=/usr/lib/
    FPL_moddir=/usr/include/
  endif
  
  compile:
  	$(COMPILER) $(OPENMP) $(FLAGS) -o $(FPL_lib) $(FPL_srcdir)FPL.f90 $(netcdf_libs)
  	mv $(FPL_lib) $(FPL_libdir)
  	mv $(FPL_mod) $(FPL_moddir)
  
.. note::
  * Configure Makefile according to your system only if errors occur in compilation.

Compile Examples
''''''''''''''''

Check if the compilation ran without errors running some of the example programs.

::

  cd examples/
  make ex<N> # N is the number of example

::

  #Check OS
  OS=$(shell lsb_release -si)
  ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
  VERSION=$(shell lsb_release -sr)
  
  ifeq ($(OS), $(filter $(OS), Fedora Korora))
    #Print OS
    $(info "$(OS) $(VERSION) $(ARCH) bits")
    
    #Set module path
    FPL_module=-I/usr/lib64/gfortran/modules/
  endif
  ifeq ($(OS), $(filter $(OS), Debian Ubuntu))
    #Print OS
    $(info "$(OS) $(VERSION) $(ARCH) bits")
    
    #Set module path
    FPL_module=-I/usr/include/
  endif
  
  FPL_library=-lFPL
  
  #Debian based
  #FPL_module=-I/usr/include/
  
  FLAGS= -Wall -O3
  OMP= -fopenmp
  
  ex0:
  	gfortran $(FLAGS) $(OMP) -o ex0_libtest.out ex0_libtest.f90 $(FPL_module) $(FPL_library)
  ex1:
  	gfortran $(FLAGS) -o ex1_readwrite.out ex1_readwrite.f90 $(FPL_module) $(FPL_library)
  ex2:	
  	gfortran $(FLAGS) -o ex2_getinfo.out ex2_getinfo.f90 $(FPL_module) $(FPL_library)
  ex3:	
  	gfortran $(FLAGS) -o ex3_time.out ex3_time.f90 $(FPL_module) $(FPL_library)
  ex4:	
  	gfortran $(FLAGS) $(OMP) -o ex4_gengrid.out ex4_gengrid.f90 $(FPL_module) $(FPL_library)
  ex5:	
  	gfortran $(FLAGS) -o ex5_utils.out ex5_utils.f90 $(FPL_module) $(FPL_library)
  ex6:	
  	gfortran $(FLAGS) -o ex6_dealloc.out ex6_dealloc.f90 $(FPL_module) $(FPL_library)
  clean:
  	rm -f *.out

Run the examples to check the library functions.
