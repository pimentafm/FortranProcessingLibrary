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

!:==================== Generate costumizeble grid file ========================

program main
  use f90netcdf
  implicit none

  type(nc2d_int_llf) :: grid
  integer(kind=intgr) :: i, j, s

  character(200) :: outputpath

  outputpath = "/home/fernando/Documents/WORKSPACE/dadosTestef90netcdfapi/mygrid.nc"

  grid%long_name = "My Grid ~ 1 degree"
  
  grid%varname = "id"
  grid%lonname = "lon"
  grid%latname = "lat"

  grid%varunits = "dimensionless"
  grid%lonunits = "degrees_east"
  grid%latunits = "degrees_north"

  grid%FillValue = -9999

!                   Ymax
!            _________________
!           |__|__|__|__|__|__|
!           |__|__|__|__|__|__|
!      Xmin |__|__|__|__|__|__| Xmax
!           |__|__|__|__|__|__|
!           |__|__|__|__|__|__| 
!
!                   Ymin

                                      !Xmin               Ymin                Xmax              Ymax           
  call gengrid2d_int_llf(grid, -74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965, 1.0 )

  s = 0
  do i = 1, grid%nlons
    do j = 1, grid%nlats
      s = s + 1
      grid%ncdata(i,j) = s    
    end do
  end do
  
  call writegrid(outputpath, grid)


end program main

