Build Library
*************

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

Dependencies
============
* `GNU Fortran Compiler <https://gcc.gnu.org/onlinedocs/gfortran/>`_
* `NetCDF Library (C/C++ and Fortran) <http://www.unidata.ucar.edu/software/netcdf/>`_
* `ISO_C_BINDINGS <https://gcc.gnu.org/onlinedocs/gfortran/Interoperability-with-C.html>`_
* `OpenMP <http://openmp.org/wp/openmp-specifications/>`_ (Optional)

Instalation
===========
**f90NetCDF** library was developed in Fedora Linux operating system. The compilation was tested in Fedora 23 and Debian 8.4.

.. important::

  * Run make inside library directory after installing the dependencies.

:: 

  cd f90NetCDF/
  make

The required settings can be made in the Makefile according to each operating system.
Example below shows a configuration compatible with Fedora-based systems and some Debian-based systems.

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
    f90NetCDF_module=-I/usr/lib64/gfortran/modules/
  endif
  ifeq ($(OS), $(filter $(OS), Debian Ubuntu))
    #Print OS
    $(info "$(OS) $(VERSION) $(ARCH) bits")
    
    #Set module path
    f90NetCDF_module=-I/usr/include/
  endif
  
  f90NetCDF_library=-lf90NetCDF
  
  #Debian based
  #f90NetCDF_module=-I/usr/include/
  
  FLAGS= -Wall -O3
  
  ex1:
  	gfortran $(FLAGS) -o ex1_constants.out ex1_constants.f90 $(f90NetCDF_module) $(f90NetCDF_library)
  
  ex2:	
  	gfortran $(FLAGS) -o ex2_getinfo.out ex2_getinfo.f90 $(f90NetCDF_module) $(f90NetCDF_library)
  
  ex3:	
  	gfortran $(FLAGS) -o ex3_time.out ex3_time.f90 $(f90NetCDF_module) $(f90NetCDF_library)
  
  clean:
  	rm -f *.out
 
