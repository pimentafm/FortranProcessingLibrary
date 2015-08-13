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

subroutine ncoords2d(ifile, idata)
  type (nc2d) :: idata
  integer*4 :: ncid, xdimid, ydimid
  character(100), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Coordinate values and put them in nx, ny
  call check(nf90_inq_dimid(ncid, idata%lonname, xdimid))
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call check(nf90_inq_dimid(ncid, idata%latname, ydimid))
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords2d

subroutine ncoords3d(ifile, idata)
  type(nc3d) :: idata
  integer*4 :: ncid, xdimid, ydimid, tdimid
  character(100), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Coordinate values and put them in nx, ny, nt
  call check(nf90_inq_dimid(ncid, idata%lonname, xdimid))
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call check(nf90_inq_dimid(ncid, idata%latname, ydimid))
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  call check(nf90_inq_dimid(ncid, idata%timename, tdimid))
  call check(nf90_inquire_dimension(ncid, tdimid, idata%timename, idata%ntimes))

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords3d
