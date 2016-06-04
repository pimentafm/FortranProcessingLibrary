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

interface check
  module procedure checkerror, checktype, checkatt
end interface check

interface ncoords
  module procedure ncoords2d_byte_llf, &
                ncoords2d_short_llf, &
                ncoords2d_int_llf, &
                ncoords2d_float_llf, &
                ncoords2d_double_llf, &
                ncoords2d_byte_lld, &
                ncoords2d_short_lld, &
                ncoords2d_int_lld, &
                ncoords2d_float_lld, &
                ncoords2d_double_lld, &
                ncoords3d_byte_llf_ti, &
                ncoords3d_short_llf_ti, &
                ncoords3d_int_llf_ti, &
                ncoords3d_float_llf_ti, &
                ncoords3d_double_llf_ti, &
                ncoords3d_byte_lld_ti, &
                ncoords3d_short_lld_ti, &
                ncoords3d_int_lld_ti, &
                ncoords3d_float_lld_ti, &
                ncoords3d_double_lld_ti, &
                ncoords3d_byte_llf_tf, &
                ncoords3d_short_llf_tf, &
                ncoords3d_int_llf_tf, &
                ncoords3d_float_llf_tf, &
                ncoords3d_double_llf_tf, &
                ncoords3d_byte_lld_tf, &
                ncoords3d_short_lld_tf, &
                ncoords3d_int_lld_tf, &
                ncoords3d_float_lld_tf, &
                ncoords3d_double_lld_tf, &
                ncoords3d_byte_llf_td, &
                ncoords3d_short_llf_td, &
                ncoords3d_int_llf_td, &
                ncoords3d_float_llf_td, &
                ncoords3d_double_llf_td, &
                ncoords3d_byte_lld_td, &
                ncoords3d_short_lld_td, &
                ncoords3d_int_lld_td, &
                ncoords3d_float_lld_td, &
                ncoords3d_double_lld_td
end interface ncoords

interface readgrid
  module procedure readgrid2d_byte_llf, &
                readgrid2d_short_llf, &
                readgrid2d_int_llf, &
                readgrid2d_float_llf, &
                readgrid2d_double_llf, &
                readgrid2d_byte_lld, &
                readgrid2d_short_lld, &
                readgrid2d_int_lld, &
                readgrid2d_float_lld, &
                readgrid2d_double_lld, &
                readgrid3d_byte_llf_ti, &
                readgrid3d_short_llf_ti, &
                readgrid3d_int_llf_ti, &
                readgrid3d_float_llf_ti, &
                readgrid3d_double_llf_ti, &
                readgrid3d_byte_lld_ti, &
                readgrid3d_short_lld_ti, &
                readgrid3d_int_lld_ti, &
                readgrid3d_float_lld_ti, &
                readgrid3d_double_lld_ti, &
                readgrid3d_byte_llf_tf, &
                readgrid3d_short_llf_tf, &
                readgrid3d_int_llf_tf, &
                readgrid3d_float_llf_tf, &
                readgrid3d_double_llf_tf, &
                readgrid3d_byte_lld_tf, &
                readgrid3d_short_lld_tf, &
                readgrid3d_int_lld_tf, &
                readgrid3d_float_lld_tf, &
                readgrid3d_double_lld_tf, &
                readgrid3d_byte_llf_td, &
                readgrid3d_short_llf_td, &
                readgrid3d_int_llf_td, &
                readgrid3d_float_llf_td, &
                readgrid3d_double_llf_td, &
                readgrid3d_byte_lld_td, &
                readgrid3d_short_lld_td, &
                readgrid3d_int_lld_td, &
                readgrid3d_float_lld_td, &
                readgrid3d_double_lld_td
end interface readgrid

