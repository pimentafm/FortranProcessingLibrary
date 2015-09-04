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

!:======= Read 2 dimensional NetCDF byte ==========================
subroutine readgrid2d_byte(ifile, idata)
  character(*) :: ifile
  type(nc2d_byte) :: idata

  integer(kind=C_INT) :: ncid, varid, xvarid, yvarid, vartype, nofill

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, lats and variable values
  call check(nf90_inq_varid(ncid,idata%lonname,xvarid))
  call check(nf90_get_var(ncid,xvarid,idata%longitudes))

  call check(nf90_inq_varid(ncid,idata%latname,yvarid))
  call check(nf90_get_var(ncid,yvarid,idata%latitudes))

  call check(nf90_inq_varid(ncid, idata%varname, varid))
  call check(nf90_get_var(ncid,varid,idata%ncdata))

  call check(nf90_close(ncid))
end subroutine readgrid2d_byte


!:======= Read 2 dimensional NetCDF short ==========================
subroutine readgrid2d_short(ifile, idata)
  character(*) :: ifile
  type(nc2d_short) :: idata

  integer(kind=C_INT) :: ncid, varid, xvarid, yvarid, vartype, nofill

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, lats and variable values
  call check(nf90_inq_varid(ncid,idata%lonname,xvarid))
  call check(nf90_get_var(ncid,xvarid,idata%longitudes))

  call check(nf90_inq_varid(ncid,idata%latname,yvarid))
  call check(nf90_get_var(ncid,yvarid,idata%latitudes))

  call check(nf90_inq_varid(ncid, idata%varname, varid))
  call check(nf90_get_var(ncid,varid,idata%ncdata))

  call check(nf90_close(ncid))
end subroutine readgrid2d_short


!:======= Read 2 dimensional NetCDF int ==========================
subroutine readgrid2d_int(ifile, idata)
  character(*) :: ifile
  type(nc2d_int) :: idata

  integer(kind=C_INT) :: ncid, varid, xvarid, yvarid, vartype, nofill

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, lats and variable values
  call check(nf90_inq_varid(ncid,idata%lonname,xvarid))
  call check(nf90_get_var(ncid,xvarid,idata%longitudes))

  call check(nf90_inq_varid(ncid,idata%latname,yvarid))
  call check(nf90_get_var(ncid,yvarid,idata%latitudes))

  call check(nf90_inq_varid(ncid, idata%varname, varid))
  call check(nf90_get_var(ncid,varid,idata%ncdata))

  call check(nf90_close(ncid))
end subroutine readgrid2d_int


!:======= Read 2 dimensional NetCDF float ==========================
subroutine readgrid2d_float(ifile, idata)
  character(*) :: ifile
  type(nc2d_float) :: idata

  integer(kind=C_INT) :: ncid, varid, xvarid, yvarid, vartype, nofill

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, lats and variable values
  call check(nf90_inq_varid(ncid,idata%lonname,xvarid))
  call check(nf90_get_var(ncid,xvarid,idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits))

  call check(nf90_inq_varid(ncid,idata%latname,yvarid))
  call check(nf90_get_var(ncid,yvarid,idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits))

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid))
  call check(nf90_get_var(ncid,varid,idata%ncdata))

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name))
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%f_value))
  call check(nf90_get_att(ncid, varid, "units", idata%varunits))

  call check(nf90_close(ncid))
end subroutine readgrid2d_float


!:======= Read 2 dimensional NetCDF double ==========================
subroutine readgrid2d_double(ifile, idata)
  character(*) :: ifile
  type(nc2d_double) :: idata

  integer(kind=C_INT) :: ncid, varid, xvarid, yvarid, vartype, nofill

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, lats and variable values
  call check(nf90_inq_varid(ncid,idata%lonname,xvarid))
  call check(nf90_get_var(ncid,xvarid,idata%longitudes))

  call check(nf90_inq_varid(ncid,idata%latname,yvarid))
  call check(nf90_get_var(ncid,yvarid,idata%latitudes))

  call check(nf90_inq_varid(ncid, idata%varname, varid))
  call check(nf90_get_var(ncid,varid,idata%ncdata))

  call check(nf90_close(ncid))
end subroutine readgrid2d_double
