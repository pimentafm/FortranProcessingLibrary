!:========================================================================
! This file is part of f90NetCDF API (NetCDF API for Fortran 90).

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

!NetCDF(lon, lat) byte
type :: nc2d_byte
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=C_INT) :: nlons, nlats, vartype
  integer(kind=C_SIGNED_CHAR) :: f_value
  real(kind=C_DOUBLE),dimension(:), allocatable :: longitudes, latitudes
  integer(kind=C_SIGNED_CHAR), dimension(:,:), allocatable ::  ncdata
end type nc2d_byte


!NetCDF(lon, lat) short
type :: nc2d_short
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=C_INT) :: nlons, nlats, vartype
  integer(kind=C_SHORT) :: f_value
  real(kind=C_DOUBLE),dimension(:), allocatable :: longitudes, latitudes
  integer(kind=C_SHORT), dimension(:,:), allocatable ::  ncdata
end type nc2d_short


!NetCDF(lon, lat) int
type :: nc2d_int
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=C_INT) :: nlons, nlats, vartype
  integer(kind=C_INT) :: f_value
  real(kind=C_DOUBLE),dimension(:), allocatable :: longitudes, latitudes
  integer(kind=C_INT), dimension(:,:), allocatable ::  ncdata
end type nc2d_int


!NetCDF(lon, lat) float
type :: nc2d_float
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=C_INT) :: nlons, nlats, vartype
  real(kind=C_FLOAT) :: f_value
  real(kind=C_DOUBLE),dimension(:), allocatable :: longitudes, latitudes
  real(kind=C_FLOAT), dimension(:,:), allocatable ::  ncdata
end type nc2d_float


!NetCDF(lon, lat) double
type :: nc2d_double
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=C_INT) :: nlons, nlats, vartype
  real(kind=C_DOUBLE) :: f_value
  real(kind=C_DOUBLE),dimension(:), allocatable :: longitudes, latitudes
  real(kind=C_DOUBLE), dimension(:,:), allocatable ::  ncdata
end type nc2d_double





