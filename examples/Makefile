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
	gfortran $(FLAGS) -o ex1_constants.out ex1_constants.f90 $(FPL_module) $(FPL_library)
ex2:	
	gfortran $(FLAGS) -o ex2_getinfo.out ex2_getinfo.f90 $(FPL_module) $(FPL_library)
ex3:	
	gfortran $(FLAGS) -o ex3_time.out ex3_time.f90 $(FPL_module) $(FPL_library)
ex4:	
	gfortran $(FLAGS) -o ex4_gengrid.out ex4_gengrid.f90 $(FPL_module) $(FPL_library)
ex5:	
	gfortran $(FLAGS) -o ex5_utils.out ex5_utils.f90 $(FPL_module) $(FPL_library)
ex6:	
	gfortran $(FLAGS) -o ex6_dealloc.out ex6_dealloc.f90 $(FPL_module) $(FPL_library)
clean:
	rm -f *.out
