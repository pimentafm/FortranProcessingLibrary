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

!NetCDF <var byte> (lon <float>, lat <float>)
subroutine readgrid2d_byte_llf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_byte_llf) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_byte_llf



!NetCDF <var short> (lon <float>, lat <float>)
subroutine readgrid2d_short_llf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_short_llf) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_short_llf



!NetCDF <var int> (lon <float>, lat <float>)
subroutine readgrid2d_int_llf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_int_llf) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_int_llf



!NetCDF <var float> (lon <float>, lat <float>)
subroutine readgrid2d_float_llf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_float_llf) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_float_llf



!NetCDF <var double> (lon <float>, lat <float>)
subroutine readgrid2d_double_llf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_double_llf) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_double_llf



!NetCDF <var byte> (lon <double>, lat <double>)
subroutine readgrid2d_byte_lld(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_byte_lld) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_byte_lld



!NetCDF <var short> (lon <double>, lat <double>)
subroutine readgrid2d_short_lld(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_short_lld) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_short_lld



!NetCDF <var int> (lon <double>, lat <double>)
subroutine readgrid2d_int_lld(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_int_lld) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_int_lld



!NetCDF <var float> (lon <double>, lat <double>)
subroutine readgrid2d_float_lld(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_float_lld) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_float_lld



!NetCDF <var double> (lon <double>, lat <double>)
subroutine readgrid2d_double_lld(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_double_lld) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call ncoords(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_double_lld



!NetCDF <var byte> (lon <float>, lat <float>, time <int>)
subroutine readgrid3d_byte_llf_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_byte_llf_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_byte_llf_ti



!NetCDF <var short> (lon <float>, lat <float>, time <int>)
subroutine readgrid3d_short_llf_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_short_llf_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_short_llf_ti



!NetCDF <var int> (lon <float>, lat <float>, time <int>)
subroutine readgrid3d_int_llf_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_int_llf_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_int_llf_ti



!NetCDF <var float> (lon <float>, lat <float>, time <int>)
subroutine readgrid3d_float_llf_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_float_llf_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_float_llf_ti



!NetCDF <var double> (lon <float>, lat <float>, time <int>)
subroutine readgrid3d_double_llf_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_double_llf_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_double_llf_ti



!NetCDF <var byte> (lon <double>, lat <double>, time <int>)
subroutine readgrid3d_byte_lld_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_byte_lld_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_byte_lld_ti



!NetCDF <var short> (lon <double>, lat <double>, time <int>)
subroutine readgrid3d_short_lld_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_short_lld_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_short_lld_ti



!NetCDF <var int> (lon <double>, lat <double>, time <int>)
subroutine readgrid3d_int_lld_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_int_lld_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_int_lld_ti



!NetCDF <var float> (lon <double>, lat <double>, time <int>)
subroutine readgrid3d_float_lld_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_float_lld_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_float_lld_ti



!NetCDF <var double> (lon <double>, lat <double>, time <int>)
subroutine readgrid3d_double_lld_ti(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_double_lld_ti) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_double_lld_ti



!NetCDF <var byte> (lon <float>, lat <float>, time <float>)
subroutine readgrid3d_byte_llf_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_byte_llf_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_byte_llf_tf



!NetCDF <var short> (lon <float>, lat <float>, time <float>)
subroutine readgrid3d_short_llf_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_short_llf_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_short_llf_tf



!NetCDF <var int> (lon <float>, lat <float>, time <float>)
subroutine readgrid3d_int_llf_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_int_llf_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_int_llf_tf



!NetCDF <var float> (lon <float>, lat <float>, time <float>)
subroutine readgrid3d_float_llf_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_float_llf_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_float_llf_tf



!NetCDF <var double> (lon <float>, lat <float>, time <float>)
subroutine readgrid3d_double_llf_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_double_llf_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_double_llf_tf



!NetCDF <var byte> (lon <double>, lat <double>, time <float>)
subroutine readgrid3d_byte_lld_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_byte_lld_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_byte_lld_tf



!NetCDF <var short> (lon <double>, lat <double>, time <float>)
subroutine readgrid3d_short_lld_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_short_lld_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_short_lld_tf



!NetCDF <var int> (lon <double>, lat <double>, time <float>)
subroutine readgrid3d_int_lld_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_int_lld_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_int_lld_tf



!NetCDF <var float> (lon <double>, lat <double>, time <float>)
subroutine readgrid3d_float_lld_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_float_lld_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_float_lld_tf



!NetCDF <var double> (lon <double>, lat <double>, time <float>)
subroutine readgrid3d_double_lld_tf(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_double_lld_tf) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_double_lld_tf



!NetCDF <var byte> (lon <float>, lat <float>, time <double>)
subroutine readgrid3d_byte_llf_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_byte_llf_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_byte_llf_td



!NetCDF <var short> (lon <float>, lat <float>, time <double>)
subroutine readgrid3d_short_llf_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_short_llf_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_short_llf_td



!NetCDF <var int> (lon <float>, lat <float>, time <double>)
subroutine readgrid3d_int_llf_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_int_llf_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_int_llf_td



!NetCDF <var float> (lon <float>, lat <float>, time <double>)
subroutine readgrid3d_float_llf_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_float_llf_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_float_llf_td



!NetCDF <var double> (lon <float>, lat <float>, time <double>)
subroutine readgrid3d_double_llf_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_double_llf_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_double_llf_td



!NetCDF <var byte> (lon <double>, lat <double>, time <double>)
subroutine readgrid3d_byte_lld_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_byte_lld_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"BYTE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_byte_lld_td



!NetCDF <var short> (lon <double>, lat <double>, time <double>)
subroutine readgrid3d_short_lld_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_short_lld_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"SHORT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_short_lld_td



!NetCDF <var int> (lon <double>, lat <double>, time <double>)
subroutine readgrid3d_int_lld_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_int_lld_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"INT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_int_lld_td



!NetCDF <var float> (lon <double>, lat <double>, time <double>)
subroutine readgrid3d_float_lld_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_float_lld_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"FLOAT", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_float_lld_td



!NetCDF <var double> (lon <double>, lat <double>, time <double>)
subroutine readgrid3d_double_lld_td(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_double_lld_td) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

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
  call check(nf90_get_att(ncid, tvarid, "units", idata%timeunits),"timeunits", ifile)

  !Get Lons, Lats and variable values
  call check(nf90_inq_varid(ncid, idata%lonname, xvarid))
  call check(nf90_get_var(ncid, xvarid, idata%longitudes))
  call check(nf90_get_att(ncid, xvarid, "units", idata%lonunits),"lonunits", ifile)

  call check(nf90_inq_varid(ncid, idata%latname, yvarid))
  call check(nf90_get_var(ncid, yvarid, idata%latitudes))
  call check(nf90_get_att(ncid, yvarid, "units", idata%latunits), "latunits", ifile)

  !Get Variable name
  call check(nf90_inq_varid(ncid, idata%varname, varid), idata%varname, ifile)
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"DOUBLE", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
  call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
  call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_double_lld_td


