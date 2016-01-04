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

!NetCDF(lon, lat) byte
type :: nc2d_byte
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=byte) :: f_value
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:), allocatable ::  ncdata
end type nc2d_byte


!NetCDF(lon, lat) short
type :: nc2d_short
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=short) :: f_value
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:), allocatable ::  ncdata
end type nc2d_short


!NetCDF(lon, lat) int
type :: nc2d_int
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=intgr) :: f_value
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:), allocatable ::  ncdata
end type nc2d_int


!NetCDF(lon, lat) float
type :: nc2d_float
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=float) :: f_value
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:), allocatable ::  ncdata
end type nc2d_float


!NetCDF(lon, lat) double
type :: nc2d_double
  sequence
  character(len=20) :: varname, lonname, latname, varunits, long_name, &
                       lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=double) :: f_value
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:), allocatable ::  ncdata
end type nc2d_double

!Zonal Statistics
!NetCDF(lon, lat) byte
type :: zonal_byte
  sequence
  integer(kind=intgr), dimension(:), allocatable :: zclass
  integer(kind=8), dimension(:), allocatable :: zcount
  real(kind=double), dimension(:), allocatable :: zsum
  real(kind=double), dimension(:), allocatable :: zaverage
  integer(kind=byte), dimension(:), allocatable :: zmin
  integer(kind=byte), dimension(:), allocatable :: zmax
  real(kind=double), dimension(:), allocatable :: zstdeviation
  real(kind=double), dimension(:), allocatable :: zvariance
end type zonal_byte


!NetCDF(lon, lat) short
type :: zonal_short
  sequence
  integer(kind=intgr), dimension(:), allocatable :: zclass
  integer(kind=8), dimension(:), allocatable :: zcount
  real(kind=double), dimension(:), allocatable :: zsum
  real(kind=double), dimension(:), allocatable :: zaverage
  integer(kind=short), dimension(:), allocatable :: zmin
  integer(kind=short), dimension(:), allocatable :: zmax
  real(kind=double), dimension(:), allocatable :: zstdeviation
  real(kind=double), dimension(:), allocatable :: zvariance
end type zonal_short


!NetCDF(lon, lat) int
type :: zonal_int
  sequence
  integer(kind=intgr), dimension(:), allocatable :: zclass
  integer(kind=8), dimension(:), allocatable :: zcount
  real(kind=double), dimension(:), allocatable :: zsum
  real(kind=double), dimension(:), allocatable :: zaverage
  integer(kind=intgr), dimension(:), allocatable :: zmin
  integer(kind=intgr), dimension(:), allocatable :: zmax
  real(kind=double), dimension(:), allocatable :: zstdeviation
  real(kind=double), dimension(:), allocatable :: zvariance
end type zonal_int


!NetCDF(lon, lat) float
type :: zonal_float
  sequence
  integer(kind=intgr), dimension(:), allocatable :: zclass
  integer(kind=8), dimension(:), allocatable :: zcount
  real(kind=double), dimension(:), allocatable :: zsum
  real(kind=double), dimension(:), allocatable :: zaverage
  real(kind=float), dimension(:), allocatable :: zmin
  real(kind=float), dimension(:), allocatable :: zmax
  real(kind=double), dimension(:), allocatable :: zstdeviation
  real(kind=double), dimension(:), allocatable :: zvariance
end type zonal_float


!NetCDF(lon, lat) double
type :: zonal_double
  sequence
  integer(kind=intgr), dimension(:), allocatable :: zclass
  integer(kind=8), dimension(:), allocatable :: zcount
  real(kind=double), dimension(:), allocatable :: zsum
  real(kind=double), dimension(:), allocatable :: zaverage
  real(kind=double), dimension(:), allocatable :: zmin
  real(kind=double), dimension(:), allocatable :: zmax
  real(kind=double), dimension(:), allocatable :: zstdeviation
  real(kind=double), dimension(:), allocatable :: zvariance
end type zonal_double

