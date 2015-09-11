!:========================================================================
! This file is part of f90NetCDF API (Fortran 90 API for NetCDF).

! Copyright (C) 2015 Fernando Martins Pimenta

! f90NetCDF API is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! f90NetCDF API is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with f90NetCDF.  If not, see <http://www.gnu.org/licenses/>.

!:========================================================================
!About Author:
!Student of Surveying and Cartographic Engineering
! Federal University of Viçosa - Brazil

!Bachelor of Biosystems Engineer
! Federal University of São João del-Rei - Brazil

! Research Group on Atmosphere-Biosphere Interaction
! Federal University of Viçosa
! Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:========================================================================

!NetCDF(lon, lat)
interface check
  module procedure checkerror, checktype
end interface check

interface ncoords
  module procedure ncoords2d_byte, ncoords2d_short, &
                   ncoords2d_int, ncoords2d_float, &
                   ncoords2d_double
end interface ncoords

interface readgrid
  module procedure readgrid2d_byte, readgrid2d_short, &
                   readgrid2d_int, readgrid2d_float, &
                   readgrid2d_double
end interface readgrid

interface writegrid
  module procedure writegrid2d_byte, writegrid2d_short, &
                   writegrid2d_int, writegrid2d_float, &
                   writegrid2d_double
end interface writegrid
