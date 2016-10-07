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

!:==================== Defined constants ======== =============================
program constants
  use f90netcdf
  implicit none

  write(*,*) "f90NetCDF datatype constants"
  write(*,*) "============================"

  write(*,'(a8,i2)') "   BYTE: ", byte
  write(*,'(a8,i2)') "  SHORT: ", short
  write(*,'(a8,i2)') "INTEGER: ", intgr
  write(*,'(a8,i2)') "  FLOAT: ", float
  write(*,'(a8,i2)') " DOUBLE: ", double, char(10)
  
  write(*,*) "f90NetCDF parameters and constants"
  write(*,*) "=================================="
  write(*,'(a39,f12.9)') "                                  pi: ", pi
  write(*,'(a39,f12.6)') "        Average radius of earth (km): ", earth_radius
  write(*,'(a39,f10.7)') "     Acceleration of gravity (m/s^2): ", acc_gravity
  write(*,'(a39,f12.1)') "            Speed of the light (m/s): ", speed_of_light
  write(*,'(a39,es13.6e2)') " Stefan-Boltzmann constant (W/m^2K^4): ", stefan_boltzmann
  write(*,'(a39,es15.8e2)') "          Boltzmann constant (JK^-1): ", boltzmann
  write(*,'(a39,es16.9e2)') "           Atomic mass constant (kg): ", atomic_mass
  write(*,'(a39,es16.9e2)') "          Avogadro constant (mol^-1): ", avogadro

end program constants
