!:=============================================================================
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

!:=============================================================================
!About Author:
!Student of Surveying and Cartographic Engineering
! Federal University of Viçosa - Brazil

!Bachelor of Biosystems Engineer
! Federal University of São João del-Rei - Brazil

! Research Group on Atmosphere-Biosphere Interaction
! Federal University of Viçosa
! Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:=============================================================================

!:==================== A Very Simple Test Program =============================
program main
  use ncf90api
  implicit none

  type(nc3d_double) :: cattle
  !type(nc2d_double) :: outfile

  character(200) :: inputpath!, outputpath

  inputpath = "/home/fernando/Documents/WORKSPACE/dadosTestef90netcdfapi/CATTLE19902012.nc"
  !outputpath = "/home/fernando/Documents/WORKSPACE/dadosTestef90netcdfapi/cattle.nc"

  cattle%varname = "Cattle"
  cattle%timename = "time"
  cattle%lonname = "lon"
  cattle%latname = "lat"

  call ncoords(inputpath, cattle)

  write(*,*) "ntimes: ", cattle%ntimes
  write(*,*) "nlats: ", cattle%nlats
  write(*,*) "nlons: ", cattle%nlons
  write(*,*) "timename: ", cattle%timename
  write(*,*) "latname: ", cattle%latname
  write(*,*) "lonanme: ", cattle%lonname
  write(*,*) "timeunits: ", cattle%timeunits
  write(*,*) "latunits: ", cattle%latunits
  write(*,*) "lonunits: ", cattle%lonunits
  write(*,*) "varunits: ", cattle%varunits
  


   
  
  !call readgrid(inputpath, landuse)

  !outfile = landuse

  !call writegrid(outputpath, outfile)
 
end program main
