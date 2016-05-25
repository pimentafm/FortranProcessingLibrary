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

!NetCDF(lon, lat)
interface check
  module procedure checkerror, checktype, checkatt
end interface check

interface ncoords
  module procedure ncoords2d_byte, ncoords2d_short, &
                   ncoords2d_int, ncoords2d_float, &
                   ncoords2d_double, ncoords3d_byte, &
                   ncoords3d_short, ncoords3d_int, &
                   ncoords3d_float, ncoords3d_double
end interface ncoords

interface readgrid
  module procedure readgrid2d_byte, readgrid2d_short, &
                   readgrid2d_int, readgrid2d_float, &
                   readgrid2d_double, readgrid3d_byte, &
                   readgrid3d_short, readgrid3d_int, &
                   readgrid3d_float, readgrid3d_double
end interface readgrid

interface writegrid
  module procedure writegrid2d_byte, writegrid2d_short, &
                   writegrid2d_int, writegrid2d_float, &
                   writegrid2d_double, writegrid3d_byte, &
                   writegrid3d_short, writegrid3d_int, &
                   writegrid3d_float, writegrid3d_double
end interface writegrid

interface setFillValue
  module procedure setFillValue2d_bb, setFillValue2d_bs, &
                   setFillValue2d_bi, setFillValue2d_bf, &
                   setFillValue2d_bd, setFillValue2d_sb, &
                   setFillValue2d_ss, setFillValue2d_si, &
                   setFillValue2d_sf, setFillValue2d_sd, &
                   setFillValue2d_ib, setFillValue2d_is, &
                   setFillValue2d_ii, setFillValue2d_if, &
                   setFillValue2d_id, setFillValue2d_fb, &
                   setFillValue2d_fs, setFillValue2d_fi, &
                   setFillValue2d_ff, setFillValue2d_fd, &
                   setFillValue2d_db, setFillValue2d_ds, &
                   setFillValue2d_di, setFillValue2d_df, &
                   setFillValue2d_dd, setFillValue3d_bb, &
                   setFillValue3d_bs, setFillValue3d_bi, &
                   setFillValue3d_bf, setFillValue3d_bd, &
                   setFillValue3d_sb, setFillValue3d_ss, &
                   setFillValue3d_si, setFillValue3d_sf, &
                   setFillValue3d_sd, setFillValue3d_ib, &
                   setFillValue3d_is, setFillValue3d_ii, &
                   setFillValue3d_if, setFillValue3d_id, &
                   setFillValue3d_fb, setFillValue3d_fs, &
                   setFillValue3d_fi, setFillValue3d_ff, &
                   setFillValue3d_fd, setFillValue3d_db, &
                   setFillValue3d_ds, setFillValue3d_di, &
                   setFillValue3d_df, setFillValue3d_dd
end interface setFillValue

interface zonalstats
  module procedure zonalstats_bb, zonalstats_bs, &
                   zonalstats_bi, zonalstats_bf, &
                   zonalstats_bd, zonalstats_sb, &
                   zonalstats_ss, zonalstats_si, &
                   zonalstats_sf, zonalstats_sd, &
                   zonalstats_ib, zonalstats_is, &
                   zonalstats_ii, zonalstats_if, &
                   zonalstats_id, zonalstats_fb, &
                   zonalstats_fs, zonalstats_fi, &
                   zonalstats_ff, zonalstats_fd, &
                   zonalstats_db, zonalstats_ds, &
                   zonalstats_di, zonalstats_df, &
                   zonalstats_dd
end interface zonalstats
