!:========================================================================
! This file is part of f90NetCDF API (NetCDF API for Fortran 90).

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

!:========================================================================
!About Author:
!Student of Surveying and Cartographic Engineering
! Federal University of Viçosa - Brazil

!Bachelor of Biosystems Engineer
! Federal University of São João del-Rei - Brazil

! Reserach Group on Atmosphere-Biosphere Interaction
! Federal University of Viçosa
! Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:========================================================================

!:==================== A Very Simple Text Program ========================
program main
  use ncf90api
  use netcdf
  implicit none

  type (nc2d) :: nc

  integer*4 :: i, j

  character(100) :: ncfile, outfile
  ncfile = "/home/fernando/Documents/dados_netcdf/arq.nc"
  outfile = "/home/fernando/Documents/dados_netcdf/outarq.nc"
  nc%varname = "Band1"
  nc%lonname = "lon"
  nc%latname = "lat"
  call ncoords(ncfile, nc)

  call readgrid(ncfile, nc)

  do i = 1, nc%nlats
    do j = 1, nc%nlons
      if(nc%ncdata(i,j).ne.0) then
        write(*,*)i, j, nc%ncdata(i,j)
        nc%ncdata(i,j) = nf90_fill_float !nc%ncdata(i,j) * cos(2.4)
        write(*,*)i, j, nc%ncdata(i,j)
      end if
    end do
  end do
  call writegrid(outfile, nc)


  write(*,*) "lon: ", nc%nlons, "lat: ", nc%nlats
end program main
