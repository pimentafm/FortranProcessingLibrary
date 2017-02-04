!:=============================================================================
! This file is part of FPL (Fortran Processing Library).

! Copyright (C) 2015 Fernando Martins Pimenta

! FPL is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! FPL is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with FPL.  If not, see <http://www.gnu.org/licenses/>.

!:=============================================================================
! About Author:
! Fernando Martins Pimenta
!  Student of Surveying and Cartographic Engineering
!  Federal University of Viçosa - Brazil

!  Bachelor of Biosystems Engineer
!  Federal University of São João del-Rei - Brazil

!  Research Group on Atmosphere-Biosphere Interaction
!  Federal University of Viçosa
!  Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:=============================================================================

!NetCDF <var byte> (lon <float>, lat <float>)
subroutine gengrid2d_byte_llf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_byte_llf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_byte_llf

!NetCDF <var short> (lon <float>, lat <float>)
subroutine gengrid2d_short_llf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_short_llf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_short_llf

!NetCDF <var int> (lon <float>, lat <float>)
subroutine gengrid2d_int_llf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_int_llf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_int_llf

!NetCDF <var float> (lon <float>, lat <float>)
subroutine gengrid2d_float_llf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_float_llf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_float_llf

!NetCDF <var double> (lon <float>, lat <float>)
subroutine gengrid2d_double_llf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_double_llf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_double_llf

!NetCDF <var byte> (lon <double>, lat <double>)
subroutine gengrid2d_byte_lld(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_byte_lld) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_byte_lld

!NetCDF <var short> (lon <double>, lat <double>)
subroutine gengrid2d_short_lld(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_short_lld) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_short_lld

!NetCDF <var int> (lon <double>, lat <double>)
subroutine gengrid2d_int_lld(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_int_lld) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_int_lld

!NetCDF <var float> (lon <double>, lat <double>)
subroutine gengrid2d_float_lld(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_float_lld) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_float_lld

