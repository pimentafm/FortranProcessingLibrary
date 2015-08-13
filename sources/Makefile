#:========================================================================
# This file is part of f90NetCDF API (NetCDF API for Fortran 90).

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

#:========================================================================
#About Author:
#Student of Surveying and Cartographic Engineering
# Federal University of Viçosa - Brazil

#Bachelor of Biosystems Engineer
# Federal University of São João del-Rei - Brazil

# Reserach Group on Atmosphere-Biosphere Interaction
# Federal University of Viçosa
# Data: August 09, 2015

#Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
#:========================================================================
compile:
	gfortran -shared -fPIC -o libncf90api.so ncf90api.f90 -I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
	cp libncf90api.so /usr/lib64/
	cp ncf90api.mod /usr/lib64/gfortran/modules/
	gfortran ncf90api_test.f90 -lncf90api
#	gfortran -c ncf90api.f90 -I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
#	gfortran ncf90api_test.f90 ncf90api.o -I/usr/lib64/gfortran/modules/ -lnetcdff -lnetcdf
