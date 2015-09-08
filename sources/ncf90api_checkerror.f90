!:========================================================================
! This file is part of f90NetCDF API (Fortran 90 API for Netcdf).

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

!:======= Error Handler Module ===========================================
!:======= Check for NetCDF errors
!======================================
subroutine check(ncstatus)
  integer, intent(in) :: ncstatus

  if(ncstatus.ne.nf90_noerr)then
    write(*,*)trim(adjustl(nf90_strerror(ncstatus)))
  end if
end subroutine check

subroutine checktype(ncstatus, rvar, dvar)
  integer, intent(in) :: ncstatus, dvar, rvar
  character(len=8) :: dtype

  select case (dvar)
      case (6)
        dtype = "DOUBLE"
      case (5)
        dtype = "FLOAT"
      case (4)
        dtype = "INTEGER"
      case (3)
        dtype = "SHORT"
      case (1)
        dtype = "BYTE"
  end select

  if(ncstatus.ne.nf90_noerr)then
    write(*,*)trim(adjustl(nf90_strerror(ncstatus)))
    write(*,*)"\033[31m Check data type of the input file and data type declared! \033[0m"
    select case (rvar)
      case (6)
        write(*,*)"Input type: DOUBLE | Declared type: "//trim(adjustl(dtype))//"!"
      case (5)
        write(*,*)"Input type: FLOAT | Declared type: "//trim(adjustl(dtype))//"!"
      case (4)
        write(*,*)"Input type: INTEGER | Declared type: "//trim(adjustl(dtype))//"!"
      case (3)
        write(*,*)"Input type: SHORT | Declared type: "//trim(adjustl(dtype))//"!"
      case (1)
        write(*,*)"Input type: BYTE | Declared type: "//trim(adjustl(dtype))//"!"
    end select
  end if
end subroutine checktype