!NetCDF <var double> (lon <double>, lat <double>)
subroutine gengrid2d_double_lld(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc2d_double_lld) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(2) :: dimsizes, ids
  character(len=100), dimension(2) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  
  ids = (/ 2, 1 /)
  dimsizes = (/ idata%nlats, idata%nlons /)
  dimnames = (/ idata%latname, idata%lonname /)
  dimunits = (/ idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid2d_double_lld

!NetCDF <var byte> (lon <float>, lat <float>, time <int>)
subroutine gengrid3d_byte_llf_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_byte_llf_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_byte_llf_ti

!NetCDF <var short> (lon <float>, lat <float>, time <int>)
subroutine gengrid3d_short_llf_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_short_llf_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_short_llf_ti

!NetCDF <var int> (lon <float>, lat <float>, time <int>)
subroutine gengrid3d_int_llf_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_int_llf_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_int_llf_ti

!NetCDF <var float> (lon <float>, lat <float>, time <int>)
subroutine gengrid3d_float_llf_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_float_llf_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_float_llf_ti

!NetCDF <var double> (lon <float>, lat <float>, time <int>)
subroutine gengrid3d_double_llf_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_double_llf_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_double_llf_ti

!NetCDF <var byte> (lon <double>, lat <double>, time <int>)
subroutine gengrid3d_byte_lld_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_byte_lld_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_byte_lld_ti

!NetCDF <var short> (lon <double>, lat <double>, time <int>)
subroutine gengrid3d_short_lld_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_short_lld_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_short_lld_ti

!NetCDF <var int> (lon <double>, lat <double>, time <int>)
subroutine gengrid3d_int_lld_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_int_lld_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_int_lld_ti

!NetCDF <var float> (lon <double>, lat <double>, time <int>)
subroutine gengrid3d_float_lld_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_float_lld_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_float_lld_ti

!NetCDF <var double> (lon <double>, lat <double>, time <int>)
subroutine gengrid3d_double_lld_ti(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_double_lld_ti) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_double_lld_ti

!NetCDF <var byte> (lon <float>, lat <float>, time <float>)
subroutine gengrid3d_byte_llf_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_byte_llf_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_byte_llf_tf

!NetCDF <var short> (lon <float>, lat <float>, time <float>)
subroutine gengrid3d_short_llf_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_short_llf_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_short_llf_tf

!NetCDF <var int> (lon <float>, lat <float>, time <float>)
subroutine gengrid3d_int_llf_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_int_llf_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_int_llf_tf

!NetCDF <var float> (lon <float>, lat <float>, time <float>)
subroutine gengrid3d_float_llf_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_float_llf_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_float_llf_tf

!NetCDF <var double> (lon <float>, lat <float>, time <float>)
subroutine gengrid3d_double_llf_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_double_llf_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_double_llf_tf

!NetCDF <var byte> (lon <double>, lat <double>, time <float>)
subroutine gengrid3d_byte_lld_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_byte_lld_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_byte_lld_tf

!NetCDF <var short> (lon <double>, lat <double>, time <float>)
subroutine gengrid3d_short_lld_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_short_lld_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_short_lld_tf

!NetCDF <var int> (lon <double>, lat <double>, time <float>)
subroutine gengrid3d_int_lld_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_int_lld_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_int_lld_tf

!NetCDF <var float> (lon <double>, lat <double>, time <float>)
subroutine gengrid3d_float_lld_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_float_lld_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_float_lld_tf

!NetCDF <var double> (lon <double>, lat <double>, time <float>)
subroutine gengrid3d_double_lld_tf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_double_lld_tf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_double_lld_tf

!NetCDF <var byte> (lon <float>, lat <float>, time <double>)
subroutine gengrid3d_byte_llf_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_byte_llf_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_byte_llf_td

!NetCDF <var short> (lon <float>, lat <float>, time <double>)
subroutine gengrid3d_short_llf_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_short_llf_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_short_llf_td

!NetCDF <var int> (lon <float>, lat <float>, time <double>)
subroutine gengrid3d_int_llf_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_int_llf_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_int_llf_td

!NetCDF <var float> (lon <float>, lat <float>, time <double>)
subroutine gengrid3d_float_llf_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_float_llf_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_float_llf_td

!NetCDF <var double> (lon <float>, lat <float>, time <double>)
subroutine gengrid3d_double_llf_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_double_llf_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_double_llf_td

!NetCDF <var byte> (lon <double>, lat <double>, time <double>)
subroutine gengrid3d_byte_lld_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_byte_lld_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_byte_lld_td

!NetCDF <var short> (lon <double>, lat <double>, time <double>)
subroutine gengrid3d_short_lld_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_short_lld_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_short_lld_td

!NetCDF <var int> (lon <double>, lat <double>, time <double>)
subroutine gengrid3d_int_lld_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_int_lld_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_int_lld_td

!NetCDF <var float> (lon <double>, lat <double>, time <double>)
subroutine gengrid3d_float_lld_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_float_lld_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_float_lld_td

!NetCDF <var double> (lon <double>, lat <double>, time <double>)
subroutine gengrid3d_double_lld_td(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc3d_double_lld_td) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(3) :: dimsizes, ids
  character(len=100), dimension(3) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))

  ids = (/ 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))
  
  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid3d_double_lld_td

!NetCDF <var byte> (lon <float>, lat <float>, time <int>, level <int>)
subroutine gengrid4d_byte_llf_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_llf_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_llf_ti_li

!NetCDF <var short> (lon <float>, lat <float>, time <int>, level <int>)
subroutine gengrid4d_short_llf_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_llf_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_llf_ti_li

!NetCDF <var int> (lon <float>, lat <float>, time <int>, level <int>)
subroutine gengrid4d_int_llf_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_llf_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_llf_ti_li

!NetCDF <var float> (lon <float>, lat <float>, time <int>, level <int>)
subroutine gengrid4d_float_llf_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_llf_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_llf_ti_li