interface writegrid
  module procedure writegrid2d_byte_llf, &
                writegrid2d_short_llf, &
                writegrid2d_int_llf, &
                writegrid2d_float_llf, &
                writegrid2d_double_llf, &
                writegrid2d_byte_lld, &
                writegrid2d_short_lld, &
                writegrid2d_int_lld, &
                writegrid2d_float_lld, &
                writegrid2d_double_lld, &
                writegrid3d_byte_llf_ti, &
                writegrid3d_short_llf_ti, &
                writegrid3d_int_llf_ti, &
                writegrid3d_float_llf_ti, &
                writegrid3d_double_llf_ti, &
                writegrid3d_byte_lld_ti, &
                writegrid3d_short_lld_ti, &
                writegrid3d_int_lld_ti, &
                writegrid3d_float_lld_ti, &
                writegrid3d_double_lld_ti, &
                writegrid3d_byte_llf_tf, &
                writegrid3d_short_llf_tf, &
                writegrid3d_int_llf_tf, &
                writegrid3d_float_llf_tf, &
                writegrid3d_double_llf_tf, &
                writegrid3d_byte_lld_tf, &
                writegrid3d_short_lld_tf, &
                writegrid3d_int_lld_tf, &
                writegrid3d_float_lld_tf, &
                writegrid3d_double_lld_tf, &
                writegrid3d_byte_llf_td, &
                writegrid3d_short_llf_td, &
                writegrid3d_int_llf_td, &
                writegrid3d_float_llf_td, &
                writegrid3d_double_llf_td, &
                writegrid3d_byte_lld_td, &
                writegrid3d_short_lld_td, &
                writegrid3d_int_lld_td, &
                writegrid3d_float_lld_td, &
                writegrid3d_double_lld_td
end interface writegrid

