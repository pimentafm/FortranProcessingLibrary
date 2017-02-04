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
! Generates 2d, 3d and 4d data grids
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

program main
  use fpl
  implicit none

  !Definition of dataset structures
  type(nc2d_double_llf) :: grid2d
  type(nc3d_int_llf_ti) :: grid3d
  type(nc4d_float_llf_ti_li) :: grid4d
 
  !Auxiliary variables
  integer(kind=intgr) :: i, j, k, l

  !Min max coordinates
  real(kind=4) :: Xmin, Ymin, Xmax, Ymax, res

  character(200) :: opath2d, opath3d, opath4d

  !Output files
  opath2d = "database/grid2d.nc"
  opath3d = "database/grid3d.nc"
  opath4d = "database/grid4d.nc"


  !Grid 2d definitions
  grid2d%long_name = "My Grid 1 degree"
  
  grid2d%varname = "grid"
  grid2d%lonname = "lon"
  grid2d%latname = "lat"

  grid2d%varunits = "dimensionless"
  grid2d%lonunits = "degrees_east"
  grid2d%latunits = "degrees_north"

  grid2d%FillValue = -9999

  !Grid 3d definitions
  grid3d%long_name = "My Grid 1 degree"
  
  grid3d%varname = "grid"
  grid3d%lonname = "lon"
  grid3d%latname = "lat"
  grid3d%timename = "time"

  grid3d%varunits = "dimensionless"
  grid3d%lonunits = "degrees_east"
  grid3d%latunits = "degrees_north"
  grid3d%timeunits = "hour"

  grid3d%ntimes = 10

  grid3d%FillValue = -9999

  !Grid 4d definitions
  grid4d%long_name = "My Grid  ~ 1 degree"
  
  grid4d%varname = "grid"
  grid4d%lonname = "lon"
  grid4d%latname = "lat"
  grid4d%timename = "time"
  grid4d%levelname = "level"

  grid4d%varunits = "dimensionless"
  grid4d%lonunits = "degrees_east"
  grid4d%latunits = "degrees_north"
  grid4d%timeunits = "hour"
  grid4d%levelunits = "m"

  grid4d%ntimes = 10
  grid4d%nlevels = 5

  grid4d%FillValue = -9999

  !   Latitude|                                  Xmin: westernmost longitude   
  !           |                                  Ymin: southernmost latitude
  !           |       Ymax                       Xmax: easternmost longitude
  !           |_________________                 Ymax: northernmost latitude
  !           |__|__|__|__|__|__|                i, j: initial position of the matrix on the x-axis and y-axis (i=0,j=0).
  !           |__|__|__|__|__|__|                
  !      Xmin |__|__|__|__|__|__| Xmax           
  !           |__|__|__|__|__|__|
  !          j|__|__|__|__|__|__|_____________ 
  !           i                      Longitude 
  !                   Ymin

  Xmin = -54.7371
  Ymin = -11.3437
  Xmax = -34.7371
  Ymax = 2.6562
  res = 0.00833333
 
  !Generates a 2d grid
  call gengrid(grid2d, Xmin, Ymin, Xmax, Ymax, res)

  !Fills the array data using openmp
  !$omp parallel do
  do i = 1, grid2d%nlons
    do j = 1, grid2d%nlats
      grid2d%ncdata(i,j) = cos(grid2d%longitudes(i)) + grid2d%latitudes(j)
    end do
  end do
  !omp end parallel do
  
  write(*,*) "Grid 2d info ================================="
  write(*,'(a13,a20)') "varname :    ",   grid2d%varname  
  write(*,'(a13,a20)') "latname :    ",   grid2d%latname
  write(*,'(a13,a20)') "lonname :    ",   grid2d%lonname
  write(*,'(a13,a20)') "long_name :  ",   grid2d%long_name
  write(*,'(a13,a20)') "varunits :   ",   grid2d%varunits 
  write(*,'(a13,a20)') "lonunits :   ",   grid2d%lonunits
  write(*,'(a13,a20)') "latunits :   ",   grid2d%latunits
  write(*,'(a13,4a20)') "dimname() :  ",  grid2d%dimname
  write(*,'(a13,4a20)') "dimunits() : ",  grid2d%dimunits
  write(*,'(a13,i4)') "nlons :      ",    grid2d%nlons
  write(*,'(a13,i4)') "nlats :      ",    grid2d%nlats
  write(*,'(a13,i4)') "ndims :      ",    grid2d%ndims
  write(*,'(a13,i4)') "vartype :    ",    grid2d%vartype
  write(*,'(a13,4i4)') "dimid() :    ",   grid2d%dimid
  write(*,'(a13,4i6)') "dimsize() :  ",   grid2d%dimsize
  write(*,'(a13,4i4)') "varids() :   ",   grid2d%varids
  write(*,'(a13,4i4)') "dims() :     ",   grid2d%dims
  write(*,'(a13,f10.4)') "FillValue :  ", grid2d%FillValue
  
  !Write 2d data on file
  call writegrid(opath2d, grid2d)

  !Generates a 3d grid
  call gengrid(grid3d, -74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965, 1.0 )

  !Fills the array data
  do i = 1, grid3d%ntimes
    do j = 1, grid3d%nlons
      do k = 1, grid3d%nlats
        grid3d%ncdata(j,k,i) = int(i*(cos(real(j))*grid3d%longitudes(j) + k*grid3d%latitudes(k)))
      end do
    end do
  end do
  
  write(*,*) "Grid 3d info ================================="
  write(*,'(a13,a20)') "varname :    ",   grid3d%varname  
  write(*,'(a13,a20)') "timename :   ",   grid3d%timename
  write(*,'(a13,a20)') "latname :    ",   grid3d%latname
  write(*,'(a13,a20)') "lonname :    ",   grid3d%lonname
  write(*,'(a13,a20)') "long_name :  ",   grid3d%long_name
  write(*,'(a13,a20)') "varunits :   ",   grid3d%varunits 
  write(*,'(a13,a20)') "timeunits :  ",   grid3d%timeunits
  write(*,'(a13,a20)') "lonunits :   ",   grid3d%lonunits
  write(*,'(a13,a20)') "latunits :   ",   grid3d%latunits
  write(*,'(a13,4a20)') "dimname() :  ",  grid3d%dimname
  write(*,'(a13,4a20)') "dimunits() : ",  grid3d%dimunits
  write(*,'(a13,i4)') "nlons :      ",    grid3d%nlons
  write(*,'(a13,i4)') "nlats :      ",    grid3d%nlats
  write(*,'(a13,i4)') "ntimes :     ",    grid3d%ntimes
  write(*,'(a13,i4)') "ndims :      ",    grid3d%ndims
  write(*,'(a13,i4)') "vartype :    ",    grid3d%vartype
  write(*,'(a13,4i4)') "dimid() :    ",   grid3d%dimid
  write(*,'(a13,4i6)') "dimsize() :  ",   grid3d%dimsize
  write(*,'(a13,4i4)') "varids() :   ",   grid3d%varids
  write(*,'(a13,4i4)') "dims() :     ",   grid3d%dims
  write(*,'(a13,i6)') "FillValue :  ", grid3d%FillValue

  !Write 3d data on file
  call writegrid(opath3d, grid3d)

  !Generates 4d grid
  call gengrid(grid4d, -74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965, 1.0 )

  !Fills the array data
  do l = 1, grid4d%nlevels
    do i = 1, grid4d%ntimes
      do j = 1, grid4d%nlons
        do k = 1, grid4d%nlats
          grid4d%ncdata(j,k,i,l) = int((l**3)/i*(cos(real(j))*grid4d%longitudes(j) + k*grid4d%latitudes(k)))   
        end do
      end do
    end do
  end do

  write(*,*) "Grid 4d info ================================="
  write(*,'(a13,a20)') "varname :    ",   grid4d%varname  
  write(*,'(a13,a20)') "timename :   ",   grid4d%timename
  write(*,'(a13,a20)') "levelname :  ",   grid4d%levelname
  write(*,'(a13,a20)') "latname :    ",   grid4d%latname
  write(*,'(a13,a20)') "lonname :    ",   grid4d%lonname
  write(*,'(a13,a20)') "long_name :  ",   grid4d%long_name
  write(*,'(a13,a20)') "varunits :   ",   grid4d%varunits 
  write(*,'(a13,a20)') "timeunits :  ",   grid4d%timeunits
  write(*,'(a13,a20)') "levelunits : ",   grid4d%levelunits
  write(*,'(a13,a20)') "lonunits :   ",   grid4d%lonunits
  write(*,'(a13,a20)') "latunits :   ",   grid4d%latunits
  write(*,'(a13,4a20)') "dimname() :  ",  grid4d%dimname
  write(*,'(a13,4a20)') "dimunits() : ",  grid4d%dimunits
  write(*,'(a13,i4)') "nlons :      ",    grid4d%nlons
  write(*,'(a13,i4)') "nlats :      ",    grid4d%nlats
  write(*,'(a13,i4)') "nlevels :    ",    grid4d%nlevels
  write(*,'(a13,i4)') "ntimes :     ",    grid4d%ntimes
  write(*,'(a13,i4)') "ndims :      ",    grid4d%ndims
  write(*,'(a13,i4)') "vartype :    ",    grid4d%vartype
  write(*,'(a13,4i4)') "dimid() :    ",   grid4d%dimid
  write(*,'(a13,4i4)') "dimsize() :  ",   grid4d%dimsize
  write(*,'(a13,4i4)') "varids() :   ",   grid4d%varids
  write(*,'(a13,4i4)') "dims() :     ",   grid4d%dims
  write(*,'(a13,f10.4)') "FillValue :  ", grid4d%FillValue

  !Write 4d data
  call writegrid(opath4d, grid4d, "database/gridHeader.txt")

end program main