!NetCDF <var double> (lon <float>, lat <float>, time <int>, level <int>)
subroutine gengrid4d_double_llf_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_llf_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_llf_ti_li

!NetCDF <var byte> (lon <double>, lat <double>, time <int>, level <int>)
subroutine gengrid4d_byte_lld_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_lld_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_lld_ti_li

!NetCDF <var short> (lon <double>, lat <double>, time <int>, level <int>)
subroutine gengrid4d_short_lld_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_lld_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_lld_ti_li

!NetCDF <var int> (lon <double>, lat <double>, time <int>, level <int>)
subroutine gengrid4d_int_lld_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_lld_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_lld_ti_li

!NetCDF <var float> (lon <double>, lat <double>, time <int>, level <int>)
subroutine gengrid4d_float_lld_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_lld_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_lld_ti_li

!NetCDF <var double> (lon <double>, lat <double>, time <int>, level <int>)
subroutine gengrid4d_double_lld_ti_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_lld_ti_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_lld_ti_li

!NetCDF <var byte> (lon <float>, lat <float>, time <float>, level <int>)
subroutine gengrid4d_byte_llf_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_llf_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_llf_tf_li

!NetCDF <var short> (lon <float>, lat <float>, time <float>, level <int>)
subroutine gengrid4d_short_llf_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_llf_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_llf_tf_li

!NetCDF <var int> (lon <float>, lat <float>, time <float>, level <int>)
subroutine gengrid4d_int_llf_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_llf_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_llf_tf_li

!NetCDF <var float> (lon <float>, lat <float>, time <float>, level <int>)
subroutine gengrid4d_float_llf_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_llf_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_llf_tf_li

!NetCDF <var double> (lon <float>, lat <float>, time <float>, level <int>)
subroutine gengrid4d_double_llf_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_llf_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_llf_tf_li

!NetCDF <var byte> (lon <double>, lat <double>, time <float>, level <int>)
subroutine gengrid4d_byte_lld_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_lld_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_lld_tf_li

!NetCDF <var short> (lon <double>, lat <double>, time <float>, level <int>)
subroutine gengrid4d_short_lld_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_lld_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_lld_tf_li

!NetCDF <var int> (lon <double>, lat <double>, time <float>, level <int>)
subroutine gengrid4d_int_lld_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_lld_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_lld_tf_li

!NetCDF <var float> (lon <double>, lat <double>, time <float>, level <int>)
subroutine gengrid4d_float_lld_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_lld_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_lld_tf_li

!NetCDF <var double> (lon <double>, lat <double>, time <float>, level <int>)
subroutine gengrid4d_double_lld_tf_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_lld_tf_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_lld_tf_li

!NetCDF <var byte> (lon <float>, lat <float>, time <double>, level <int>)
subroutine gengrid4d_byte_llf_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_llf_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_llf_td_li

!NetCDF <var short> (lon <float>, lat <float>, time <double>, level <int>)
subroutine gengrid4d_short_llf_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_llf_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_llf_td_li

!NetCDF <var int> (lon <float>, lat <float>, time <double>, level <int>)
subroutine gengrid4d_int_llf_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_llf_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_llf_td_li

!NetCDF <var float> (lon <float>, lat <float>, time <double>, level <int>)
subroutine gengrid4d_float_llf_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_llf_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_llf_td_li

!NetCDF <var double> (lon <float>, lat <float>, time <double>, level <int>)
subroutine gengrid4d_double_llf_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_llf_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_llf_td_li

!NetCDF <var byte> (lon <double>, lat <double>, time <double>, level <int>)
subroutine gengrid4d_byte_lld_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_lld_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_lld_td_li

!NetCDF <var short> (lon <double>, lat <double>, time <double>, level <int>)
subroutine gengrid4d_short_lld_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_lld_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_lld_td_li

!NetCDF <var int> (lon <double>, lat <double>, time <double>, level <int>)
subroutine gengrid4d_int_lld_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_lld_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_lld_td_li

