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

  type(nc4d_float_lld_td_lf) :: var

  character(200) :: inputpath, outputpath

  inputpath = "/home/fernando/Documents/WORKSPACE/dadosTestef90netcdfapi/test_echam_spectral2.nc"
  
  outputpath = "/home/fernando/Documents/WORKSPACE/dadosTestef90netcdfapi/output/specX.nc"

  var%varname = "aclcac"
  var%levelname = "mlev"
  var%lonname = "lon"
  var%latname = "lat"
  var%timename = "time"

  call readgrid4d_float_lld_td_lf(inputpath, var)

  call writegrid(outputpath, var)

  write(*,*) var%nlons
  write(*,*) var%nlats
  write(*,*) var%ntimes
  write(*,*) var%timeunits 
  write(*,*) var%nlevels
  write(*,*) var%levelunits

end program main
