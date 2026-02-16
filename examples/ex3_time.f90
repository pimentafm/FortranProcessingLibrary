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

!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
! Reads netCDF files, masks data and saves the masked data
! Uses subroutines to calculate runtime
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program main
  use fpl
  implicit none

  !Structure declarations for CATTLE19902012.nc (3d dataset)
  !variable type: double
  !longitude and latitude type: double
  !time type: integer

  !Related article and original data download
  !Dias, L.C.P., Pimenta, F.M., Santos, A.B., Costa, M.H., Ladle, R.J. (2016). 
  !Patterns of land use, extensification and intensification of Brazilian agriculture. 
  !Global Change Biology. doi:10.1111/gcb.13314
  !http://onlinelibrary.wiley.com/doi/10.1111/gcb.13314/ful

  !Download: http://www.biosfera.dea.ufv.br/en-US/bancos
 
  !Stocking rate of cattle are in heads per hectare (head/ha)
  type(nc3d_double_lld_ti) :: cattle

  !Structure declarations for brazil_UF.nc (2d dataset)
  !variable type: byte
  !longitude and latitude datatype: double

  !Brazilian UF data
  type(nc2d_byte_lld) :: maskara

  !Auxiliary variables for time calculation
  real*4 :: start_time, end_time
  
  character(200) :: inputpath, outputpath, maskfile

  inputpath = "database/CATTLE19902012.nc"
  maskfile = "database/brazil_UF.nc"
  outputpath = "database/cattle19902012_mask.nc"
  
  cattle%varname = "Cattle"
  cattle%timename = "time"
  cattle%lonname = "lon"
  cattle%latname = "lat"
 
  maskara%varname = "UF"
  maskara%lonname = "lon"
  maskara%latname = "lat"
 
  write(*,*)"Readind data" 
  call exec_time(start_time)                                     !Save initial time
  call readgrid(maskfile, maskara)                               !Read estates data
  call exec_time(end_time)                                       !Save final time
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time !Execution time

  write(*,*) "vartype: ", maskara%vartype

  write(*,*)"Reading mask"
  call exec_time(start_time)
  call readgrid(inputpath, cattle)                               !Read cattle data
  call exec_time(end_time)
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time

  write(*,*) "cattle vartype: ", cattle%vartype
  
  write(*,*)"Setting FillValue"
  call exec_time(start_time)
  call setFillValue(maskara, cattle, 18)        !Masks the cattle data where the state map is equal to 18.
  call exec_time(end_time)
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time

  write(*,*) "Writing data"
  call exec_time(start_time)
  call writegrid(outputpath, cattle)                             !Saves the masked data
  call exec_time(end_time)
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time

  !Deallocate memory
  call dealloc(cattle)
  call dealloc(maskara)
end program main
