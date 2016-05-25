#!/bin/bash

echo "!:=============================================================================
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
!:============================================================================="

declare -a arr=("byte" "short" "int" "float" "double")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

for i in {0..4}; do
  echo "
!:======= Read 2 dimensional NetCDF ${arr[$i]} ==========================
subroutine readgrid2d_${arr[$i]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_${arr[$i]}) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid, vartype

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "'"units"'", idata%lonunits),"'"lonunits"'", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "'"units"'", idata%latunits), "'"latunits"'", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'${arr[$i]^^}'"'", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_${arr[$i]}
"
done

for i in {0..4}; do
  echo "
!:======= Read 3 dimensional NetCDF ${arr[$i]} ==========================
subroutine readgrid3d_${arr[$i]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_${arr[$i]}) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid, vartype

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats, idata%ntimes))
  allocate(idata%times(idata%ntimes))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get time
  call check(nf90_inq_varid(ncid, idata%timename, tvarid))
  call check(nf90_get_var(ncid, tvarid, idata%times))
  call check(nf90_get_att(ncid, tvarid, "'"units"'", idata%timeunits),"'"timeunits"'", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "'"units"'", idata%lonunits),"'"lonunits"'", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "'"units"'", idata%latunits), "'"latunits"'", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'${arr[$i]^^}'"'", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_${arr[$i]}
"
done
