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
#define FPL_SUBR readgrid2d_byte_llf
#define FPL_TYPE nc2d_byte_llf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_byte_lld
#define FPL_TYPE nc2d_byte_lld
#define FPL_LABEL "BYTE"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_short_llf
#define FPL_TYPE nc2d_short_llf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_short_lld
#define FPL_TYPE nc2d_short_lld
#define FPL_LABEL "SHORT"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_int_llf
#define FPL_TYPE nc2d_int_llf
#define FPL_LABEL "INT"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_int_lld
#define FPL_TYPE nc2d_int_lld
#define FPL_LABEL "INT"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_float_llf
#define FPL_TYPE nc2d_float_llf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_float_lld
#define FPL_TYPE nc2d_float_lld
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_double_llf
#define FPL_TYPE nc2d_double_llf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid2d_double_lld
#define FPL_TYPE nc2d_double_lld
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_2d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_byte_llf_ti
#define FPL_TYPE nc3d_byte_llf_ti
#define FPL_LABEL "BYTE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_byte_llf_tf
#define FPL_TYPE nc3d_byte_llf_tf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_byte_llf_td
#define FPL_TYPE nc3d_byte_llf_td
#define FPL_LABEL "BYTE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_byte_lld_ti
#define FPL_TYPE nc3d_byte_lld_ti
#define FPL_LABEL "BYTE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_byte_lld_tf
#define FPL_TYPE nc3d_byte_lld_tf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_byte_lld_td
#define FPL_TYPE nc3d_byte_lld_td
#define FPL_LABEL "BYTE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_short_llf_ti
#define FPL_TYPE nc3d_short_llf_ti
#define FPL_LABEL "SHORT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_short_llf_tf
#define FPL_TYPE nc3d_short_llf_tf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_short_llf_td
#define FPL_TYPE nc3d_short_llf_td
#define FPL_LABEL "SHORT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_short_lld_ti
#define FPL_TYPE nc3d_short_lld_ti
#define FPL_LABEL "SHORT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_short_lld_tf
#define FPL_TYPE nc3d_short_lld_tf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_short_lld_td
#define FPL_TYPE nc3d_short_lld_td
#define FPL_LABEL "SHORT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_int_llf_ti
#define FPL_TYPE nc3d_int_llf_ti
#define FPL_LABEL "INT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_int_llf_tf
#define FPL_TYPE nc3d_int_llf_tf
#define FPL_LABEL "INT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_int_llf_td
#define FPL_TYPE nc3d_int_llf_td
#define FPL_LABEL "INT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_int_lld_ti
#define FPL_TYPE nc3d_int_lld_ti
#define FPL_LABEL "INT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_int_lld_tf
#define FPL_TYPE nc3d_int_lld_tf
#define FPL_LABEL "INT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_int_lld_td
#define FPL_TYPE nc3d_int_lld_td
#define FPL_LABEL "INT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_float_llf_ti
#define FPL_TYPE nc3d_float_llf_ti
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_float_llf_tf
#define FPL_TYPE nc3d_float_llf_tf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_float_llf_td
#define FPL_TYPE nc3d_float_llf_td
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_float_lld_ti
#define FPL_TYPE nc3d_float_lld_ti
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_float_lld_tf
#define FPL_TYPE nc3d_float_lld_tf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_float_lld_td
#define FPL_TYPE nc3d_float_lld_td
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_double_llf_ti
#define FPL_TYPE nc3d_double_llf_ti
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_double_llf_tf
#define FPL_TYPE nc3d_double_llf_tf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_double_llf_td
#define FPL_TYPE nc3d_double_llf_td
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_double_lld_ti
#define FPL_TYPE nc3d_double_lld_ti
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_double_lld_tf
#define FPL_TYPE nc3d_double_lld_tf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid3d_double_lld_td
#define FPL_TYPE nc3d_double_lld_td
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_3d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_llf_ti_li
#define FPL_TYPE nc4d_byte_llf_ti_li
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_llf_ti_lf
#define FPL_TYPE nc4d_byte_llf_ti_lf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_llf_tf_li
#define FPL_TYPE nc4d_byte_llf_tf_li
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_llf_tf_lf
#define FPL_TYPE nc4d_byte_llf_tf_lf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_llf_td_li
#define FPL_TYPE nc4d_byte_llf_td_li
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_llf_td_lf
#define FPL_TYPE nc4d_byte_llf_td_lf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_lld_ti_li
#define FPL_TYPE nc4d_byte_lld_ti_li
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_lld_ti_lf
#define FPL_TYPE nc4d_byte_lld_ti_lf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_lld_tf_li
#define FPL_TYPE nc4d_byte_lld_tf_li
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_lld_tf_lf
#define FPL_TYPE nc4d_byte_lld_tf_lf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_lld_td_li
#define FPL_TYPE nc4d_byte_lld_td_li
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_byte_lld_td_lf
#define FPL_TYPE nc4d_byte_lld_td_lf
#define FPL_LABEL "BYTE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_llf_ti_li
#define FPL_TYPE nc4d_short_llf_ti_li
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_llf_ti_lf
#define FPL_TYPE nc4d_short_llf_ti_lf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_llf_tf_li
#define FPL_TYPE nc4d_short_llf_tf_li
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_llf_tf_lf
#define FPL_TYPE nc4d_short_llf_tf_lf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_llf_td_li
#define FPL_TYPE nc4d_short_llf_td_li
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_llf_td_lf
#define FPL_TYPE nc4d_short_llf_td_lf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_lld_ti_li
#define FPL_TYPE nc4d_short_lld_ti_li
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_lld_ti_lf
#define FPL_TYPE nc4d_short_lld_ti_lf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_lld_tf_li
#define FPL_TYPE nc4d_short_lld_tf_li
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_lld_tf_lf
#define FPL_TYPE nc4d_short_lld_tf_lf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_lld_td_li
#define FPL_TYPE nc4d_short_lld_td_li
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_short_lld_td_lf
#define FPL_TYPE nc4d_short_lld_td_lf
#define FPL_LABEL "SHORT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_llf_ti_li
#define FPL_TYPE nc4d_int_llf_ti_li
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_llf_ti_lf
#define FPL_TYPE nc4d_int_llf_ti_lf
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_llf_tf_li
#define FPL_TYPE nc4d_int_llf_tf_li
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_llf_tf_lf
#define FPL_TYPE nc4d_int_llf_tf_lf
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_llf_td_li
#define FPL_TYPE nc4d_int_llf_td_li
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_llf_td_lf
#define FPL_TYPE nc4d_int_llf_td_lf
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_lld_ti_li
#define FPL_TYPE nc4d_int_lld_ti_li
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_lld_ti_lf
#define FPL_TYPE nc4d_int_lld_ti_lf
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_lld_tf_li
#define FPL_TYPE nc4d_int_lld_tf_li
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_lld_tf_lf
#define FPL_TYPE nc4d_int_lld_tf_lf
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_lld_td_li
#define FPL_TYPE nc4d_int_lld_td_li
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_int_lld_td_lf
#define FPL_TYPE nc4d_int_lld_td_lf
#define FPL_LABEL "INT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_llf_ti_li
#define FPL_TYPE nc4d_float_llf_ti_li
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_llf_ti_lf
#define FPL_TYPE nc4d_float_llf_ti_lf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_llf_tf_li
#define FPL_TYPE nc4d_float_llf_tf_li
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_llf_tf_lf
#define FPL_TYPE nc4d_float_llf_tf_lf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_llf_td_li
#define FPL_TYPE nc4d_float_llf_td_li
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_llf_td_lf
#define FPL_TYPE nc4d_float_llf_td_lf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_lld_ti_li
#define FPL_TYPE nc4d_float_lld_ti_li
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_lld_ti_lf
#define FPL_TYPE nc4d_float_lld_ti_lf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_lld_tf_li
#define FPL_TYPE nc4d_float_lld_tf_li
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_lld_tf_lf
#define FPL_TYPE nc4d_float_lld_tf_lf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_lld_td_li
#define FPL_TYPE nc4d_float_lld_td_li
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_float_lld_td_lf
#define FPL_TYPE nc4d_float_lld_td_lf
#define FPL_LABEL "FLOAT"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_llf_ti_li
#define FPL_TYPE nc4d_double_llf_ti_li
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_llf_ti_lf
#define FPL_TYPE nc4d_double_llf_ti_lf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_llf_tf_li
#define FPL_TYPE nc4d_double_llf_tf_li
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_llf_tf_lf
#define FPL_TYPE nc4d_double_llf_tf_lf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_llf_td_li
#define FPL_TYPE nc4d_double_llf_td_li
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_llf_td_lf
#define FPL_TYPE nc4d_double_llf_td_lf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_lld_ti_li
#define FPL_TYPE nc4d_double_lld_ti_li
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_lld_ti_lf
#define FPL_TYPE nc4d_double_lld_ti_lf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_lld_tf_li
#define FPL_TYPE nc4d_double_lld_tf_li
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_lld_tf_lf
#define FPL_TYPE nc4d_double_lld_tf_lf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_lld_td_li
#define FPL_TYPE nc4d_double_lld_td_li
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

#define FPL_SUBR readgrid4d_double_lld_td_lf
#define FPL_TYPE nc4d_double_lld_td_lf
#define FPL_LABEL "DOUBLE"
#include "templates/readgrid_4d.inc"
#undef FPL_SUBR
#undef FPL_TYPE
#undef FPL_LABEL

