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

!:=========================== FPL Main Module =================================
module FPL
  use omp_lib
  use netcdf
  use iso_c_binding
  implicit none
  include "FPL_constants.f90"    !Parameter variables
  include "FPL_datatypes.f90"    !Datatype structure declarations
  include "FPL_interfaces.f90"   !Interfaces for subroutines definitions and datatypes

  contains
  include "FPL_checkerror.f90"   !Error checker subroutines
  include "FPL_datetime.f90"     !System date-time subroutine
  include "FPL_griddims.f90"     !Subroutines to get the number of coordinates from NetCDF file
  include "FPL_readgrid.f90"     !NetCDF file reader subroutines
  include "FPL_writegrid.f90"    !NetCDF file writer subroutines
  include "FPL_setfillvalue.f90" !Set FillValue and mask creator subroutines
  include "FPL_gengrid.f90"      !Generate custom grid 
  include "FPL_dealloc.f90"      !Deallocate subroutines
  include "FPL_fileutils.f90"    !File Utilities
  include "FPL_misc.f90"         !Miscelanious
! include "FPL_zonalstats.f90"  !Zonal Statistics subroutines
end module FPL

