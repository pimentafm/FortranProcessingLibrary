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

!Date and Time subroutine

 subroutine fdate_time(sysdatetime)
   integer(kind=4) date(3), systime(3)
   integer :: i
   character(len=3), dimension(12) :: month
   character(len=3) :: sysmonth
   character(len=2) :: strday
   character(len=4) :: stryear
   character(len=2) :: strhour
   character(len=2) :: strmin
   character(len=2) :: strsec
   character(len=21), intent(out) :: sysdatetime


   month = (/'Jan','Feb','Mar','Apr','May','Jun', 'Jul','Aug','Sep', &
             'Oct','Nov','Dec'/)

   call idate(date)        !date(1) = day, date(2) = month, date(3) = year
   call itime(systime)     !systime(1) = hour, systime(2) = minute, systime(3) = second

   do i = 1, 12
     if(date(2).eq.i) sysmonth = month(i)
   end do

   write (strday, '(i2)') date(1)
   write (stryear, '(i4)') date(3)
   write (strhour, '(i2.2)') systime(1)
   write (strmin, '(i2)') systime(2)
   write (strsec, '(i2)') systime(3)

   sysdatetime = sysmonth//" "//strday//" "//stryear//" "//strhour//':'//strmin//':'//strsec
end subroutine fdate_time

