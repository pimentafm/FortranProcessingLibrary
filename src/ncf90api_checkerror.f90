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

!:======= Error Handler Module ================================================
!:======= ShellScript Colours

!:RED -> fatal errors
!:ORANGE -> warnning errors
!:BLUE -> help

!Colour	  Regular       Bold        Underline   High        BoldHigh    Background  High Intensity
!                                               Intensity   Intens                  Backgrounds

!Black	  \e[0;30m      \e[1;30m    \e[4;30m    \e[0;90m    \e[1;90m    \e[40m      \e[0;100m
!Red	  \e[0;31m      \e[1;31m    \e[4;31m    \e[0;91m    \e[1;91m    \e[41m      \e[0;101m';
!Green	  \e[0;32m      \e[1;32m    \e[4;32m    \e[0;92m    \e[1;92m    \e[42m      \e[0;102m';
!Yellow	  \e[0;33m      \e[1;33m    \e[4;33m    \e[0;93m    \e[1;93m    \e[43m      \e[0;103m';
!Blue	  \e[0;34m      \e[1;34m    \e[4;34m    \e[0;94m    \e[1;94m    \e[44m      \e[0;104m';
!Purple	  \e[0;35m      \e[1;35m    \e[4;35m    \e[0;95m    \e[1;95m    \e[45m      \e[0;105m';
!Cyan	  \e[0;36m      \e[1;36m    \e[4;36m    \e[0;96m    \e[1;96m    \e[46m      \e[0;106m';
!White	  \e[0;37m      \e[1;37m    \e[4;37m    \e[0;97m    \e[1;97m    \e[47m      \e[0;107m';
!Orange   \e[38;5;166m
!==============================================================================

!Fortran symbols
!achar(27) ^[
!achar(59) ;

!General check
subroutine checkerror(ncstatus)
  integer, intent(in) :: ncstatus
  if(ncstatus.ne.nf90_noerr)then
    write(*,*) achar(27)//"[1"//achar(59)// &
               "91m"//trim(adjustl(nf90_strerror(ncstatus)))//achar(27)//"[0m"
    stop
  end if
end subroutine checkerror

!Check nf90_inq_varid and nf90_inq_dimid -> ncf90api_griddims.f90 =============
!These subroutine was not added in ncf90api_interfaces.f90 because it's ambiguous with checkatt.
subroutine checkvarid(ncstatus, varname)
  integer, intent(in) :: ncstatus
  character(*), intent(in) :: varname
  if(ncstatus.ne.nf90_noerr)then
    write(*,*) achar(27)//"[1"//achar(59)// &
               "91m"//trim(adjustl(nf90_strerror(ncstatus)))//achar(27)//"[0m"
    write(*,*) achar(27)//"[0"//achar(59)// &
               "91m        "//trim(adjustl(varname))//" does not exist"//achar(27)//"[0m"
    write(*,*) achar(27)//"[0"//achar(59)// &
               "94mAdd the correct name of the variable."//achar(27)//"[0m"
    stop
  end if
end subroutine checkvarid

subroutine checkdimid(ncstatus, dimname)
  integer, intent(in) :: ncstatus
  character(*), intent(in) :: dimname
  if(ncstatus.ne.nf90_noerr)then
    write(*,*) achar(27)//"[1"//achar(59)// &
               "91m"//trim(adjustl(nf90_strerror(ncstatus)))//achar(27)//"[0m"
    write(*,*) achar(27)//"[0"//achar(59)// &
               "91m        "//trim(adjustl(dimname))//" does not exist!"//achar(27)//"[0m"
    write(*,*) achar(27)//"[0"//achar(59)// &
               "94m        Add the correct name of the dimension."//achar(27)//"[0m"
    stop
  end if
end subroutine checkdimid

!Check nf90_get_var -> ncf90api_readgrid.f90 ===================================
subroutine checktype(ncstatus, rvar, dvar, ifile)
  integer, intent(in) :: ncstatus, rvar
  character(*), intent(in) :: dvar, ifile
  character(len(dvar)) :: dvaraux

  if(rvar.eq.6) dvaraux = "DOUBLE"
  if(rvar.eq.5) dvaraux = "FLOAT"
  if(rvar.eq.4) dvaraux = "INTEGER"
  if(rvar.eq.3) dvaraux = "SHORT"
  if(rvar.eq.1) dvaraux = "BYTE"

  if(dvar.ne.dvaraux)then !.and.ncstatus.eq.nf90_noerr
    write(*,*) trim(adjustl(nf90_strerror(ncstatus)))
    write(*,*) achar(27)//"[1"//achar(59)// &
               "91m Check data type of the input file and data type declared!" &
               //achar(27)//"[0m"
    select case (rvar)
      case (6)
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "91m WARNING: Input type: DOUBLE | Declared type: " &
                   //trim(adjustl(dvar))//achar(27)//"[0m"
      case (5)
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "91m WARNING: Input type: FLOAT | Declared type: " &
                   //trim(adjustl(dvar))//achar(27)//"[0m"
      case (4)
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "91m WARNING: Input type: INTEGER | Declared type: " &
                   //trim(adjustl(dvar))//achar(27)//"[0m"
      case (3)
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "91m WARNING: Input type: SHORT | Declared type: " &
                   //trim(adjustl(dvar))//achar(27)//"[0m"
      case (1)
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "91m WARNING: Input type: BYTE | Declared type: " &
                   //trim(adjustl(dvar))//achar(27)//"[0m"
    end select
    call system(" echo "//trim(adjustl(ifile))//" | sed 's/.*\// File: /'")
    stop
  end if
end subroutine checktype

!Check nf90_get_att -> ncf90api_readgrid.f90 ==================================
subroutine checkatt(ncstatus, uname, ifile)
  integer, intent(in) :: ncstatus
  character(*), intent(in) :: uname, ifile
  
  if(ncstatus.ne.nf90_noerr)then
    if(uname.eq."_FillValue")then
      write(*,*) achar(27)//"[1"//achar(59)// &
                 "91m FAULT: Declare _FillValue in your NetCDF!" &
                 //achar(27)//"[0m"  
      write(*,*) achar(27)//"[1"//achar(59)// &
                 "94m Use the GDAL Library to add _FillValue into your file!" &
                 //achar(27)//"[0m"
      write(*,*) achar(27)//"[0"//achar(59)// &
                 "94m  Try this: gdal_translate -of netcdf -a_nodata <nodata_value> input.nc output.nc" &
                 //achar(27)//"[0m"  
      call system(" echo "//trim(adjustl(ifile))//" | sed 's/.*\// File: /'")
      stop
      else
        write(*,*)trim(adjustl(nf90_strerror(ncstatus)))
        write(*,*) achar(27)//"[38"//achar(59)//"5"//achar(59)// &
                   "166m WARNING: Declare "//trim(adjustl(uname))//" in your NetCDF!" &
                   //achar(27)//"[0m"
        write(*,*) achar(27)//"[1"//achar(59)// &
                   "94m You can set "//trim(adjustl(uname))//" into your NetCDF file" &
                   //achar(27)//"[0m"
        write(*,*) achar(27)//"[1"//achar(59)//"94m or set it into your code!" &
                   //achar(27)//"[0m"
        write(*,*) achar(27)//"[0"//achar(59)//"94m       Example: "//achar(27)//"[0m"
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "94m       If you declared type(nc2d_<type>) :: yourdata"//achar(27)//"[0m"
        write(*,*) achar(27)//"[0"//achar(59)// &
                   "94m         Set in your file: yourdata%"//trim(adjustl(uname))// &
                   " = units (degrees, km, ...)"//achar(27)//"[0m"
        call system(" echo "//trim(adjustl(ifile))//" | sed 's/.*\// File: /'")
    end if
  end if
end subroutine checkatt
!==============================================================================
