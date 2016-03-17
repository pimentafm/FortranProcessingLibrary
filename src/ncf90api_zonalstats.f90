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
!Zonal Statistics =============================================================
!NetCDF(i,j)-> byte-byte
subroutine zonalstats_bb(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_byte), intent(in) :: mask
  type(nc2d_byte), intent(in) :: map
  type(zonal_byte) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_bb

!NetCDF(i,j)-> byte-short
subroutine zonalstats_bs(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_short), intent(in) :: mask
  type(nc2d_byte), intent(in) :: map
  type(zonal_byte) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_bs

!NetCDF(i,j)-> byte-int
subroutine zonalstats_bi(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_int), intent(in) :: mask
  type(nc2d_byte), intent(in) :: map
  type(zonal_byte) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_bi

!NetCDF(i,j)-> byte-float
subroutine zonalstats_bf(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_float), intent(in) :: mask
  type(nc2d_byte), intent(in) :: map
  type(zonal_byte) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_bf

!NetCDF(i,j)-> byte-double
subroutine zonalstats_bd(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_double), intent(in) :: mask
  type(nc2d_byte), intent(in) :: map
  type(zonal_byte) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_bd

!NetCDF(i,j)-> short-byte
subroutine zonalstats_sb(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_byte), intent(in) :: mask
  type(nc2d_short), intent(in) :: map
  type(zonal_short) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_sb

!NetCDF(i,j)-> short-short
subroutine zonalstats_ss(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_short), intent(in) :: mask
  type(nc2d_short), intent(in) :: map
  type(zonal_short) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_ss

!NetCDF(i,j)-> short-int
subroutine zonalstats_si(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_int), intent(in) :: mask
  type(nc2d_short), intent(in) :: map
  type(zonal_short) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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
    
    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_si

!NetCDF(i,j)-> short-float
subroutine zonalstats_sf(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_float), intent(in) :: mask
  type(nc2d_short), intent(in) :: map
  type(zonal_short) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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
    
    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_sf

!NetCDF(i,j)-> short-double
subroutine zonalstats_sd(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_double), intent(in) :: mask
  type(nc2d_short), intent(in) :: map
  type(zonal_short) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_sd

!NetCDF(i,j)-> int-byte
subroutine zonalstats_ib(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_byte), intent(in) :: mask
  type(nc2d_int), intent(in) :: map
  type(zonal_int) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_ib

!NetCDF(i,j)-> int-short
subroutine zonalstats_is(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_short), intent(in) :: mask
  type(nc2d_int), intent(in) :: map
  type(zonal_int) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_is

!NetCDF(i,j)-> int-int
subroutine zonalstats_ii(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_int), intent(in) :: mask
  type(nc2d_int), intent(in) :: map
  type(zonal_int) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_ii

!NetCDF(i,j)-> int-float
subroutine zonalstats_if(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_float), intent(in) :: mask
  type(nc2d_int), intent(in) :: map
  type(zonal_int) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_if

!NetCDF(i,j)-> int-double
subroutine zonalstats_id(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_double), intent(in) :: mask
  type(nc2d_int), intent(in) :: map
  type(zonal_int) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_id

!NetCDF(i,j)-> float-byte
subroutine zonalstats_fb(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_byte), intent(in) :: mask
  type(nc2d_float), intent(in) :: map
  type(zonal_float) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_fb

!NetCDF(i,j)-> float-short
subroutine zonalstats_fs(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_short), intent(in) :: mask
  type(nc2d_float), intent(in) :: map
  type(zonal_float) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_fs

!NetCDF(i,j)-> float-int
subroutine zonalstats_fi(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_int), intent(in) :: mask
  type(nc2d_float), intent(in) :: map
  type(zonal_float) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_fi

!NetCDF(i,j)-> float-float
subroutine zonalstats_ff(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_float), intent(in) :: mask
  type(nc2d_float), intent(in) :: map
  type(zonal_float) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_ff

!NetCDF(i,j)-> float-double
subroutine zonalstats_fd(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_double), intent(in) :: mask
  type(nc2d_float), intent(in) :: map
  type(zonal_float) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_fd

!NetCDF(i,j)-> double-byte
subroutine zonalstats_db(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_byte), intent(in) :: mask
  type(nc2d_double), intent(in) :: map
  type(zonal_double) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_db

!NetCDF(i,j)-> double-short
subroutine zonalstats_ds(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_short), intent(in) :: mask
  type(nc2d_double), intent(in) :: map
  type(zonal_double) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_ds

