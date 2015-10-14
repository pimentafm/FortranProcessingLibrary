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

!:======= Error Handler Module ===========================================
!:======= Check for NetCDF errors
!=========================================================================

!General check
subroutine checkerror(ncstatus)
  integer, intent(in) :: ncstatus
  if(ncstatus.ne.nf90_noerr)then
    call system('echo -e "\e[1;91m'//trim(adjustl(nf90_strerror(ncstatus)))//'\e[0m\n"')
    stop
  end if
end subroutine checkerror

     !TODO: Add checker to set_fillValue subroutines and return correct usage
     !      Add checkversion function

!Check nf90_get_var ======================================================
subroutine checktype(ncstatus, rvar, dvar)
  integer, intent(in) :: ncstatus, rvar
  character(*), intent(in) :: dvar
  character(len=8) :: dtype

  if(ncstatus.ne.nf90_noerr)then
    write(*,*)trim(adjustl(nf90_strerror(ncstatus)))
    call system('echo -e "\033[1;91m Check data type of the input file and data type declared!\033[0m"')
    select case (rvar)
      case (6)
        call system('echo -e "\e[0;91m WARNING: Input type: DOUBLE | Declared type: '//trim(adjustl(dvar))//'\e[0m\n"')
      case (5)
        call system('echo -e "\e[0;91m WARNING: Input type: FLOAT | Declared type: '//trim(adjustl(dvar))//'\e[0m\n"')
      case (4)
        call system('echo -e "\e[0;91m WARNING: Input type: INTEGER | Declared type: '//trim(adjustl(dvar))//'\e[0m\n"')
      case (3)
        call system('echo -e "\e[0;91m WARNING: Input type: SHORT | Declared type: '//trim(adjustl(dvar))//'\e[0m\n"')
      case (1)
        call system('echo -e "\e[0;91m WARNING: Input type: BYTE | Declared type: '//trim(adjustl(dvar))//'\e[0m\n"')
    end select
    stop
  end if
end subroutine checktype

!Check nf90_get_att ======================================================
subroutine checkatt(ncstatus, uname)
  integer, intent(in) :: ncstatus
  character(*), intent(in) :: uname
  if(ncstatus.ne.nf90_noerr)then
    if(uname.eq."_FillValue")then
      call system('echo -e "\033[1;91m FAULT: Declare _FillValue in your NetCDF!\e[0m\n"')
      stop
      else
        write(*,*)trim(adjustl(nf90_strerror(ncstatus)))
        call system('echo -e "\e[38;5;166m WARNING: Declare '//trim(adjustl(uname))//' in your NetCDF!\e[0m\n"')
    end if
  end if
end subroutine checkatt
!=========================================================================


