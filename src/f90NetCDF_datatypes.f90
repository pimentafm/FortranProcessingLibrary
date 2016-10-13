!:=============================================================================
! This file is part of f90NetCDF (Fortran 90 API for NetCDF).

! Copyright (C) 2015 Fernando Martins Pimenta

! f90NetCDF is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! f90NetCDF is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with f90NetCDF.  If not, see <http://www.gnu.org/licenses/>.

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

!NetCDF(lon, lat) byte

type :: nc2d_byte_llf
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:), allocatable :: ncdata
end type nc2d_byte_llf

!NetCDF(lon, lat) short

type :: nc2d_short_llf
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:), allocatable :: ncdata
end type nc2d_short_llf

!NetCDF(lon, lat) int

type :: nc2d_int_llf
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:), allocatable :: ncdata
end type nc2d_int_llf

!NetCDF(lon, lat) float

type :: nc2d_float_llf
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:), allocatable :: ncdata
end type nc2d_float_llf

!NetCDF(lon, lat) double

type :: nc2d_double_llf
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:), allocatable :: ncdata
end type nc2d_double_llf

!NetCDF(lon, lat) byte

type :: nc2d_byte_lld
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=byte) :: FillValue
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:), allocatable :: ncdata
end type nc2d_byte_lld

!NetCDF(lon, lat) short

type :: nc2d_short_lld
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=short) :: FillValue
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:), allocatable :: ncdata
end type nc2d_short_lld

!NetCDF(lon, lat) int

type :: nc2d_int_lld
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  integer(kind=intgr) :: FillValue
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:), allocatable :: ncdata
end type nc2d_int_lld

!NetCDF(lon, lat) float

type :: nc2d_float_lld
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=float) :: FillValue
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:), allocatable :: ncdata
end type nc2d_float_lld

!NetCDF(lon, lat) double

type :: nc2d_double_lld
  sequence
  character(len=100) :: varname, lonname, latname, long_name, varunits, &
                        lonunits, latunits
  integer(kind=intgr) :: nlons, nlats, vartype
  real(kind=double) :: FillValue
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:), allocatable :: ncdata
end type nc2d_double_lld

!NetCDF(lon, lat, time) byte
type :: nc3d_byte_llf_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:), allocatable :: ncdata
end type nc3d_byte_llf_ti

!NetCDF(lon, lat, time) short
type :: nc3d_short_llf_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:), allocatable :: ncdata
end type nc3d_short_llf_ti

!NetCDF(lon, lat, time) int
type :: nc3d_int_llf_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:), allocatable :: ncdata
end type nc3d_int_llf_ti

!NetCDF(lon, lat, time) float
type :: nc3d_float_llf_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:), allocatable :: ncdata
end type nc3d_float_llf_ti

!NetCDF(lon, lat, time) double
type :: nc3d_double_llf_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:), allocatable :: ncdata
end type nc3d_double_llf_ti

!NetCDF(lon, lat, time) byte
type :: nc3d_byte_lld_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:), allocatable :: ncdata
end type nc3d_byte_lld_ti

!NetCDF(lon, lat, time) short
type :: nc3d_short_lld_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:), allocatable :: ncdata
end type nc3d_short_lld_ti

!NetCDF(lon, lat, time) int
type :: nc3d_int_lld_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:), allocatable :: ncdata
end type nc3d_int_lld_ti

!NetCDF(lon, lat, time) float
type :: nc3d_float_lld_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:), allocatable :: ncdata
end type nc3d_float_lld_ti

!NetCDF(lon, lat, time) double
type :: nc3d_double_lld_ti

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:), allocatable :: ncdata
end type nc3d_double_lld_ti

!NetCDF(lon, lat, time) byte
type :: nc3d_byte_llf_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:), allocatable :: ncdata
end type nc3d_byte_llf_tf

!NetCDF(lon, lat, time) short
type :: nc3d_short_llf_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:), allocatable :: ncdata
end type nc3d_short_llf_tf

!NetCDF(lon, lat, time) int
type :: nc3d_int_llf_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:), allocatable :: ncdata
end type nc3d_int_llf_tf

!NetCDF(lon, lat, time) float
type :: nc3d_float_llf_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:), allocatable :: ncdata
end type nc3d_float_llf_tf

!NetCDF(lon, lat, time) double
type :: nc3d_double_llf_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:), allocatable :: ncdata
end type nc3d_double_llf_tf

!NetCDF(lon, lat, time) byte
type :: nc3d_byte_lld_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:), allocatable :: ncdata
end type nc3d_byte_lld_tf

!NetCDF(lon, lat, time) short
type :: nc3d_short_lld_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:), allocatable :: ncdata
end type nc3d_short_lld_tf

!NetCDF(lon, lat, time) int
type :: nc3d_int_lld_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:), allocatable :: ncdata
end type nc3d_int_lld_tf

!NetCDF(lon, lat, time) float
type :: nc3d_float_lld_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:), allocatable :: ncdata
end type nc3d_float_lld_tf

!NetCDF(lon, lat, time) double
type :: nc3d_double_lld_tf

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:), allocatable :: ncdata
end type nc3d_double_lld_tf

