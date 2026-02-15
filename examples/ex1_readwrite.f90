!:=============================================================================
! This file is part of FPL (Fortran Processing Library).

! Copyright (C) 2015 Fernando Martins Pimenta

! FPL is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! FPL is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with FPL.  If not, see <http://www.gnu.org/licenses/>.

!:=============================================================================
! About Author:
! Fernando Martins Pimenta
!  Student of Surveying and Cartographic Engineering
!  Federal University of Viçosa - Brazil

!  Bachelor of Biosystems Engineer
!  Federal University of São João del-Rei - Brazil

!  Research Group on Atmosphere-Biosphere Interaction
!  Federal University of Viçosa
!  Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:=============================================================================

!:+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Reads a temperature data from netcdf and, converts it 
! from Celsius to Farenheit and write converted data on file
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program main
  use fpl
  implicit none

  !Definition of dataset structure
  !Variable to be read is float type, with 4 dimensions (longitude (float), latitude (float), time(float) and level(float))
  type(nc4d_float_llf_tf_lf) :: tempC

  character(len=32) :: input, output

  input = "database/temp.mon.nc"
  output = "database/temp.mon.farenheit.nc"

  !Definition of attributes for reading the dataset
  tempC%varname = "temp"
  tempC%lonname = "longitude"
  tempC%latname = "latitude"
  tempC%timename = "time"
  tempC%levelname = "level"

  !Reads data from file
  call readgrid(input, tempC)

  !Convertion Celsius to Farenheit
 
   where(tempC%ncdata.ne.tempC%FillValue) tempC%ncdata = (tempC%ncdata*9/5)+32
   
   !Definition of new variable unit
   tempC%varunits = "degF"

  !Write the data on file
  call writegrid(output, tempC)

  !Deallocate memory
  call dealloc(tempC)

end program main
