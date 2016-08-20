#:=============================================================================
# This file is part of f90NetCDF API (Fortran 90 API for NetCDF).

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
#About Author:
#Student of Surveying and Cartographic Engineering
# Federal University of Viçosa - Brazil

#Bachelor of Biosystems Engineer
# Federal University of São João del-Rei - Brazil

# Research Group on Atmosphere-Biosphere Interaction
# Federal University of Viçosa
# Data: August 09, 2015

#Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
#:=============================================================================

#Check OS
OS=$(shell lsb_release -si)
ARCH=$(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VERSION=$(shell lsb_release -sr)

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

ex4:	
	gfortran $(FLAGS) -o $(progname)mary.out f90NetCDF_mary.f90 $(f90NetCDF_module) $(f90NetCDF_library)

ex5:	
	gfortran $(FLAGS) -o $(progname)5p.out f90NetCDF_5p.f90 $(f90NetCDF_module) $(f90NetCDF_library)

correcao:	
	gfortran $(FLAGS) -o $(progname)correcao.out f90NetCDF_correcao.f90 $(f90NetCDF_module) $(f90NetCDF_library)

clean:
	rm -f *.out