!NetCDF(lon, lat, time) byte
type :: nc3d_byte_llf_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=byte) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:), allocatable :: ncdata
end type nc3d_byte_llf_td

!NetCDF(lon, lat, time) short
type :: nc3d_short_llf_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=short) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:), allocatable :: ncdata
end type nc3d_short_llf_td

!NetCDF(lon, lat, time) int
type :: nc3d_int_llf_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=intgr) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:), allocatable :: ncdata
end type nc3d_int_llf_td

!NetCDF(lon, lat, time) float
type :: nc3d_float_llf_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=float) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:), allocatable :: ncdata
end type nc3d_float_llf_td

!NetCDF(lon, lat, time) double
type :: nc3d_double_llf_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=double) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:), allocatable :: ncdata
end type nc3d_double_llf_td

!NetCDF(lon, lat, time) byte
type :: nc3d_byte_lld_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=byte) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:), allocatable :: ncdata
end type nc3d_byte_lld_td

!NetCDF(lon, lat, time) short
type :: nc3d_short_lld_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=short) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:), allocatable :: ncdata
end type nc3d_short_lld_td

!NetCDF(lon, lat, time) int
type :: nc3d_int_lld_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  integer(kind=intgr) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:), allocatable :: ncdata
end type nc3d_int_lld_td

!NetCDF(lon, lat, time) float
type :: nc3d_float_lld_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=float) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:), allocatable :: ncdata
end type nc3d_float_lld_td

!NetCDF(lon, lat, time) double
type :: nc3d_double_lld_td

  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  integer(kind=intgr) :: nlons, nlats, ntimes, vartype
  real(kind=double) :: FillValue
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:), allocatable :: ncdata
end type nc3d_double_lld_td

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_llf_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_llf_ti_li

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_llf_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_llf_ti_li

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_llf_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_llf_ti_li

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_llf_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_llf_ti_li

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_llf_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_llf_ti_li

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_lld_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_lld_ti_li

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_lld_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_lld_ti_li

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_lld_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_lld_ti_li

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_lld_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_lld_ti_li

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_lld_ti_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_lld_ti_li

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_llf_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_llf_tf_li

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_llf_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_llf_tf_li

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_llf_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_llf_tf_li

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_llf_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_llf_tf_li

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_llf_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_llf_tf_li

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_lld_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_lld_tf_li

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_lld_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_lld_tf_li

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_lld_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_lld_tf_li

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_lld_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_lld_tf_li

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_lld_tf_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_lld_tf_li

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_llf_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_llf_td_li

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_llf_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_llf_td_li

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_llf_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_llf_td_li

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_llf_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_llf_td_li

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_llf_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_llf_td_li

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_lld_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_lld_td_li

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_lld_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_lld_td_li

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_lld_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_lld_td_li

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_lld_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_lld_td_li

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_lld_td_li

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  integer(kind=intgr), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_lld_td_li

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_llf_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_llf_ti_lf

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_llf_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_llf_ti_lf

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_llf_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_llf_ti_lf

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_llf_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_llf_ti_lf

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_llf_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_llf_ti_lf

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_lld_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_lld_ti_lf

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_lld_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_lld_ti_lf

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_lld_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_lld_ti_lf

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_lld_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_lld_ti_lf

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_lld_ti_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  integer(kind=intgr), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_lld_ti_lf

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_llf_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_llf_tf_lf

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_llf_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_llf_tf_lf

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_llf_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_llf_tf_lf

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_llf_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_llf_tf_lf

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_llf_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_llf_tf_lf

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_lld_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_lld_tf_lf

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_lld_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_lld_tf_lf

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_lld_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_lld_tf_lf

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_lld_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_lld_tf_lf

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_lld_tf_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=float), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_lld_tf_lf

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_llf_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_llf_td_lf

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_llf_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_llf_td_lf

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_llf_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_llf_td_lf

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_llf_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_llf_td_lf

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_llf_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=float), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_llf_td_lf

!NetCDF(lon, lat, time, level) byte
type :: nc4d_byte_lld_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=byte) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=byte), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_byte_lld_td_lf

!NetCDF(lon, lat, time, level) short
type :: nc4d_short_lld_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=short) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=short), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_short_lld_td_lf

!NetCDF(lon, lat, time, level) int
type :: nc4d_int_lld_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  integer(kind=intgr) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  integer(kind=intgr), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_int_lld_td_lf

!NetCDF(lon, lat, time, level) float
type :: nc4d_float_lld_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=float) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=float), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_float_lld_td_lf

!NetCDF(lon, lat, time, level) double
type :: nc4d_double_lld_td_lf

  sequence
  character(len=100) :: varname, timename, levelname, lonname, latname, &
                        long_name, varunits, lonunits, latunits, &
                        timeunits, levelunits
  integer(kind=intgr) :: nlons, nlats, ntimes, nlevels, vartype
  real(kind=double) :: FillValue
  real(kind=float), dimension(:), allocatable :: levels
  real(kind=double), dimension(:), allocatable :: times
  real(kind=double), dimension(:), allocatable :: longitudes, latitudes
  real(kind=double), dimension(:,:,:,:), allocatable :: ncdata
end type nc4d_double_lld_td_lf
