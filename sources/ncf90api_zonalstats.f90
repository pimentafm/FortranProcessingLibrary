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

!Calculates Zonal Statistics

subroutine zonalstats_b(classfile, mask, map)
    type(nc2d_byte) :: mask
    type(nc2d_double) :: map
    real(kind=8), dimension(:,:), allocatable :: classarray
    character(*) :: classfile
    integer(kind=4) :: nlines, i, j, k

    !Open file
    open(100, file = classfile, status = 'old')

    nlines = 0
    do
      read(100, *, end=101)
      nlines = nlines +1
    end do
101 continue
    rewind(100)

    allocate(classarray(nlines,3))

    do i = 1, nlines
      read(100,*) classarray(i,1)
    end do

    do k = 1, nlines
      classarray(k,2) = 0
      classarray(k,3) = 0
      do i = 1, mask%nlons
        do j = 1, mask%nlats
           if(classarray(k,1).eq.mask%ncdata(j,i))then
             classarray(k,2) = classarray(k,2) + 1
             classarray(k,3) = classarray(k,3) + mask%ncdata(j,i)
           end if
        end do
      end do
    end do

    write(*,*)"Class       Count         Sum "
    do i = 1, nlines
      write(*,'(f3.0,f10.0,f20.6)')classarray(i,1), classarray(i,2), classarray(i,3)
    end do

end subroutine zonalstats_b

!-------------------------------------------------

!Count
!Sum
!Average
!Min
!Max
!Range
!Standard Deviation
!Variance


