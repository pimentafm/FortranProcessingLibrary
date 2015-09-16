#!/bin/bash

echo "!:========================================================================
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
!:========================================================================"

declare -a arr=("byte" "short" "int" "float" "double")
declare -a arr2=("integer(kind=C_SIGNED_CHAR)" "integer(kind=C_SHORT)" "integer(kind=C_INT)" "real(kind=C_FLOAT)" "real(kind=C_DOUBLE)")

for i in {0..4}; do
  echo "
!:======= Read 2 dimensional NetCDF ${arr[$i]} ==========================
subroutine readgrid2d_${arr[$i]}(ifile, idata)
  character(*) :: ifile
  type(nc2d_${arr[$i]}) :: idata

  integer(kind=C_INT) :: ncid, varid, xvarid, yvarid, vartype

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call checkfile(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call checkatt(nf90_get_att(ncid, xvarid, "'"units"'", idata%lonunits),"'"degrees_east"'")

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call checkatt(nf90_get_att(ncid, yvarid, "'"units"'", idata%latunits), "'"degrees_north"'")

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid))
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'${arr[$i]^^}'"'")

  !Get some attributes
  call checkatt(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'")
  call checkatt(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%f_value), "'"_FillValue"'")
  call checkatt(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"variable units"'")

  call check(nf90_close(ncid))
end subroutine readgrid2d_${arr[$i]}
"
done
