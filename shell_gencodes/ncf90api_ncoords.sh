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

declare -a arrid=("b" "s" "i" "f" "d")
declare -a arr=("byte" "short" "int" "float" "double")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

for j in {3..4}; do # lon, lat 
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>)
subroutine ncoords2d_${arr[$i]}_ll${arrid[$j]}(ifile, idata)
  type (nc2d_${arr[$i]}_ll${arrid[$j]}) :: idata
  integer(kind=intgr) :: ncid, xdimid, ydimid, varid
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

  idata%FillValue = nf90_fill_${arr[$i]}

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords2d_${arr[$i]}_ll${arrid[$j]}
"
done
done

for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>)
subroutine ncoords3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}(ifile, idata)
  type (nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}) :: idata 
  integer(kind=intgr) :: ncid, tdimid, xdimid, ydimid, varid
  character(*), intent(in) :: ifile

  !Open NetCDF File
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get Time Number
  call checkdimid(nf90_inq_dimid(ncid, idata%timename, tdimid), idata%timename)
  call check(nf90_inquire_dimension(ncid, tdimid, idata%timename, idata%ntimes))

  !Get Coordinate values and put them in nx, ny
  call checkdimid(nf90_inq_dimid(ncid, idata%lonname, xdimid), idata%lonname)
  call check(nf90_inquire_dimension(ncid, xdimid, idata%lonname, idata%nlons))

  call checkdimid(nf90_inq_dimid(ncid, idata%latname, ydimid), idata%latname)
  call check(nf90_inquire_dimension(ncid, ydimid, idata%latname, idata%nlats))

  !Inquire variable type
  call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
  call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype))

  idata%FillValue = nf90_fill_${arr[$i]}

  !Close NetCDF
  call check(nf90_close(ncid))
end subroutine ncoords3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}
"
done
done
done

