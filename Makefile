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
srcdir=$(shell pwd)/src/
ncf90lib=libncf90api.so
ncf90mod=ncf90api.mod
compile:
	gfortran -shared -fPIC -o $(ncf90lib) $(srcdir)ncf90api.f90 -I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
	chown 775 $(ncf90lib)
	mv $(ncf90lib) /usr/lib64/
	mv $(ncf90mod) /usr/lib64/gfortran/modules/
	gfortran -Wall -W $(srcdir)ncf90api_test.f90 -I/usr/lib64/gfortran/modules/ -lncf90api
