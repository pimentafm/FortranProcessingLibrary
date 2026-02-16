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
#define FPL_TYPE nc2d_byte_llf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_byte_lld
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_short_llf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_short_lld
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_int_llf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_int_lld
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_float_llf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_float_lld
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_double_llf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc2d_double_lld
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#include "templates/datatypes_2d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND

#define FPL_TYPE nc3d_byte_llf_ti
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_byte_llf_tf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_byte_llf_td
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_byte_lld_ti
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_byte_lld_tf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_byte_lld_td
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_short_llf_ti
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_short_llf_tf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_short_llf_td
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_short_lld_ti
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_short_lld_tf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_short_lld_td
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_int_llf_ti
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_int_llf_tf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_int_llf_td
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_int_lld_ti
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_int_lld_tf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_int_lld_td
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_float_llf_ti
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_float_llf_tf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_float_llf_td
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_float_lld_ti
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_float_lld_tf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_float_lld_td
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_double_llf_ti
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_double_llf_tf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_double_llf_td
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_double_lld_ti
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_double_lld_tf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc3d_double_lld_td
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#include "templates/datatypes_3d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL

#define FPL_TYPE nc4d_byte_llf_ti_li
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_llf_ti_lf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_llf_tf_li
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_llf_tf_lf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_llf_td_li
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_llf_td_lf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_lld_ti_li
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_lld_ti_lf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_lld_tf_li
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_lld_tf_lf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_lld_td_li
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_byte_lld_td_lf
#define FPL_FILL_DECL integer(kind=byte)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_llf_ti_li
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_llf_ti_lf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_llf_tf_li
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_llf_tf_lf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_llf_td_li
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_llf_td_lf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_lld_ti_li
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_lld_ti_lf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_lld_tf_li
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_lld_tf_lf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_lld_td_li
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_short_lld_td_lf
#define FPL_FILL_DECL integer(kind=short)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_llf_ti_li
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_llf_ti_lf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_llf_tf_li
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_llf_tf_lf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_llf_td_li
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_llf_td_lf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_lld_ti_li
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_lld_ti_lf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_lld_tf_li
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_lld_tf_lf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_lld_td_li
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_int_lld_td_lf
#define FPL_FILL_DECL integer(kind=intgr)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_llf_ti_li
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_llf_ti_lf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_llf_tf_li
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_llf_tf_lf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_llf_td_li
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_llf_td_lf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_lld_ti_li
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_lld_ti_lf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_lld_tf_li
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_lld_tf_lf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_lld_td_li
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_float_lld_td_lf
#define FPL_FILL_DECL real(kind=float)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_llf_ti_li
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_llf_ti_lf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_llf_tf_li
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_llf_tf_lf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_llf_td_li
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_llf_td_lf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND float
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_lld_ti_li
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_lld_ti_lf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL integer(kind=intgr)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_lld_tf_li
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_lld_tf_lf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=float)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_lld_td_li
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL integer(kind=intgr)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

#define FPL_TYPE nc4d_double_lld_td_lf
#define FPL_FILL_DECL real(kind=double)
#define FPL_COORD_KIND double
#define FPL_TIME_DECL real(kind=double)
#define FPL_LEVEL_DECL real(kind=float)
#include "templates/datatypes_4d.inc"
#undef FPL_TYPE
#undef FPL_FILL_DECL
#undef FPL_COORD_KIND
#undef FPL_TIME_DECL
#undef FPL_LEVEL_DECL

