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
#define FPL_SUBR setfvalue2d_bytebyte_llf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc2d_byte_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_byteshort_llf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc2d_short_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_byteint_llf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc2d_int_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_bytefloat_llf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc2d_float_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_bytedouble_llf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc2d_double_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortbyte_llf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc2d_byte_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortshort_llf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc2d_short_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortint_llf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc2d_int_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortfloat_llf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc2d_float_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortdouble_llf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc2d_double_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intbyte_llf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc2d_byte_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intshort_llf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc2d_short_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intint_llf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc2d_int_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intfloat_llf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc2d_float_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intdouble_llf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc2d_double_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatbyte_llf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc2d_byte_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatshort_llf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc2d_short_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatint_llf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc2d_int_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatfloat_llf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc2d_float_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatdouble_llf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc2d_double_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doublebyte_llf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc2d_byte_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doubleshort_llf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc2d_short_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doubleint_llf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc2d_int_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doublefloat_llf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc2d_float_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doubledouble_llf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc2d_double_llf
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_bytebyte_lld
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc2d_byte_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_byteshort_lld
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc2d_short_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_byteint_lld
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc2d_int_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_bytefloat_lld
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc2d_float_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_bytedouble_lld
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc2d_double_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortbyte_lld
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc2d_byte_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortshort_lld
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc2d_short_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortint_lld
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc2d_int_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortfloat_lld
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc2d_float_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_shortdouble_lld
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc2d_double_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intbyte_lld
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc2d_byte_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intshort_lld
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc2d_short_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intint_lld
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc2d_int_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intfloat_lld
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc2d_float_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_intdouble_lld
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc2d_double_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatbyte_lld
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc2d_byte_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatshort_lld
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc2d_short_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatint_lld
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc2d_int_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatfloat_lld
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc2d_float_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_floatdouble_lld
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc2d_double_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doublebyte_lld
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc2d_byte_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doubleshort_lld
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc2d_short_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doubleint_lld
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc2d_int_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doublefloat_lld
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc2d_float_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue2d_doubledouble_lld
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc2d_double_lld
#include "templates/setfillvalue_2d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytebyte_llf_ti
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_byte_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteshort_llf_ti
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_short_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteint_llf_ti
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_int_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytefloat_llf_ti
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_float_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytedouble_llf_ti
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_double_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortbyte_llf_ti
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_byte_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortshort_llf_ti
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_short_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortint_llf_ti
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_int_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortfloat_llf_ti
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_float_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortdouble_llf_ti
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_double_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intbyte_llf_ti
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_byte_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intshort_llf_ti
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_short_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intint_llf_ti
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_int_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intfloat_llf_ti
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_float_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intdouble_llf_ti
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_double_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatbyte_llf_ti
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_byte_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatshort_llf_ti
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_short_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatint_llf_ti
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_int_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatfloat_llf_ti
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_float_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatdouble_llf_ti
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_double_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublebyte_llf_ti
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_byte_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleshort_llf_ti
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_short_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleint_llf_ti
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_int_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublefloat_llf_ti
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_float_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubledouble_llf_ti
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_double_llf_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytebyte_llf_tf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_byte_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteshort_llf_tf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_short_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteint_llf_tf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_int_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytefloat_llf_tf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_float_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytedouble_llf_tf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_double_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortbyte_llf_tf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_byte_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortshort_llf_tf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_short_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortint_llf_tf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_int_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortfloat_llf_tf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_float_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortdouble_llf_tf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_double_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intbyte_llf_tf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_byte_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intshort_llf_tf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_short_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intint_llf_tf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_int_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intfloat_llf_tf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_float_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intdouble_llf_tf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_double_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatbyte_llf_tf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_byte_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatshort_llf_tf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_short_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatint_llf_tf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_int_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatfloat_llf_tf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_float_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatdouble_llf_tf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_double_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublebyte_llf_tf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_byte_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleshort_llf_tf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_short_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleint_llf_tf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_int_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublefloat_llf_tf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_float_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubledouble_llf_tf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_double_llf_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytebyte_llf_td
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_byte_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteshort_llf_td
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_short_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteint_llf_td
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_int_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytefloat_llf_td
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_float_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytedouble_llf_td
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc3d_double_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortbyte_llf_td
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_byte_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortshort_llf_td
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_short_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortint_llf_td
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_int_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortfloat_llf_td
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_float_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortdouble_llf_td
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc3d_double_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intbyte_llf_td
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_byte_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intshort_llf_td
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_short_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intint_llf_td
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_int_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intfloat_llf_td
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_float_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intdouble_llf_td
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc3d_double_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatbyte_llf_td
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_byte_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatshort_llf_td
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_short_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatint_llf_td
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_int_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatfloat_llf_td
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_float_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatdouble_llf_td
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc3d_double_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublebyte_llf_td
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_byte_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleshort_llf_td
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_short_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleint_llf_td
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_int_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublefloat_llf_td
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_float_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubledouble_llf_td
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc3d_double_llf_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytebyte_lld_ti
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_byte_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteshort_lld_ti
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_short_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteint_lld_ti
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_int_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytefloat_lld_ti
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_float_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytedouble_lld_ti
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_double_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortbyte_lld_ti
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_byte_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortshort_lld_ti
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_short_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortint_lld_ti
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_int_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortfloat_lld_ti
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_float_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortdouble_lld_ti
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_double_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intbyte_lld_ti
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_byte_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intshort_lld_ti
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_short_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intint_lld_ti
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_int_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intfloat_lld_ti
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_float_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intdouble_lld_ti
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_double_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatbyte_lld_ti
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_byte_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatshort_lld_ti
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_short_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatint_lld_ti
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_int_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatfloat_lld_ti
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_float_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatdouble_lld_ti
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_double_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublebyte_lld_ti
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_byte_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleshort_lld_ti
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_short_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleint_lld_ti
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_int_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublefloat_lld_ti
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_float_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubledouble_lld_ti
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_double_lld_ti
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytebyte_lld_tf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_byte_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteshort_lld_tf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_short_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteint_lld_tf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_int_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytefloat_lld_tf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_float_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytedouble_lld_tf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_double_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortbyte_lld_tf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_byte_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortshort_lld_tf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_short_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortint_lld_tf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_int_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortfloat_lld_tf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_float_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortdouble_lld_tf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_double_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intbyte_lld_tf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_byte_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intshort_lld_tf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_short_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intint_lld_tf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_int_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intfloat_lld_tf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_float_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intdouble_lld_tf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_double_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatbyte_lld_tf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_byte_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatshort_lld_tf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_short_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatint_lld_tf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_int_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatfloat_lld_tf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_float_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatdouble_lld_tf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_double_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublebyte_lld_tf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_byte_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleshort_lld_tf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_short_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleint_lld_tf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_int_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublefloat_lld_tf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_float_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubledouble_lld_tf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_double_lld_tf
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytebyte_lld_td
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_byte_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteshort_lld_td
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_short_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_byteint_lld_td
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_int_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytefloat_lld_td
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_float_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_bytedouble_lld_td
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc3d_double_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortbyte_lld_td
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_byte_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortshort_lld_td
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_short_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortint_lld_td
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_int_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortfloat_lld_td
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_float_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_shortdouble_lld_td
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc3d_double_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intbyte_lld_td
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_byte_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intshort_lld_td
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_short_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intint_lld_td
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_int_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intfloat_lld_td
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_float_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_intdouble_lld_td
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc3d_double_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatbyte_lld_td
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_byte_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatshort_lld_td
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_short_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatint_lld_td
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_int_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatfloat_lld_td
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_float_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_floatdouble_lld_td
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc3d_double_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublebyte_lld_td
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_byte_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleshort_lld_td
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_short_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubleint_lld_td
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_int_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doublefloat_lld_td
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_float_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue3d_doubledouble_lld_td
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc3d_double_lld_td
#include "templates/setfillvalue_3d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_llf_ti_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_llf_ti_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_llf_ti_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_llf_ti_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_llf_ti_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_llf_ti_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_llf_ti_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_llf_ti_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_llf_ti_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_llf_ti_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_llf_ti_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_llf_ti_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_llf_ti_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_llf_ti_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_llf_ti_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_llf_ti_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_llf_ti_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_llf_ti_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_llf_ti_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_llf_ti_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_llf_ti_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_llf_ti_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_llf_ti_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_llf_ti_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_llf_ti_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_llf_ti_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_llf_ti_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_llf_ti_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_llf_ti_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_llf_ti_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_llf_ti_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_llf_ti_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_llf_ti_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_llf_ti_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_llf_ti_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_llf_ti_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_llf_ti_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_llf_ti_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_llf_ti_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_llf_ti_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_llf_ti_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_llf_ti_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_llf_ti_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_llf_ti_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_llf_ti_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_llf_ti_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_byte_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_llf_ti_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_short_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_llf_ti_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_int_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_llf_ti_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_float_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_llf_ti_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_double_llf_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_llf_tf_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_llf_tf_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_llf_tf_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_llf_tf_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_llf_tf_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_llf_tf_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_llf_tf_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_llf_tf_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_llf_tf_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_llf_tf_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_llf_tf_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_llf_tf_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_llf_tf_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_llf_tf_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_llf_tf_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_llf_tf_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_llf_tf_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_llf_tf_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_llf_tf_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_llf_tf_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_llf_tf_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_llf_tf_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_llf_tf_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_llf_tf_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_llf_tf_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_llf_tf_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_llf_tf_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_llf_tf_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_llf_tf_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_llf_tf_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_llf_tf_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_llf_tf_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_llf_tf_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_llf_tf_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_llf_tf_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_llf_tf_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_llf_tf_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_llf_tf_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_llf_tf_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_llf_tf_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_llf_tf_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_llf_tf_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_llf_tf_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_llf_tf_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_llf_tf_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_llf_tf_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_byte_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_llf_tf_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_short_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_llf_tf_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_int_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_llf_tf_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_float_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_llf_tf_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_double_llf_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_llf_td_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_llf_td_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_llf_td_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_llf_td_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_llf_td_li
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_llf_td_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_llf_td_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_llf_td_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_llf_td_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_llf_td_li
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_llf_td_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_llf_td_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_llf_td_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_llf_td_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_llf_td_li
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_llf_td_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_llf_td_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_llf_td_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_llf_td_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_llf_td_li
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_llf_td_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_llf_td_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_llf_td_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_llf_td_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_llf_td_li
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_llf_td_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_llf_td_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_llf_td_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_llf_td_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_llf_td_lf
#define FPL_MASK_TYPE nc2d_byte_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_llf_td_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_llf_td_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_llf_td_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_llf_td_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_llf_td_lf
#define FPL_MASK_TYPE nc2d_short_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_llf_td_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_llf_td_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_llf_td_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_llf_td_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_llf_td_lf
#define FPL_MASK_TYPE nc2d_int_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_llf_td_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_llf_td_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_llf_td_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_llf_td_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_llf_td_lf
#define FPL_MASK_TYPE nc2d_float_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_llf_td_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_byte_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_llf_td_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_short_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_llf_td_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_int_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_llf_td_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_float_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_llf_td_lf
#define FPL_MASK_TYPE nc2d_double_llf
#define FPL_MAP_TYPE nc4d_double_llf_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_lld_ti_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_lld_ti_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_lld_ti_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_lld_ti_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_lld_ti_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_lld_ti_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_lld_ti_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_lld_ti_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_lld_ti_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_lld_ti_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_lld_ti_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_lld_ti_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_lld_ti_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_lld_ti_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_lld_ti_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_lld_ti_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_lld_ti_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_lld_ti_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_lld_ti_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_lld_ti_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_lld_ti_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_lld_ti_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_lld_ti_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_lld_ti_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_lld_ti_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_lld_ti_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_lld_ti_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_lld_ti_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_lld_ti_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_lld_ti_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_lld_ti_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_lld_ti_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_lld_ti_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_lld_ti_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_lld_ti_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_lld_ti_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_lld_ti_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_lld_ti_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_lld_ti_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_lld_ti_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_lld_ti_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_lld_ti_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_lld_ti_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_lld_ti_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_lld_ti_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_lld_ti_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_byte_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_lld_ti_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_short_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_lld_ti_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_int_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_lld_ti_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_float_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_lld_ti_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_double_lld_ti_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_lld_tf_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_lld_tf_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_lld_tf_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_lld_tf_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_lld_tf_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_lld_tf_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_lld_tf_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_lld_tf_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_lld_tf_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_lld_tf_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_lld_tf_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_lld_tf_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_lld_tf_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_lld_tf_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_lld_tf_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_lld_tf_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_lld_tf_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_lld_tf_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_lld_tf_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_lld_tf_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_lld_tf_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_lld_tf_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_lld_tf_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_lld_tf_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_lld_tf_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_lld_tf_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_lld_tf_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_lld_tf_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_lld_tf_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_lld_tf_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_lld_tf_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_lld_tf_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_lld_tf_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_lld_tf_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_lld_tf_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_lld_tf_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_lld_tf_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_lld_tf_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_lld_tf_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_lld_tf_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_lld_tf_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_lld_tf_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_lld_tf_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_lld_tf_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_lld_tf_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_lld_tf_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_byte_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_lld_tf_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_short_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_lld_tf_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_int_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_lld_tf_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_float_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_lld_tf_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_double_lld_tf_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_lld_td_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_lld_td_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_lld_td_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_lld_td_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_lld_td_li
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_lld_td_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_lld_td_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_lld_td_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_lld_td_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_lld_td_li
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_lld_td_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_lld_td_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_lld_td_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_lld_td_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_lld_td_li
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_lld_td_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_lld_td_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_lld_td_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_lld_td_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_lld_td_li
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_lld_td_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_lld_td_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_lld_td_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_lld_td_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_lld_td_li
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_li
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytebyte_lld_td_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteshort_lld_td_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_byteint_lld_td_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytefloat_lld_td_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_bytedouble_lld_td_lf
#define FPL_MASK_TYPE nc2d_byte_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortbyte_lld_td_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortshort_lld_td_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortint_lld_td_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortfloat_lld_td_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_shortdouble_lld_td_lf
#define FPL_MASK_TYPE nc2d_short_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intbyte_lld_td_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intshort_lld_td_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intint_lld_td_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intfloat_lld_td_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_intdouble_lld_td_lf
#define FPL_MASK_TYPE nc2d_int_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatbyte_lld_td_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatshort_lld_td_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatint_lld_td_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatfloat_lld_td_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_floatdouble_lld_td_lf
#define FPL_MASK_TYPE nc2d_float_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublebyte_lld_td_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_byte_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleshort_lld_td_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_short_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubleint_lld_td_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_int_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doublefloat_lld_td_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_float_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

#define FPL_SUBR setfvalue4d_doubledouble_lld_td_lf
#define FPL_MASK_TYPE nc2d_double_lld
#define FPL_MAP_TYPE nc4d_double_lld_td_lf
#include "templates/setfillvalue_4d.inc"
#undef FPL_SUBR
#undef FPL_MASK_TYPE
#undef FPL_MAP_TYPE