!NetCDF <var float> (lon <double>, lat <double>, time <double>, level <int>)
subroutine gengrid4d_float_lld_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_lld_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_lld_td_li

!NetCDF <var double> (lon <double>, lat <double>, time <double>, level <int>)
subroutine gengrid4d_double_lld_td_li(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_lld_td_li) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_lld_td_li

!NetCDF <var byte> (lon <float>, lat <float>, time <int>, level <float>)
subroutine gengrid4d_byte_llf_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_llf_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_llf_ti_lf

!NetCDF <var short> (lon <float>, lat <float>, time <int>, level <float>)
subroutine gengrid4d_short_llf_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_llf_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_llf_ti_lf

!NetCDF <var int> (lon <float>, lat <float>, time <int>, level <float>)
subroutine gengrid4d_int_llf_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_llf_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_llf_ti_lf

!NetCDF <var float> (lon <float>, lat <float>, time <int>, level <float>)
subroutine gengrid4d_float_llf_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_llf_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_llf_ti_lf

!NetCDF <var double> (lon <float>, lat <float>, time <int>, level <float>)
subroutine gengrid4d_double_llf_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_llf_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_llf_ti_lf

!NetCDF <var byte> (lon <double>, lat <double>, time <int>, level <float>)
subroutine gengrid4d_byte_lld_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_lld_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_lld_ti_lf

!NetCDF <var short> (lon <double>, lat <double>, time <int>, level <float>)
subroutine gengrid4d_short_lld_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_lld_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_lld_ti_lf

!NetCDF <var int> (lon <double>, lat <double>, time <int>, level <float>)
subroutine gengrid4d_int_lld_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_lld_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_lld_ti_lf

!NetCDF <var float> (lon <double>, lat <double>, time <int>, level <float>)
subroutine gengrid4d_float_lld_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_lld_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_lld_ti_lf

!NetCDF <var double> (lon <double>, lat <double>, time <int>, level <float>)
subroutine gengrid4d_double_lld_ti_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_lld_ti_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_lld_ti_lf

!NetCDF <var byte> (lon <float>, lat <float>, time <float>, level <float>)
subroutine gengrid4d_byte_llf_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_llf_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_llf_tf_lf

!NetCDF <var short> (lon <float>, lat <float>, time <float>, level <float>)
subroutine gengrid4d_short_llf_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_llf_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_llf_tf_lf

!NetCDF <var int> (lon <float>, lat <float>, time <float>, level <float>)
subroutine gengrid4d_int_llf_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_llf_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_llf_tf_lf

!NetCDF <var float> (lon <float>, lat <float>, time <float>, level <float>)
subroutine gengrid4d_float_llf_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_llf_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_llf_tf_lf

!NetCDF <var double> (lon <float>, lat <float>, time <float>, level <float>)
subroutine gengrid4d_double_llf_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_llf_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_llf_tf_lf

!NetCDF <var byte> (lon <double>, lat <double>, time <float>, level <float>)
subroutine gengrid4d_byte_lld_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_lld_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_lld_tf_lf

!NetCDF <var short> (lon <double>, lat <double>, time <float>, level <float>)
subroutine gengrid4d_short_lld_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_lld_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_lld_tf_lf

!NetCDF <var int> (lon <double>, lat <double>, time <float>, level <float>)
subroutine gengrid4d_int_lld_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_lld_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_lld_tf_lf

!NetCDF <var float> (lon <double>, lat <double>, time <float>, level <float>)
subroutine gengrid4d_float_lld_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_lld_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_lld_tf_lf

!NetCDF <var double> (lon <double>, lat <double>, time <float>, level <float>)
subroutine gengrid4d_double_lld_tf_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_lld_tf_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_lld_tf_lf

!NetCDF <var byte> (lon <float>, lat <float>, time <double>, level <float>)
subroutine gengrid4d_byte_llf_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_llf_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_llf_td_lf