!NetCDF(i,j)-> double-int
subroutine zonalstats_di(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_int), intent(in) :: mask
  type(nc2d_double), intent(in) :: map
  type(zonal_double) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_di

!NetCDF(i,j)-> double-float
subroutine zonalstats_df(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_float), intent(in) :: mask
  type(nc2d_double), intent(in) :: map
  type(zonal_double) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_df

!NetCDF(i,j)-> double-double
subroutine zonalstats_dd(map, mask, classfile)
  character(*), optional, intent(in) :: classfile
  type(nc2d_double), intent(in) :: mask
  type(nc2d_double), intent(in) :: map
  type(zonal_double) :: zstats
  real(kind=double) :: sumquad
  integer(kind=8) :: nlines, i, j, k

!:Check if classfile is present -----------------------------------------------
  if(present(classfile))then
    !Open file
    open(100, file = classfile, status = 'old')

    !:Count file line numbers -------------------------------------------------
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

    !:Read zonal classes from file --------------------------------------------
    do i = 1, nlines
      read(100,*) zstats%zclass(i)
    end do

    !:Calculate statistics ----------------------------------------------------
    do k = 1, nlines
      zstats%zcount(k) = 0
      zstats%zsum(k) = 0
      zstats%zaverage(k) = 0
      zstats%zmin(k) = 0
      zstats%zmax(k) = 0
      zstats%zstdeviation(k) = 0
      zstats%zvariance(k) = 0
      sumquad = 0

      do i = 1, mask%nlons
        do j = 1, mask%nlats
          if(zstats%zclass(k).eq.mask%ncdata(j,i).and.map%ncdata(j,i).ne.map%f_value)then
            zstats%zcount(k) = zstats%zcount(k) + 1
            zstats%zsum(k) = zstats%zsum(k) + map%ncdata(j,i)
            if(map%ncdata(j,i).ne.map%f_value)then
              zstats%zmin(k) = min(map%ncdata(j,i), zstats%zmin(nlines))
              zstats%zmax(k) = max(map%ncdata(j,i), zstats%zmax(nlines))
              sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
            end if
          end if
        end do
      end do

      if(zstats%zcount(k).ne.0)then
        zstats%zstdeviation(k) = sqrt((sumquad-(zstats%zsum(k)*zstats%zsum(k))/&
                                       zstats%zcount(k))/(zstats%zcount(k)-1))
        zstats%zvariance(k) = zstats%zstdeviation(k)*zstats%zstdeviation(k)
        zstats%zaverage(k) = zstats%zsum(k)/zstats%zcount(k)
      end if
    end do
  !:Case classmap is not present ----------------------------------------------
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

    zstats%zcount(nlines) = 0
    zstats%zsum(nlines) = 0
    zstats%zaverage(nlines) = 0
    zstats%zmin(nlines) = 0
    zstats%zmax(nlines) = 0
    zstats%zstdeviation(nlines) = 0
    zstats%zvariance(nlines) = 0
    sumquad = 0

    !:Calculate statistics ----------------------------------------------------
    do i = 1, map%nlons
      do j = 1, map%nlats
        if(map%ncdata(j,i).ne.map%f_value)then
          zstats%zcount(nlines) = zstats%zcount(nlines) + 1
          zstats%zsum(nlines) = zstats%zsum(nlines) + map%ncdata(j,i)
          sumquad = sumquad + map%ncdata(j,i)*map%ncdata(j,i)
        end if
      end do
    end do
    zstats%zmin(nlines) = minval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    zstats%zmax(nlines) = maxval(map%ncdata, mask=map%ncdata.ne.map%f_value)
    if(zstats%zcount(nlines).ne.0)then
      zstats%zstdeviation(nlines) = sqrt((sumquad-(zstats%zsum(nlines)*zstats%zsum(nlines))/&
                                          zstats%zcount(nlines))/(zstats%zcount(nlines)-1))
      zstats%zvariance(nlines) = zstats%zstdeviation(nlines)*zstats%zstdeviation(nlines)
      zstats%zaverage(nlines) = zstats%zsum(nlines)/zstats%zcount(nlines)
    end if
  end if

  write(*,'(a8,a15,5a20)')"Class", "Count", "Sum", "Average", "Min", "Max", "Standard Deviation"
  do i = 1, nlines
    write(*,'(i8,i15,5f20.5)')zstats%zclass(i), zstats%zcount(i), zstats%zsum(i), &
         zstats%zaverage(i), zstats%zmin(i), zstats%zmax(i), zstats%zstdeviation(i)
  end do
end subroutine zonalstats_dd