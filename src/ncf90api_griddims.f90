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

!NetCDF(lon, lat) byte
subroutine ncoords2d_byte(ifile, idata)
  type (nc2d_byte) :: idata
  integer(kind=intgr) :: ncid, xdimid, ydimid, vdimid, varid
  character(*), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Coordinate values and put them in nx, ny
  call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  !Inquire variable type
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))

  idata%f_value = nf90_fill_byte

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords2d_byte


!NetCDF(lon, lat) short
subroutine ncoords2d_short(ifile, idata)
  type (nc2d_short) :: idata
  integer(kind=intgr) :: ncid, xdimid, ydimid, vdimid, varid
  character(*), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Coordinate values and put them in nx, ny
  call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  !Inquire variable type
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))

  idata%f_value = nf90_fill_short

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords2d_short


!NetCDF(lon, lat) int
subroutine ncoords2d_int(ifile, idata)
  type (nc2d_int) :: idata
  integer(kind=intgr) :: ncid, xdimid, ydimid, vdimid, varid
  character(*), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Coordinate values and put them in nx, ny
  call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  !Inquire variable type
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))

  idata%f_value = nf90_fill_int

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords2d_int


!NetCDF(lon, lat) float
subroutine ncoords2d_float(ifile, idata)
  type (nc2d_float) :: idata
  integer(kind=intgr) :: ncid, xdimid, ydimid, vdimid, varid
  character(*), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Coordinate values and put them in nx, ny
  call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  !Inquire variable type
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))

  idata%f_value = nf90_fill_float

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords2d_float


!NetCDF(lon, lat) double
subroutine ncoords2d_double(ifile, idata)
  type (nc2d_double) :: idata
  integer(kind=intgr) :: ncid, xdimid, ydimid, vdimid, varid
  character(*), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Coordinate values and put them in nx, ny
  call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  !Inquire variable type
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))

  idata%f_value = nf90_fill_double

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords2d_double
