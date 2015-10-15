!:========================================================================
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

!:========================================================================
!About Author:
!Student of Surveying and Cartographic Engineering
! Federal University of Viçosa - Brazil

!Bachelor of Biosystems Engineer
! Federal University of São João del-Rei - Brazil

! Research Group on Atmosphere-Biosphere Interaction
! Federal University of Viçosa
! Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:========================================================================

!:==================== A Very Simple Test Program ========================
program main
  use ncf90api
  implicit none

  type (nc2d_byte):: states
  type (nc2d_double) :: lu

  integer(kind=intgr) :: i, j

  character(100) :: lufile, outfile, statesfile

  lufile = "/home/fernando/Documents/dados_nc_test/lucult_final.nc"

  statesfile = "/home/fernando/Documents/dados_nc_test/maskestados.nc"

  outfile = "/home/fernando/Documents/dados_nc_test/newtest.nc"

  lu%varname = "landuse"
  lu%lonname = "lon"
  lu%latname = "lat"


  states%varname = "Band1"
  states%lonname = "lon"
  states%latname = "lat"

  !nc%long_name = "nome do mapa"

  !call ncoords(ncfile, nc)

  call readgrid(lufile, lu)
  call readgrid(statesfile, states)

!  do i = 1, nc%nlats
!    do j = 1, nc%nlons
!      if(nc%ncdata(i,j).ne.0) then
!        write(*,*)i, j, nc%ncdata(i,j)
!        nc%ncdata(i,j) = nc%ncdata(i,j) * cos(2.4) !nf90_fill_float !
!        write(*,*)i, j, nc%ncdata(i,j)
!      end if
!    end do
!  end do

  call setfill_bymask(states, lu)

  call writegrid(outfile, lu)
  call system('ncview '//trim(adjustl(outfile)))

  write(*,*)"NC INFO STATES-------------------------"
  write(*,*)"nc->long_name ", states%long_name
  write(*,*)"nc->lonname   ", states%lonname
  write(*,*)"nc->latname   ", states%latname
  write(*,*)"nc->varname   ", states%varname
  write(*,*)"nc->nlons     ", states%nlons
  write(*,*)"nc->nlats     ", states%nlats
  write(*,*)"nc->vartype   ", states%vartype, "-> 6_d, 5_f, 4_i, 3_s, 1_b"
  write(*,*)" "
  write(*,*)"nc->varunits  ",states%varunits
  write(*,*)"nc->lonunits  ",states%lonunits
  write(*,*)"nc->latunits  ",states%latunits
  write(*,*)"nc->f_value   ",states%f_value
  write(*,*)" "

    write(*,*)"NC INFO LU-------------------------"
  write(*,*)"nc->long_name ", lu%long_name
  write(*,*)"nc->lonname   ", lu%lonname
  write(*,*)"nc->latname   ", lu%latname
  write(*,*)"nc->varname   ", lu%varname
  write(*,*)"nc->nlons     ", lu%nlons
  write(*,*)"nc->nlats     ", lu%nlats
  write(*,*)"nc->vartype   ", lu%vartype, "-> 6_d, 5_f, 4_i, 3_s, 1_b"
  write(*,*)" "
  write(*,*)"nc->varunits  ",lu%varunits
  write(*,*)"nc->lonunits  ",lu%lonunits
  write(*,*)"nc->latunits  ",lu%latunits
  write(*,*)"nc->f_value   ",lu%f_value
  write(*,*)" "

  write(*,*)"KIND INFO-----------------------"
  write(*,*)"DOUBLE->:     ", C_DOUBLE, double
  write(*,*)"INT->:        ",C_INT, intgr
  write(*,*)"FLOAT->:      ",C_FLOAT, float
  write(*,*)"SHORT->:      ",C_SHORT, short
  write(*,*)"BYTE->:       ",C_SIGNED_CHAR, byte


  write(*,*)" "

  write(*,*)"FILL INFO-----------------------"
  write(*,*)"Byte:         ", nf90_fill_byte
  write(*,*)"Short:        ", nf90_fill_short
  write(*,*)"Integer:      ", nf90_fill_int
  write(*,*)"Float:        ", nf90_fill_float
  write(*,*)"Double:       ", nf90_fill_double

  write(*,*)"Pi: ",pi
  write(*,*)"Earth Radius: ",earth_radius
  write(*,*)"Acceleration of Gravity: ",acc_gravity
  write(*,*)"Boltzman: ",boltzman
  write(*,*)"Speed of light: ",speed_of_light
end program main
