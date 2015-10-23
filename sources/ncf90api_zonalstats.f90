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

subroutine zonalstats_b(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_byte), optional, intent(in) :: mask
  type(nc2d_float), intent(in) :: map
  type(zonal) :: zstats
  integer(kind=4) :: nlines, i, j, k

  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    nlines = 0
    do
      read(100, *, end=101)
      nlines = nlines +1
    end do
101 continue
    rewind(100)

    allocate(zstats%zclass(nlines))
    allocate(zstats%zcount(nlines))
    allocate(zstats%zsum(nlines))
    allocate(zstats%zaverage(nlines))
    allocate(zstats%zmin(nlines))
    allocate(zstats%zmax(nlines))
    allocate(zstats%zstdeviation(nlines))
    allocate(zstats%zvariance(nlines))

    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do
  else
    nlines = 1
    allocate(zstats%zclass(nlines))
    allocate(zstats%zcount(nlines))
    allocate(zstats%zsum(nlines))
    allocate(zstats%zaverage(nlines))
    allocate(zstats%zmin(nlines))
    allocate(zstats%zmax(nlines))
    allocate(zstats%zstdeviation(nlines))
    allocate(zstats%zvariance(nlines))
  end if

  if(present(mask))then
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
          end if
        end do
      end do
      if(zstats%zcount(k).ne.0) zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
    end do
  else
    zstats%zcount(nlines) = 0    !OK
    zstats%zsum(nlines) = 0      !OK
    zstats%zaverage(nlines) = 0  !OK
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
        end if
      end do
    end do
    if(zstats%zcount(nlines).ne.0) zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
  end if
  write(*,'(a8,3a20)')"Class", "Count", "Sum", "Average"
  do i = 1, nlines
    write(*,'(i8,i20,f20.6, f20.6, f20.6, f20.6)')zstats%zclass(i), zstats%zcount(i), &
    zstats%zsum(i), zstats%zaverage(i)
  end do
end subroutine zonalstats_b
