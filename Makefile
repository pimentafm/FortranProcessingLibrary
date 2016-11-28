#:=============================================================================
# This file is part of FPL (Fortran Processing Library).
# Copyright (C) 2015 Fernando Martins Pimenta

# FPL API is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# FPL API is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with FPL_tools.  If not, see <http://www.gnu.org/licenses/>.

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
