!:========================================================================
! This file is part of Fortran NetCDF Tools.

! Copyright (C) 2015 Fernando Martins Pimenta

! f90NetCDF is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! f90NetCDF is distributed in the hope that it will be useful,
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
! Data: July 07, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:========================================================================

!:======= Error Handler Module ===========================================
!:======= Check for NetCDF errors
!======================================
subroutine check(ncstatus)
  integer, intent(in) :: ncstatus
  if(ncstatus.ne.nf90_noerr)then
    write(*,*)trim(adjustl(nf90_strerror(ncstatus)))
  end if
end subroutine check
