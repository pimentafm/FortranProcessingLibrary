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

#:======== Makefile =======

#RedHat netcdf modules path
netcdf_mod=-I/usr/lib64/gfortran/modules/

#ncf90api source files and directories
ncf90api_srcdir=$(shell pwd)/src/
ncf90api_libdir=/usr/local/ncf90api/
ncf90api_docs=docs/_build/html/

#ncf90api library and module names
ncf90api_lib=libncf90api.so
ncf90api_mod=ncf90api.mod

FLAGS=-Wall -shared -fPIC
OPENMP=-fopenmp

$(shell mkdir -p $(ncf90api_libdir))

compile:
	gfortran $(OPENMP) $(FLAGS) -o $(ncf90api_lib) $(ncf90api_srcdir)ncf90api.f90 $(netcdf_mod) -lnetcdff -lnetcdf
	chown 775 $(ncf90api_lib)
	mv $(ncf90api_lib) $(ncf90api_libdir)
	mv $(ncf90api_mod) $(ncf90api_libdir)
	cp -r $(ncf90api_docs) $(ncf90api_libdir)docs

clean:
	rm -rf $(ncf90api_libdir)
