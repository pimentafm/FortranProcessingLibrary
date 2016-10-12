#:=============================================================================
# This file is part of f90NetCDF (Fortran 90 API for NetCDF).

# Copyright (C) 2015 Fernando Martins Pimenta

# f90NetCDF API is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# f90NetCDF API is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with f90NetCDF_tools.  If not, see <http://www.gnu.org/licenses/>.

#:=============================================================================
# About Author:
#  Fernando Martins Pimenta
#  Student of Surveying and Cartographic Engineering
#  Federal University of Viçosa - Brazil

#  Bachelor of Biosystems Engineer
#  Federal University of São João del-Rei - Brazil

#  Research Group on Atmosphere-Biosphere Interaction
#  Federal University of Viçosa
#  Data: August 09, 2015

# Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
#:=============================================================================

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
