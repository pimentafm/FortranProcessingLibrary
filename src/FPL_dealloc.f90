!:=============================================================================
! This file is part of FPL (Fortran Processing Library).

! Copyright (C) 2015 Fernando Martins Pimenta

! FPL is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! FPL is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with FPL.  If not, see <http://www.gnu.org/licenses/>.

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
subroutine dealloc2d_byte_llf(idata)
  type(nc2d_byte_llf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_byte_llf

!NetCDF(lon, lat) short
subroutine dealloc2d_short_llf(idata)
  type(nc2d_short_llf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_short_llf

!NetCDF(lon, lat) int
subroutine dealloc2d_int_llf(idata)
  type(nc2d_int_llf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_int_llf

!NetCDF(lon, lat) float
subroutine dealloc2d_float_llf(idata)
  type(nc2d_float_llf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_float_llf

!NetCDF(lon, lat) double
subroutine dealloc2d_double_llf(idata)
  type(nc2d_double_llf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_double_llf

!NetCDF(lon, lat) byte
subroutine dealloc2d_byte_lld(idata)
  type(nc2d_byte_lld), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_byte_lld

!NetCDF(lon, lat) short
subroutine dealloc2d_short_lld(idata)
  type(nc2d_short_lld), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_short_lld

!NetCDF(lon, lat) int
subroutine dealloc2d_int_lld(idata)
  type(nc2d_int_lld), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_int_lld

!NetCDF(lon, lat) float
subroutine dealloc2d_float_lld(idata)
  type(nc2d_float_lld), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_float_lld

!NetCDF(lon, lat) double
subroutine dealloc2d_double_lld(idata)
  type(nc2d_double_lld), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc2d_double_lld

!NetCDF(lon, lat, time) byte
subroutine dealloc3d_byte_llf_ti(idata)
  type(nc3d_byte_llf_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_byte_llf_ti

!NetCDF(lon, lat, time) short
subroutine dealloc3d_short_llf_ti(idata)
  type(nc3d_short_llf_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_short_llf_ti

!NetCDF(lon, lat, time) int
subroutine dealloc3d_int_llf_ti(idata)
  type(nc3d_int_llf_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_int_llf_ti

!NetCDF(lon, lat, time) float
subroutine dealloc3d_float_llf_ti(idata)
  type(nc3d_float_llf_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_float_llf_ti

!NetCDF(lon, lat, time) double
subroutine dealloc3d_double_llf_ti(idata)
  type(nc3d_double_llf_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_double_llf_ti

!NetCDF(lon, lat, time) byte
subroutine dealloc3d_byte_lld_ti(idata)
  type(nc3d_byte_lld_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_byte_lld_ti

!NetCDF(lon, lat, time) short
subroutine dealloc3d_short_lld_ti(idata)
  type(nc3d_short_lld_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_short_lld_ti

!NetCDF(lon, lat, time) int
subroutine dealloc3d_int_lld_ti(idata)
  type(nc3d_int_lld_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_int_lld_ti

!NetCDF(lon, lat, time) float
subroutine dealloc3d_float_lld_ti(idata)
  type(nc3d_float_lld_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_float_lld_ti

!NetCDF(lon, lat, time) double
subroutine dealloc3d_double_lld_ti(idata)
  type(nc3d_double_lld_ti), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_double_lld_ti

!NetCDF(lon, lat, time) byte
subroutine dealloc3d_byte_llf_tf(idata)
  type(nc3d_byte_llf_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_byte_llf_tf

!NetCDF(lon, lat, time) short
subroutine dealloc3d_short_llf_tf(idata)
  type(nc3d_short_llf_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_short_llf_tf

!NetCDF(lon, lat, time) int
subroutine dealloc3d_int_llf_tf(idata)
  type(nc3d_int_llf_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_int_llf_tf

!NetCDF(lon, lat, time) float
subroutine dealloc3d_float_llf_tf(idata)
  type(nc3d_float_llf_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_float_llf_tf

!NetCDF(lon, lat, time) double
subroutine dealloc3d_double_llf_tf(idata)
  type(nc3d_double_llf_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_double_llf_tf

!NetCDF(lon, lat, time) byte
subroutine dealloc3d_byte_lld_tf(idata)
  type(nc3d_byte_lld_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_byte_lld_tf

!NetCDF(lon, lat, time) short
subroutine dealloc3d_short_lld_tf(idata)
  type(nc3d_short_lld_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_short_lld_tf

!NetCDF(lon, lat, time) int
subroutine dealloc3d_int_lld_tf(idata)
  type(nc3d_int_lld_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_int_lld_tf

!NetCDF(lon, lat, time) float
subroutine dealloc3d_float_lld_tf(idata)
  type(nc3d_float_lld_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_float_lld_tf

!NetCDF(lon, lat, time) double
subroutine dealloc3d_double_lld_tf(idata)
  type(nc3d_double_lld_tf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_double_lld_tf

!NetCDF(lon, lat, time) byte
subroutine dealloc3d_byte_llf_td(idata)
  type(nc3d_byte_llf_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_byte_llf_td

!NetCDF(lon, lat, time) short
subroutine dealloc3d_short_llf_td(idata)
  type(nc3d_short_llf_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_short_llf_td

!NetCDF(lon, lat, time) int
subroutine dealloc3d_int_llf_td(idata)
  type(nc3d_int_llf_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_int_llf_td

!NetCDF(lon, lat, time) float
subroutine dealloc3d_float_llf_td(idata)
  type(nc3d_float_llf_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_float_llf_td

!NetCDF(lon, lat, time) double
subroutine dealloc3d_double_llf_td(idata)
  type(nc3d_double_llf_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_double_llf_td

!NetCDF(lon, lat, time) byte
subroutine dealloc3d_byte_lld_td(idata)
  type(nc3d_byte_lld_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_byte_lld_td

!NetCDF(lon, lat, time) short
subroutine dealloc3d_short_lld_td(idata)
  type(nc3d_short_lld_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_short_lld_td

!NetCDF(lon, lat, time) int
subroutine dealloc3d_int_lld_td(idata)
  type(nc3d_int_lld_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_int_lld_td

!NetCDF(lon, lat, time) float
subroutine dealloc3d_float_lld_td(idata)
  type(nc3d_float_lld_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_float_lld_td

!NetCDF(lon, lat, time) double
subroutine dealloc3d_double_lld_td(idata)
  type(nc3d_double_lld_td), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc3d_double_lld_td

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_llf_ti_li(idata)
  type(nc4d_byte_llf_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_llf_ti_li

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_llf_ti_li(idata)
  type(nc4d_short_llf_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_llf_ti_li

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_llf_ti_li(idata)
  type(nc4d_int_llf_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_llf_ti_li

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_llf_ti_li(idata)
  type(nc4d_float_llf_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_llf_ti_li

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_llf_ti_li(idata)
  type(nc4d_double_llf_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_llf_ti_li

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_lld_ti_li(idata)
  type(nc4d_byte_lld_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_lld_ti_li

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_lld_ti_li(idata)
  type(nc4d_short_lld_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_lld_ti_li

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_lld_ti_li(idata)
  type(nc4d_int_lld_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_lld_ti_li

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_lld_ti_li(idata)
  type(nc4d_float_lld_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_lld_ti_li

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_lld_ti_li(idata)
  type(nc4d_double_lld_ti_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_lld_ti_li

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_llf_tf_li(idata)
  type(nc4d_byte_llf_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_llf_tf_li

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_llf_tf_li(idata)
  type(nc4d_short_llf_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_llf_tf_li

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_llf_tf_li(idata)
  type(nc4d_int_llf_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_llf_tf_li

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_llf_tf_li(idata)
  type(nc4d_float_llf_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_llf_tf_li

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_llf_tf_li(idata)
  type(nc4d_double_llf_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_llf_tf_li

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_lld_tf_li(idata)
  type(nc4d_byte_lld_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_lld_tf_li

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_lld_tf_li(idata)
  type(nc4d_short_lld_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_lld_tf_li

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_lld_tf_li(idata)
  type(nc4d_int_lld_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_lld_tf_li

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_lld_tf_li(idata)
  type(nc4d_float_lld_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_lld_tf_li

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_lld_tf_li(idata)
  type(nc4d_double_lld_tf_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_lld_tf_li

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_llf_td_li(idata)
  type(nc4d_byte_llf_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_llf_td_li

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_llf_td_li(idata)
  type(nc4d_short_llf_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_llf_td_li

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_llf_td_li(idata)
  type(nc4d_int_llf_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_llf_td_li

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_llf_td_li(idata)
  type(nc4d_float_llf_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_llf_td_li

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_llf_td_li(idata)
  type(nc4d_double_llf_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_llf_td_li

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_lld_td_li(idata)
  type(nc4d_byte_lld_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_lld_td_li

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_lld_td_li(idata)
  type(nc4d_short_lld_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_lld_td_li

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_lld_td_li(idata)
  type(nc4d_int_lld_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_lld_td_li

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_lld_td_li(idata)
  type(nc4d_float_lld_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_lld_td_li

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_lld_td_li(idata)
  type(nc4d_double_lld_td_li), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_lld_td_li

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_llf_ti_lf(idata)
  type(nc4d_byte_llf_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_llf_ti_lf

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_llf_ti_lf(idata)
  type(nc4d_short_llf_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_llf_ti_lf

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_llf_ti_lf(idata)
  type(nc4d_int_llf_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_llf_ti_lf

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_llf_ti_lf(idata)
  type(nc4d_float_llf_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_llf_ti_lf

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_llf_ti_lf(idata)
  type(nc4d_double_llf_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_llf_ti_lf

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_lld_ti_lf(idata)
  type(nc4d_byte_lld_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_lld_ti_lf

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_lld_ti_lf(idata)
  type(nc4d_short_lld_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_lld_ti_lf

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_lld_ti_lf(idata)
  type(nc4d_int_lld_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_lld_ti_lf

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_lld_ti_lf(idata)
  type(nc4d_float_lld_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_lld_ti_lf

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_lld_ti_lf(idata)
  type(nc4d_double_lld_ti_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_lld_ti_lf

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_llf_tf_lf(idata)
  type(nc4d_byte_llf_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_llf_tf_lf

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_llf_tf_lf(idata)
  type(nc4d_short_llf_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_llf_tf_lf

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_llf_tf_lf(idata)
  type(nc4d_int_llf_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_llf_tf_lf

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_llf_tf_lf(idata)
  type(nc4d_float_llf_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_llf_tf_lf

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_llf_tf_lf(idata)
  type(nc4d_double_llf_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_llf_tf_lf

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_lld_tf_lf(idata)
  type(nc4d_byte_lld_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_lld_tf_lf

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_lld_tf_lf(idata)
  type(nc4d_short_lld_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_lld_tf_lf

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_lld_tf_lf(idata)
  type(nc4d_int_lld_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_lld_tf_lf

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_lld_tf_lf(idata)
  type(nc4d_float_lld_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_lld_tf_lf

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_lld_tf_lf(idata)
  type(nc4d_double_lld_tf_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_lld_tf_lf

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_llf_td_lf(idata)
  type(nc4d_byte_llf_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_llf_td_lf

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_llf_td_lf(idata)
  type(nc4d_short_llf_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_llf_td_lf

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_llf_td_lf(idata)
  type(nc4d_int_llf_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_llf_td_lf

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_llf_td_lf(idata)
  type(nc4d_float_llf_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_llf_td_lf

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_llf_td_lf(idata)
  type(nc4d_double_llf_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_llf_td_lf

!NetCDF(lon, lat, time, level) byte
subroutine dealloc4d_byte_lld_td_lf(idata)
  type(nc4d_byte_lld_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_byte_lld_td_lf

!NetCDF(lon, lat, time, level) short
subroutine dealloc4d_short_lld_td_lf(idata)
  type(nc4d_short_lld_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_short_lld_td_lf

!NetCDF(lon, lat, time, level) int
subroutine dealloc4d_int_lld_td_lf(idata)
  type(nc4d_int_lld_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_int_lld_td_lf

!NetCDF(lon, lat, time, level) float
subroutine dealloc4d_float_lld_td_lf(idata)
  type(nc4d_float_lld_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_float_lld_td_lf

!NetCDF(lon, lat, time, level) double
subroutine dealloc4d_double_lld_td_lf(idata)
  type(nc4d_double_lld_td_lf), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%times, idata%levels, idata%ncdata, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine dealloc4d_double_lld_td_lf
