#!/bin/bash

echo "!:=============================================================================
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
!:============================================================================="

# Suffixes for naming the type of the dimensions of file structures. 
# arrid -> prefixes for
#          b - byte
#          s - short
#          i - integer
#          f - float
#          d - double

# Suffixes for naming the type of the variable of file structures. 
# arr   -> byte   - byte
#          short  - short
#          int    - integer
#          float  - float
#          double - double

# Kind of the dataset and FIllValue
# arr2  -> integer(kind=byte)  - byte
#          integer(kind=short) - short
#          integer(kind=intgr) - integer
#          real(kind=float)    - float
#          real(kind=double)   - double

declare -a arrid=("b" "s" "i" "f" "d")
declare -a arr=("byte" "short" "int" "float" "double")
declare -a arr2=("integer(kind=byte)" "integer(kind=short)" "integer(kind=intgr)" "real(kind=float)" "real(kind=double)")

# 2d datasets
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>)
subroutine readgrid2d_${arr[$i]}_ll${arrid[$j]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc2d_${arr[$i]}_ll${arrid[$j]}) :: idata

  integer(kind=intgr) :: ncid, varid, xvarid, yvarid

  call griddims(ifile, idata)

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
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'$(tr [a-z] [A-Z] <<< ${arr[$i]})'"'", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid2d_${arr[$i]}_ll${arrid[$j]}"
done
done

# 3d datasets
for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}>)
subroutine readgrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}) :: idata

  integer(kind=intgr) :: ncid, varid, tvarid, xvarid, yvarid

  call griddims(ifile, idata)

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
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'$(tr [a-z] [A-Z] <<< ${arr[$i]})'"'", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid3d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}"
done
done
done

# 4d datasets
for l in {2..3}; do # level
for k in {2..4}; do # time
for j in {3..4}; do # lon, lat
for i in {0..4}; do
  echo "
!NetCDF <var ${arr[$i]}> (lon <${arr[$j]}>, lat <${arr[$j]}>, time <${arr[$k]}, level <${arr[$l]}>)
subroutine readgrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}(ifile, idata)
  character(*), intent(in) :: ifile
  type(nc4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}) :: idata

  integer(kind=intgr) :: ncid, varid, lvarid, tvarid, xvarid, yvarid

  call griddims(ifile, idata)

  allocate(idata%ncdata(idata%nlons, idata%nlats, idata%ntimes, idata%nlevels))
  allocate(idata%levels(idata%nlevels))
  allocate(idata%times(idata%ntimes))
  allocate(idata%longitudes(idata%nlons))
  allocate(idata%latitudes(idata%nlats))

  !Open NetCDF
  call check(nf90_open(ifile, nf90_nowrite, ncid))

  !Get level
  call check(nf90_inq_varid(ncid, idata%levelname, lvarid))
  call check(nf90_get_var(ncid, lvarid, idata%levels))
  call check(nf90_get_att(ncid, lvarid, "'"units"'", idata%levelunits),"'"levelunits"'", ifile)
  
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
  call check(nf90_get_var(ncid, varid, idata%ncdata), idata%vartype,"'"'$(tr [a-z] [A-Z] <<< ${arr[$i]})'"'", ifile)

  !Get some attributes
  call check(nf90_get_att(ncid, varid, "'"long_name"'", idata%long_name), "'"long_name"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"_FillValue"'", idata%FillValue), "'"_FillValue"'", ifile)
  call check(nf90_get_att(ncid, varid, "'"units"'", idata%varunits),"'"varunits"'", ifile)

  call check(nf90_close(ncid))
end subroutine readgrid4d_${arr[$i]}_ll${arrid[$j]}_t${arrid[$k]}_l${arrid[$l]}"
done
done
done
done

