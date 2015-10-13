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

! From Fortran NetCDF sources: module_netcdf_nc_data.F90
!
! Enumerator nc_type data as integers

! NetCDF3 types
!  TODO: Integer(KIND=C_INT), Parameter :: NC_NAT    = 0
! Integer(KIND=C_INT), Parameter :: NC_BYTE   = 1
!  TODO: Integer(KIND=C_INT), Parameter :: NC_CHAR   = 2
! Integer(KIND=C_INT), Parameter :: NC_SHORT  = 3
! Integer(KIND=C_INT), Parameter :: NC_INT    = 4
! Integer(KIND=C_INT), Parameter :: NC_FLOAT  = 5
! Integer(KIND=C_INT), Parameter :: NC_DOUBLE = 6

! TODO:
! Extra NetCDF4 types
! Integer(KIND=C_INT), Parameter :: NC_LONG     = NC_INT
! Integer(KIND=C_INT), Parameter :: NC_UBYTE    = 7
! Integer(KIND=C_INT), Parameter :: NC_USHORT   = 8
! Integer(KIND=C_INT), Parameter :: NC_UINT     = 9
! Integer(KIND=C_INT), Parameter :: NC_INT64    = 10
! Integer(KIND=C_INT), Parameter :: NC_UINT64   = 11

!NetCDF(lon, lat) byte
type :: nc2d_byte
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=byte) :: f_value
  real(kind=double),dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:), allocatable ::  ncdata
end type nc2d_byte


!NetCDF(lon, lat) short
type :: nc2d_short
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=short) :: f_value
  real(kind=double),dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:), allocatable ::  ncdata
end type nc2d_short


!NetCDF(lon, lat) int
type :: nc2d_int
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=intgr) :: f_value
  real(kind=double),dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:), allocatable ::  ncdata
end type nc2d_int


!NetCDF(lon, lat) float
type :: nc2d_float
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=float) :: f_value
  real(kind=double),dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:), allocatable ::  ncdata
end type nc2d_float


!NetCDF(lon, lat) double
type :: nc2d_double
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=double) :: f_value
  real(kind=double),dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:), allocatable ::  ncdata
end type nc2d_double
