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
ex4:	
	gfortran $(FLAGS) -o ex4_gengrid.out ex4_gengrid.f90 $(f90NetCDF_module) $(f90NetCDF_library)
ex5:	
	gfortran $(FLAGS) -o ex5_utils.out ex5_utils.f90 $(f90NetCDF_module) $(f90NetCDF_library)
clean:
	rm -f *.out
