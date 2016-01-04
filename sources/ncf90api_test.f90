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

!:==================== A Very Simple Test Program ========================
program main
  use ncf90api
  implicit none

  type (nc2d_byte):: states
  type (nc2d_double) :: lu

  character(100) :: lufile, outfile, statesfile, classfile, headerfile

  lu%varname = "landuse"
  lu%lonname = "lon"
  lu%latname = "lat"

  states%varname = "Band1"
  states%lonname = "lon"
  states%latname = "lat"

  headerfile = "/home/fernando/Documents/dados_nc_test/header.txt"
  statesfile = "/home/fernando/Documents/dados_nc_test/maskestados.nc"
  lufile = "/home/fernando/Documents/dados_nc_test/lucult90.nc"

  classfile = "/home/fernando/Documents/dados_nc_test/maskestados_class.txt"

  outfile = "/home/fernando/Documents/dados_nc_test/newdata.nc"

  call readgrid(statesfile, states)
  call readgrid(lufile, lu)

  !:======== zonalstats(map, mask, classfile) -> classfile is optional
  !call zonalstats(lu, states, classfile)
  !call zonalstats(lu, states)

  !setfvalue(mask, map, num) -> num is optional

  call setfvalue(states, lu)

  call writegrid(outfile, lu)

  call system('qgis '//trim(adjustl(outfile)))

end program main
