!:=============================================================================
! This file is part of f90NetCDF API (Fortran 90 API for NetCDF).

! Copyright (C) 2015 Fernando Martins Pimenta

! f90NetCDF API is free software: you can redistribute it and/or modify
! it under the terms of the GNU General public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! f90NetCDF API is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General public License for more details.

! You should have received a copy of the GNU General public License
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

!:========================== Constants ========================================

integer, parameter :: byte = C_SIGNED_CHAR
integer, parameter :: short = C_SHORT
integer, parameter :: intgr = C_INT
integer, parameter :: float = C_FLOAT
integer, parameter :: double = C_DOUBLE

real(kind=double), parameter :: pi = 4*atan(1.0)                ! pi
real(kind=double), parameter :: earth_radius = 6371.0           ! average radius of earth ~ km
real(kind=double), parameter :: acc_gravity = 9.80616           ! acceleration of gravity ~ m/s^2
real(kind=double), parameter :: stefan_boltzmann = 5.670373e-8  ! Stefan-Boltzmann constant ~ W/m^2K^4
real(kind=double), parameter :: boltzmann = 1.38064852e-23      ! Boltzmann constant ~ JK^-1
real(kind=double), parameter :: speed_of_light = 299792458.0    ! Speed of the light ~ m/s
real(kind=double), parameter :: atomic_mass = 1.660539040e-27   ! Atomic mass constant ~ kg
real(kind=double), parameter :: avogadro = 6.022140857e23       ! Avogadro constant ~ mol^-1


!Units

!real (kind=float), parameter :: km = 1e+3_float                  ! kilometer
!real (kind=float), parameter :: hm = 1e+2_float                  ! hectometer
!real (kind=float), parameter :: dam = 1e+1_float                 ! decameter
!real (kind=float), parameter :: cm = 1e-2_float                  ! centimeter
!real (kind=float), parameter :: dm = 1e-1_float                  ! decimeter
!real (kind=float), parameter :: mm = 1e-3_float                  ! millimeter
!real (kind=float), parameter :: ha = 1e+4_float                  ! hectare

real (kind=float), parameter :: minute = 60_float                 ! minutes (s)
real (kind=float), parameter :: hour = 60_float * minute          ! hour (s)
real (kind=float), parameter :: day = 24_float * hour             ! day (s)
real (kind=float), parameter :: week = 7_float * day              ! week (s)
real (kind=float), parameter :: month = 30.416666667_float * day  ! month (s)
real (kind=float), parameter :: year = 365_float * day            ! year (s)

!real (kind=double), parameter :: degToRad = pi / 180_float       !
!real (kind=double), parameter :: radToDeg = 180_float / pi       !