!NetCDF <var short> (lon <float>, lat <float>, time <double>, level <float>)
subroutine gengrid4d_short_llf_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_llf_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_llf_td_lf

!NetCDF <var int> (lon <float>, lat <float>, time <double>, level <float>)
subroutine gengrid4d_int_llf_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_llf_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_llf_td_lf

!NetCDF <var float> (lon <float>, lat <float>, time <double>, level <float>)
subroutine gengrid4d_float_llf_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_llf_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_llf_td_lf

!NetCDF <var double> (lon <float>, lat <float>, time <double>, level <float>)
subroutine gengrid4d_double_llf_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_llf_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=float) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_llf_td_lf

!NetCDF <var byte> (lon <double>, lat <double>, time <double>, level <float>)
subroutine gengrid4d_byte_lld_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_byte_lld_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_byte

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_byte_lld_td_lf

!NetCDF <var short> (lon <double>, lat <double>, time <double>, level <float>)
subroutine gengrid4d_short_lld_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_short_lld_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_short

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_short_lld_td_lf

!NetCDF <var int> (lon <double>, lat <double>, time <double>, level <float>)
subroutine gengrid4d_int_lld_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_int_lld_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_int

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_int_lld_td_lf

!NetCDF <var float> (lon <double>, lat <double>, time <double>, level <float>)
subroutine gengrid4d_float_lld_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_float_lld_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_float

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_float_lld_td_lf

!NetCDF <var double> (lon <double>, lat <double>, time <double>, level <float>)
subroutine gengrid4d_double_lld_td_lf(idata, Xmin, Ymin, Xmax, Ymax, res)
  type (nc4d_double_lld_td_lf) :: idata
  integer(kind=intgr) :: i
  integer(kind=intgr), dimension(4) :: dimsizes, ids
  character(len=100), dimension(4) :: dimnames, dimunits
  real(kind=double) :: Xmin, Ymin, Xmax, Ymax, res

  idata%nlons = int(abs(ceiling(Xmax - Xmin)/res))
  idata%nlats = int(abs(ceiling(Ymax - Ymin)/res))

  allocate(idata%dimunits(idata%ndims))
  allocate(idata%dimname(idata%ndims))
  allocate(idata%dimid(idata%ndims))
  allocate(idata%dimsize(idata%ndims))
  allocate(idata%varids(idata%ndims))

  allocate(idata%longitudes(idata%nlons))  
  allocate(idata%latitudes(idata%nlats))
  allocate(idata%times(idata%ntimes))
  allocate(idata%levels(idata%nlevels))

  ids = (/ 4, 3, 2, 1 /)
  dimsizes = (/ idata%ntimes, idata%nlevels, idata%nlats, idata%nlons /)
  dimnames = (/ idata%timename, idata%levelname, idata%latname, idata%lonname /)
  dimunits = (/ idata%timeunits, idata%levelunits, idata%latunits, idata%lonunits /)

  do i = 1, idata%ndims
    idata%dimsize(i) = dimsizes(i)
    idata%dimname(i) = dimnames(i)
    idata%dimunits(i) = dimunits(i)
    idata%dimid(i) = ids(i)
    idata%varids(i) = ids(i) + 10
    idata%dims(i) = ids(i)
  end do

  allocate(idata%ncdata(idata%dimsize(4), idata%dimsize(3), idata%dimsize(2), idata%dimsize(1)))

  idata%vartype = nf90_double

  do i = 1, idata%ntimes
    idata%times(i) = i
  end do

  do i = 1, idata%nlevels
    idata%levels(i) = i
  end do

  idata%longitudes(1) = Xmin
  do i = 1, idata%nlons - 1
    idata%longitudes(i+1) = idata%longitudes(i) + res
  end do

  idata%latitudes(1) = Ymin
  do i = 1, idata%nlats - 1
    idata%latitudes(i+1) = idata%latitudes(i) + res
  end do

  idata%ncdata = idata%FillValue

end subroutine gengrid4d_double_lld_td_lf
