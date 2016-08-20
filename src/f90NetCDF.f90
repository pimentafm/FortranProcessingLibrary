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

!:==================== Fortran NetCDF API Main Module =========================
module f90NetCDF
  use omp_lib
  use netcdf
  use iso_c_binding
  implicit none
  include "f90NetCDF_constants.f90"   !Parameter variables
  include "f90NetCDF_datatypes.f90"   !Datatype structure declarations
  include "f90NetCDF_interfaces.f90"  !Interfaces for subroutines definitions and datatypes

  contains
  include "f90NetCDF_checkerror.f90"  !Error checker subroutines
  include "f90NetCDF_datetime.f90"    !System date-time subroutine
  include "f90NetCDF_griddims.f90"    !Subroutines to get the number of coordinates from NetCDF file
  include "f90NetCDF_readgrid.f90"    !NetCDF file reader subroutines
  include "f90NetCDF_writegrid.f90"   !NetCDF file writer subroutines
  include "f90NetCDF_fvalue.f90"      !Set FillValue and mask creator subroutines
!  include "f90NetCDF_zonalstats.f90"  !Zonal Statistics subroutines
  include "f90NetCDF_fileutils.f90"   !File Utilities
end module f90NetCDF

