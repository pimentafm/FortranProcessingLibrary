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

!:========================= Defined constants =================================
program main
  use fpl
  implicit none

  type(nc4d_float_llf_tf_lf) :: tempC
  character(len=32) :: input, output

  input = "database/temp.mon.nc"
  output = "database/temp.mon.farenheit.nc"

  tempC%varname = "temp"
  tempC%lonname = "longitude"
  tempC%latname = "latitude"
  tempC%timename = "time"
  tempC%levelname = "level"

  call readgrid(input, tempC)

  write(*,*) tempC%nlevels
  write(*,*) tempC%nlats
  write(*,*) tempC%nlons
  write(*,*) tempC%ntimes
  write(*,*) "==========="
  write(*,*) tempC%longitudes(1) 
  write(*,*) tempC%latitudes(1)
  write(*,*) tempC%levels(1)
  write(*,*) tempC%times(1)
  write(*,*) tempC%times(12)
  

  call writegrid(output, tempC)

end program main