interface setFillValue
  module procedure setfvalue2d_bytebyte_llf, &
                setfvalue2d_byteshort_llf, &
                setfvalue2d_byteint_llf, &
                setfvalue2d_bytefloat_llf, &
                setfvalue2d_bytedouble_llf, &
                setfvalue2d_shortbyte_llf, &
                setfvalue2d_shortshort_llf, &
                setfvalue2d_shortint_llf, &
                setfvalue2d_shortfloat_llf, &
                setfvalue2d_shortdouble_llf, &
                setfvalue2d_intbyte_llf, &
                setfvalue2d_intshort_llf, &
                setfvalue2d_intint_llf, &
                setfvalue2d_intfloat_llf, &
                setfvalue2d_intdouble_llf, &
                setfvalue2d_floatbyte_llf, &
                setfvalue2d_floatshort_llf, &
                setfvalue2d_floatint_llf, &
                setfvalue2d_floatfloat_llf, &
                setfvalue2d_floatdouble_llf, &
                setfvalue2d_doublebyte_llf, &
                setfvalue2d_doubleshort_llf, &
                setfvalue2d_doubleint_llf, &
                setfvalue2d_doublefloat_llf, &
                setfvalue2d_doubledouble_llf, &
                setfvalue2d_bytebyte_lld, &
                setfvalue2d_byteshort_lld, &
                setfvalue2d_byteint_lld, &
                setfvalue2d_bytefloat_lld, &
                setfvalue2d_bytedouble_lld, &
                setfvalue2d_shortbyte_lld, &
                setfvalue2d_shortshort_lld, &
                setfvalue2d_shortint_lld, &
                setfvalue2d_shortfloat_lld, &
                setfvalue2d_shortdouble_lld, &
                setfvalue2d_intbyte_lld, &
                setfvalue2d_intshort_lld, &
                setfvalue2d_intint_lld, &
                setfvalue2d_intfloat_lld, &
                setfvalue2d_intdouble_lld, &
                setfvalue2d_floatbyte_lld, &
                setfvalue2d_floatshort_lld, &
                setfvalue2d_floatint_lld, &
                setfvalue2d_floatfloat_lld, &
                setfvalue2d_floatdouble_lld, &
                setfvalue2d_doublebyte_lld, &
                setfvalue2d_doubleshort_lld, &
                setfvalue2d_doubleint_lld, &
                setfvalue2d_doublefloat_lld, &
                setfvalue2d_doubledouble_lld, &
                setfvalue3d_bytebyte_llf_ti, &
                setfvalue3d_byteshort_llf_ti, &
                setfvalue3d_byteint_llf_ti, &
                setfvalue3d_bytefloat_llf_ti, &
                setfvalue3d_bytedouble_llf_ti, &
                setfvalue3d_shortbyte_llf_ti, &
                setfvalue3d_shortshort_llf_ti, &
                setfvalue3d_shortint_llf_ti, &
                setfvalue3d_shortfloat_llf_ti, &
                setfvalue3d_shortdouble_llf_ti, &
                setfvalue3d_intbyte_llf_ti, &
                setfvalue3d_intshort_llf_ti, &
                setfvalue3d_intint_llf_ti, &
                setfvalue3d_intfloat_llf_ti, &
                setfvalue3d_intdouble_llf_ti, &
                setfvalue3d_floatbyte_llf_ti, &
                setfvalue3d_floatshort_llf_ti, &
                setfvalue3d_floatint_llf_ti, &
                setfvalue3d_floatfloat_llf_ti, &
                setfvalue3d_floatdouble_llf_ti, &
                setfvalue3d_doublebyte_llf_ti, &
                setfvalue3d_doubleshort_llf_ti, &
                setfvalue3d_doubleint_llf_ti, &
                setfvalue3d_doublefloat_llf_ti, &
                setfvalue3d_doubledouble_llf_ti, &
                setfvalue3d_bytebyte_lld_ti, &
                setfvalue3d_byteshort_lld_ti, &
                setfvalue3d_byteint_lld_ti, &
                setfvalue3d_bytefloat_lld_ti, &
                setfvalue3d_bytedouble_lld_ti, &
                setfvalue3d_shortbyte_lld_ti, &
                setfvalue3d_shortshort_lld_ti, &
                setfvalue3d_shortint_lld_ti, &
                setfvalue3d_shortfloat_lld_ti, &
                setfvalue3d_shortdouble_lld_ti, &
                setfvalue3d_intbyte_lld_ti, &
                setfvalue3d_intshort_lld_ti, &
                setfvalue3d_intint_lld_ti, &
                setfvalue3d_intfloat_lld_ti, &
                setfvalue3d_intdouble_lld_ti, &
                setfvalue3d_floatbyte_lld_ti, &
                setfvalue3d_floatshort_lld_ti, &
                setfvalue3d_floatint_lld_ti, &
                setfvalue3d_floatfloat_lld_ti, &
                setfvalue3d_floatdouble_lld_ti, &
                setfvalue3d_doublebyte_lld_ti, &
                setfvalue3d_doubleshort_lld_ti, &
                setfvalue3d_doubleint_lld_ti, &
                setfvalue3d_doublefloat_lld_ti, &
                setfvalue3d_doubledouble_lld_ti, &
                setfvalue3d_bytebyte_llf_tf, &
                setfvalue3d_byteshort_llf_tf, &
                setfvalue3d_byteint_llf_tf, &
                setfvalue3d_bytefloat_llf_tf, &
                setfvalue3d_bytedouble_llf_tf, &
                setfvalue3d_shortbyte_llf_tf, &
                setfvalue3d_shortshort_llf_tf, &
                setfvalue3d_shortint_llf_tf, &
                setfvalue3d_shortfloat_llf_tf, &
                setfvalue3d_shortdouble_llf_tf, &
                setfvalue3d_intbyte_llf_tf, &
                setfvalue3d_intshort_llf_tf, &
                setfvalue3d_intint_llf_tf, &
                setfvalue3d_intfloat_llf_tf, &
                setfvalue3d_intdouble_llf_tf, &
                setfvalue3d_floatbyte_llf_tf, &
                setfvalue3d_floatshort_llf_tf, &
                setfvalue3d_floatint_llf_tf, &
                setfvalue3d_floatfloat_llf_tf, &
                setfvalue3d_floatdouble_llf_tf, &
                setfvalue3d_doublebyte_llf_tf, &
                setfvalue3d_doubleshort_llf_tf, &
                setfvalue3d_doubleint_llf_tf, &
                setfvalue3d_doublefloat_llf_tf, &
                setfvalue3d_doubledouble_llf_tf, &
                setfvalue3d_bytebyte_lld_tf, &
                setfvalue3d_byteshort_lld_tf, &
                setfvalue3d_byteint_lld_tf, &
                setfvalue3d_bytefloat_lld_tf, &
                setfvalue3d_bytedouble_lld_tf, &
                setfvalue3d_shortbyte_lld_tf, &
                setfvalue3d_shortshort_lld_tf, &
                setfvalue3d_shortint_lld_tf, &
                setfvalue3d_shortfloat_lld_tf, &
                setfvalue3d_shortdouble_lld_tf, &
                setfvalue3d_intbyte_lld_tf, &
                setfvalue3d_intshort_lld_tf, &
                setfvalue3d_intint_lld_tf, &
                setfvalue3d_intfloat_lld_tf, &
                setfvalue3d_intdouble_lld_tf, &
                setfvalue3d_floatbyte_lld_tf, &
                setfvalue3d_floatshort_lld_tf, &
                setfvalue3d_floatint_lld_tf, &
                setfvalue3d_floatfloat_lld_tf, &
                setfvalue3d_floatdouble_lld_tf, &
                setfvalue3d_doublebyte_lld_tf, &
                setfvalue3d_doubleshort_lld_tf, &
                setfvalue3d_doubleint_lld_tf, &
                setfvalue3d_doublefloat_lld_tf, &
                setfvalue3d_doubledouble_lld_tf, &
                setfvalue3d_bytebyte_llf_td, &
                setfvalue3d_byteshort_llf_td, &
                setfvalue3d_byteint_llf_td, &
                setfvalue3d_bytefloat_llf_td, &
                setfvalue3d_bytedouble_llf_td, &
                setfvalue3d_shortbyte_llf_td, &
                setfvalue3d_shortshort_llf_td, &
                setfvalue3d_shortint_llf_td, &
                setfvalue3d_shortfloat_llf_td, &
                setfvalue3d_shortdouble_llf_td, &
                setfvalue3d_intbyte_llf_td, &
                setfvalue3d_intshort_llf_td, &
                setfvalue3d_intint_llf_td, &
                setfvalue3d_intfloat_llf_td, &
                setfvalue3d_intdouble_llf_td, &
                setfvalue3d_floatbyte_llf_td, &
                setfvalue3d_floatshort_llf_td, &
                setfvalue3d_floatint_llf_td, &
                setfvalue3d_floatfloat_llf_td, &
                setfvalue3d_floatdouble_llf_td, &
                setfvalue3d_doublebyte_llf_td, &
                setfvalue3d_doubleshort_llf_td, &
                setfvalue3d_doubleint_llf_td, &
                setfvalue3d_doublefloat_llf_td, &
                setfvalue3d_doubledouble_llf_td, &
                setfvalue3d_bytebyte_lld_td, &
                setfvalue3d_byteshort_lld_td, &
                setfvalue3d_byteint_lld_td, &
                setfvalue3d_bytefloat_lld_td, &
                setfvalue3d_bytedouble_lld_td, &
                setfvalue3d_shortbyte_lld_td, &
                setfvalue3d_shortshort_lld_td, &
                setfvalue3d_shortint_lld_td, &
                setfvalue3d_shortfloat_lld_td, &
                setfvalue3d_shortdouble_lld_td, &
                setfvalue3d_intbyte_lld_td, &
                setfvalue3d_intshort_lld_td, &
                setfvalue3d_intint_lld_td, &
                setfvalue3d_intfloat_lld_td, &
                setfvalue3d_intdouble_lld_td, &
                setfvalue3d_floatbyte_lld_td, &
                setfvalue3d_floatshort_lld_td, &
                setfvalue3d_floatint_lld_td, &
                setfvalue3d_floatfloat_lld_td, &
                setfvalue3d_floatdouble_lld_td, &
                setfvalue3d_doublebyte_lld_td, &
                setfvalue3d_doubleshort_lld_td, &
                setfvalue3d_doubleint_lld_td, &
                setfvalue3d_doublefloat_lld_td, &
                setfvalue3d_doubledouble_lld_td
end interface setFillValue
