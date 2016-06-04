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
!Set FillValue in map using mask FillValue - NetCDF(i,j) ===========

!NetCDF <var byte-byte> (lon <byte>, lat <byte>)
subroutine setfvalue2d_bytebyte_llf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc2d_byte_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_bytebyte_llf



!NetCDF <var byte-short> (lon <byte>, lat <short>)
subroutine setfvalue2d_byteshort_llf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc2d_short_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_byteshort_llf



!NetCDF <var byte-int> (lon <byte>, lat <int>)
subroutine setfvalue2d_byteint_llf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc2d_int_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_byteint_llf



!NetCDF <var byte-float> (lon <byte>, lat <float>)
subroutine setfvalue2d_bytefloat_llf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc2d_float_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_bytefloat_llf



!NetCDF <var byte-double> (lon <byte>, lat <double>)
subroutine setfvalue2d_bytedouble_llf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc2d_double_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_bytedouble_llf



!NetCDF <var short-byte> (lon <short>, lat <byte>)
subroutine setfvalue2d_shortbyte_llf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc2d_byte_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortbyte_llf



!NetCDF <var short-short> (lon <short>, lat <short>)
subroutine setfvalue2d_shortshort_llf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc2d_short_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortshort_llf



!NetCDF <var short-int> (lon <short>, lat <int>)
subroutine setfvalue2d_shortint_llf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc2d_int_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortint_llf



!NetCDF <var short-float> (lon <short>, lat <float>)
subroutine setfvalue2d_shortfloat_llf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc2d_float_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortfloat_llf



!NetCDF <var short-double> (lon <short>, lat <double>)
subroutine setfvalue2d_shortdouble_llf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc2d_double_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortdouble_llf



!NetCDF <var int-byte> (lon <int>, lat <byte>)
subroutine setfvalue2d_intbyte_llf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc2d_byte_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intbyte_llf



!NetCDF <var int-short> (lon <int>, lat <short>)
subroutine setfvalue2d_intshort_llf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc2d_short_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intshort_llf



!NetCDF <var int-int> (lon <int>, lat <int>)
subroutine setfvalue2d_intint_llf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc2d_int_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intint_llf



!NetCDF <var int-float> (lon <int>, lat <float>)
subroutine setfvalue2d_intfloat_llf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc2d_float_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intfloat_llf



!NetCDF <var int-double> (lon <int>, lat <double>)
subroutine setfvalue2d_intdouble_llf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc2d_double_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intdouble_llf



!NetCDF <var float-byte> (lon <float>, lat <byte>)
subroutine setfvalue2d_floatbyte_llf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc2d_byte_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatbyte_llf



!NetCDF <var float-short> (lon <float>, lat <short>)
subroutine setfvalue2d_floatshort_llf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc2d_short_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatshort_llf



!NetCDF <var float-int> (lon <float>, lat <int>)
subroutine setfvalue2d_floatint_llf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc2d_int_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatint_llf



!NetCDF <var float-float> (lon <float>, lat <float>)
subroutine setfvalue2d_floatfloat_llf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc2d_float_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatfloat_llf



!NetCDF <var float-double> (lon <float>, lat <double>)
subroutine setfvalue2d_floatdouble_llf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc2d_double_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatdouble_llf



!NetCDF <var double-byte> (lon <double>, lat <byte>)
subroutine setfvalue2d_doublebyte_llf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc2d_byte_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doublebyte_llf



!NetCDF <var double-short> (lon <double>, lat <short>)
subroutine setfvalue2d_doubleshort_llf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc2d_short_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doubleshort_llf



!NetCDF <var double-int> (lon <double>, lat <int>)
subroutine setfvalue2d_doubleint_llf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc2d_int_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doubleint_llf



!NetCDF <var double-float> (lon <double>, lat <float>)
subroutine setfvalue2d_doublefloat_llf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc2d_float_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doublefloat_llf



!NetCDF <var double-double> (lon <double>, lat <double>)
subroutine setfvalue2d_doubledouble_llf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc2d_double_llf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doubledouble_llf



!NetCDF <var byte-byte> (lon <byte>, lat <byte>)
subroutine setfvalue2d_bytebyte_lld(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc2d_byte_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_bytebyte_lld



!NetCDF <var byte-short> (lon <byte>, lat <short>)
subroutine setfvalue2d_byteshort_lld(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc2d_short_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_byteshort_lld



!NetCDF <var byte-int> (lon <byte>, lat <int>)
subroutine setfvalue2d_byteint_lld(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc2d_int_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_byteint_lld



!NetCDF <var byte-float> (lon <byte>, lat <float>)
subroutine setfvalue2d_bytefloat_lld(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc2d_float_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_bytefloat_lld



!NetCDF <var byte-double> (lon <byte>, lat <double>)
subroutine setfvalue2d_bytedouble_lld(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc2d_double_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_bytedouble_lld



!NetCDF <var short-byte> (lon <short>, lat <byte>)
subroutine setfvalue2d_shortbyte_lld(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc2d_byte_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortbyte_lld



!NetCDF <var short-short> (lon <short>, lat <short>)
subroutine setfvalue2d_shortshort_lld(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc2d_short_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortshort_lld



!NetCDF <var short-int> (lon <short>, lat <int>)
subroutine setfvalue2d_shortint_lld(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc2d_int_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortint_lld



!NetCDF <var short-float> (lon <short>, lat <float>)
subroutine setfvalue2d_shortfloat_lld(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc2d_float_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortfloat_lld



!NetCDF <var short-double> (lon <short>, lat <double>)
subroutine setfvalue2d_shortdouble_lld(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc2d_double_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_shortdouble_lld



!NetCDF <var int-byte> (lon <int>, lat <byte>)
subroutine setfvalue2d_intbyte_lld(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc2d_byte_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intbyte_lld



!NetCDF <var int-short> (lon <int>, lat <short>)
subroutine setfvalue2d_intshort_lld(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc2d_short_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intshort_lld



!NetCDF <var int-int> (lon <int>, lat <int>)
subroutine setfvalue2d_intint_lld(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc2d_int_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intint_lld



!NetCDF <var int-float> (lon <int>, lat <float>)
subroutine setfvalue2d_intfloat_lld(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc2d_float_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intfloat_lld



!NetCDF <var int-double> (lon <int>, lat <double>)
subroutine setfvalue2d_intdouble_lld(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc2d_double_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_intdouble_lld



!NetCDF <var float-byte> (lon <float>, lat <byte>)
subroutine setfvalue2d_floatbyte_lld(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc2d_byte_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatbyte_lld



!NetCDF <var float-short> (lon <float>, lat <short>)
subroutine setfvalue2d_floatshort_lld(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc2d_short_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatshort_lld



!NetCDF <var float-int> (lon <float>, lat <int>)
subroutine setfvalue2d_floatint_lld(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc2d_int_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatint_lld



!NetCDF <var float-float> (lon <float>, lat <float>)
subroutine setfvalue2d_floatfloat_lld(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc2d_float_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatfloat_lld



!NetCDF <var float-double> (lon <float>, lat <double>)
subroutine setfvalue2d_floatdouble_lld(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc2d_double_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_floatdouble_lld



!NetCDF <var double-byte> (lon <double>, lat <byte>)
subroutine setfvalue2d_doublebyte_lld(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc2d_byte_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doublebyte_lld



!NetCDF <var double-short> (lon <double>, lat <short>)
subroutine setfvalue2d_doubleshort_lld(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc2d_short_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doubleshort_lld



!NetCDF <var double-int> (lon <double>, lat <int>)
subroutine setfvalue2d_doubleint_lld(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc2d_int_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doubleint_lld



!NetCDF <var double-float> (lon <double>, lat <float>)
subroutine setfvalue2d_doublefloat_lld(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc2d_float_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doublefloat_lld



!NetCDF <var double-double> (lon <double>, lat <double>)
subroutine setfvalue2d_doubledouble_lld(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc2d_double_lld) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j

  if(present(num))then
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  else
    do i = 1, mask%nlats
      do j = 1, mask%nlons
        if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
        if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
      end do
    end do
  end if
end subroutine setfvalue2d_doubledouble_lld


!Set FillValue in map using mask FillValue - NetCDF(i,j,k) ===========

!NetCDF <var byte-byte> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_bytebyte_llf_ti(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_byte_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytebyte_llf_ti



!NetCDF <var byte-short> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_byteshort_llf_ti(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_short_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteshort_llf_ti



!NetCDF <var byte-int> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_byteint_llf_ti(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_int_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteint_llf_ti



!NetCDF <var byte-float> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_bytefloat_llf_ti(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_float_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytefloat_llf_ti



!NetCDF <var byte-double> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_bytedouble_llf_ti(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_double_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytedouble_llf_ti



!NetCDF <var short-byte> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_shortbyte_llf_ti(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_byte_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortbyte_llf_ti



!NetCDF <var short-short> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_shortshort_llf_ti(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_short_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortshort_llf_ti



!NetCDF <var short-int> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_shortint_llf_ti(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_int_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortint_llf_ti



!NetCDF <var short-float> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_shortfloat_llf_ti(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_float_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortfloat_llf_ti



!NetCDF <var short-double> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_shortdouble_llf_ti(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_double_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortdouble_llf_ti



!NetCDF <var int-byte> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_intbyte_llf_ti(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_byte_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intbyte_llf_ti



!NetCDF <var int-short> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_intshort_llf_ti(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_short_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intshort_llf_ti



!NetCDF <var int-int> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_intint_llf_ti(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_int_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intint_llf_ti



!NetCDF <var int-float> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_intfloat_llf_ti(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_float_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intfloat_llf_ti



!NetCDF <var int-double> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_intdouble_llf_ti(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_double_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intdouble_llf_ti



!NetCDF <var float-byte> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_floatbyte_llf_ti(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_byte_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatbyte_llf_ti



!NetCDF <var float-short> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_floatshort_llf_ti(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_short_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatshort_llf_ti



!NetCDF <var float-int> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_floatint_llf_ti(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_int_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatint_llf_ti



!NetCDF <var float-float> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_floatfloat_llf_ti(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_float_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatfloat_llf_ti



!NetCDF <var float-double> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_floatdouble_llf_ti(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_double_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatdouble_llf_ti



!NetCDF <var double-byte> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_doublebyte_llf_ti(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_byte_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublebyte_llf_ti



!NetCDF <var double-short> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_doubleshort_llf_ti(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_short_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleshort_llf_ti



!NetCDF <var double-int> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_doubleint_llf_ti(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_int_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleint_llf_ti



!NetCDF <var double-float> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_doublefloat_llf_ti(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_float_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublefloat_llf_ti



!NetCDF <var double-double> (lon <float>, lat <float>, time <int>)
subroutine setfvalue3d_doubledouble_llf_ti(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_double_llf_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubledouble_llf_ti



!NetCDF <var byte-byte> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_bytebyte_lld_ti(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_byte_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytebyte_lld_ti



!NetCDF <var byte-short> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_byteshort_lld_ti(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_short_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteshort_lld_ti



!NetCDF <var byte-int> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_byteint_lld_ti(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_int_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteint_lld_ti



!NetCDF <var byte-float> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_bytefloat_lld_ti(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_float_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytefloat_lld_ti



!NetCDF <var byte-double> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_bytedouble_lld_ti(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_double_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytedouble_lld_ti



!NetCDF <var short-byte> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_shortbyte_lld_ti(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_byte_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortbyte_lld_ti



!NetCDF <var short-short> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_shortshort_lld_ti(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_short_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortshort_lld_ti



!NetCDF <var short-int> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_shortint_lld_ti(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_int_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortint_lld_ti



!NetCDF <var short-float> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_shortfloat_lld_ti(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_float_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortfloat_lld_ti



!NetCDF <var short-double> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_shortdouble_lld_ti(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_double_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortdouble_lld_ti



!NetCDF <var int-byte> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_intbyte_lld_ti(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_byte_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intbyte_lld_ti



!NetCDF <var int-short> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_intshort_lld_ti(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_short_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intshort_lld_ti



!NetCDF <var int-int> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_intint_lld_ti(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_int_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intint_lld_ti



!NetCDF <var int-float> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_intfloat_lld_ti(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_float_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intfloat_lld_ti



!NetCDF <var int-double> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_intdouble_lld_ti(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_double_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intdouble_lld_ti



!NetCDF <var float-byte> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_floatbyte_lld_ti(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_byte_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatbyte_lld_ti



!NetCDF <var float-short> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_floatshort_lld_ti(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_short_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatshort_lld_ti



!NetCDF <var float-int> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_floatint_lld_ti(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_int_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatint_lld_ti



!NetCDF <var float-float> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_floatfloat_lld_ti(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_float_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatfloat_lld_ti



!NetCDF <var float-double> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_floatdouble_lld_ti(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_double_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatdouble_lld_ti



!NetCDF <var double-byte> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_doublebyte_lld_ti(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_byte_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublebyte_lld_ti



!NetCDF <var double-short> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_doubleshort_lld_ti(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_short_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleshort_lld_ti



!NetCDF <var double-int> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_doubleint_lld_ti(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_int_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleint_lld_ti



!NetCDF <var double-float> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_doublefloat_lld_ti(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_float_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublefloat_lld_ti



!NetCDF <var double-double> (lon <double>, lat <double>, time <int>)
subroutine setfvalue3d_doubledouble_lld_ti(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_double_lld_ti) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubledouble_lld_ti



!NetCDF <var byte-byte> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_bytebyte_llf_tf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_byte_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytebyte_llf_tf



!NetCDF <var byte-short> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_byteshort_llf_tf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_short_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteshort_llf_tf



!NetCDF <var byte-int> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_byteint_llf_tf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_int_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteint_llf_tf



!NetCDF <var byte-float> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_bytefloat_llf_tf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_float_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytefloat_llf_tf



!NetCDF <var byte-double> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_bytedouble_llf_tf(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_double_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytedouble_llf_tf



!NetCDF <var short-byte> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_shortbyte_llf_tf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_byte_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortbyte_llf_tf



!NetCDF <var short-short> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_shortshort_llf_tf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_short_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortshort_llf_tf



!NetCDF <var short-int> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_shortint_llf_tf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_int_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortint_llf_tf



!NetCDF <var short-float> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_shortfloat_llf_tf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_float_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortfloat_llf_tf



!NetCDF <var short-double> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_shortdouble_llf_tf(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_double_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortdouble_llf_tf



!NetCDF <var int-byte> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_intbyte_llf_tf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_byte_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intbyte_llf_tf



!NetCDF <var int-short> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_intshort_llf_tf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_short_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intshort_llf_tf



!NetCDF <var int-int> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_intint_llf_tf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_int_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intint_llf_tf



!NetCDF <var int-float> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_intfloat_llf_tf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_float_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intfloat_llf_tf



!NetCDF <var int-double> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_intdouble_llf_tf(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_double_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intdouble_llf_tf



!NetCDF <var float-byte> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_floatbyte_llf_tf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_byte_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatbyte_llf_tf



!NetCDF <var float-short> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_floatshort_llf_tf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_short_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatshort_llf_tf



!NetCDF <var float-int> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_floatint_llf_tf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_int_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatint_llf_tf



!NetCDF <var float-float> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_floatfloat_llf_tf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_float_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatfloat_llf_tf



!NetCDF <var float-double> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_floatdouble_llf_tf(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_double_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatdouble_llf_tf



!NetCDF <var double-byte> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_doublebyte_llf_tf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_byte_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublebyte_llf_tf



!NetCDF <var double-short> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_doubleshort_llf_tf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_short_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleshort_llf_tf



!NetCDF <var double-int> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_doubleint_llf_tf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_int_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleint_llf_tf



!NetCDF <var double-float> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_doublefloat_llf_tf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_float_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublefloat_llf_tf



!NetCDF <var double-double> (lon <float>, lat <float>, time <float>)
subroutine setfvalue3d_doubledouble_llf_tf(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_double_llf_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubledouble_llf_tf



!NetCDF <var byte-byte> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_bytebyte_lld_tf(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_byte_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytebyte_lld_tf



!NetCDF <var byte-short> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_byteshort_lld_tf(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_short_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteshort_lld_tf



!NetCDF <var byte-int> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_byteint_lld_tf(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_int_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteint_lld_tf



!NetCDF <var byte-float> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_bytefloat_lld_tf(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_float_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytefloat_lld_tf



!NetCDF <var byte-double> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_bytedouble_lld_tf(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_double_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytedouble_lld_tf



!NetCDF <var short-byte> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_shortbyte_lld_tf(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_byte_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortbyte_lld_tf



!NetCDF <var short-short> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_shortshort_lld_tf(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_short_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortshort_lld_tf



!NetCDF <var short-int> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_shortint_lld_tf(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_int_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortint_lld_tf



!NetCDF <var short-float> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_shortfloat_lld_tf(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_float_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortfloat_lld_tf



!NetCDF <var short-double> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_shortdouble_lld_tf(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_double_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortdouble_lld_tf



!NetCDF <var int-byte> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_intbyte_lld_tf(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_byte_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intbyte_lld_tf



!NetCDF <var int-short> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_intshort_lld_tf(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_short_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intshort_lld_tf



!NetCDF <var int-int> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_intint_lld_tf(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_int_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intint_lld_tf



!NetCDF <var int-float> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_intfloat_lld_tf(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_float_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intfloat_lld_tf



!NetCDF <var int-double> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_intdouble_lld_tf(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_double_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intdouble_lld_tf



!NetCDF <var float-byte> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_floatbyte_lld_tf(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_byte_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatbyte_lld_tf



!NetCDF <var float-short> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_floatshort_lld_tf(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_short_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatshort_lld_tf



!NetCDF <var float-int> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_floatint_lld_tf(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_int_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatint_lld_tf



!NetCDF <var float-float> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_floatfloat_lld_tf(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_float_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatfloat_lld_tf



!NetCDF <var float-double> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_floatdouble_lld_tf(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_double_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatdouble_lld_tf



!NetCDF <var double-byte> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_doublebyte_lld_tf(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_byte_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublebyte_lld_tf



!NetCDF <var double-short> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_doubleshort_lld_tf(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_short_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleshort_lld_tf



!NetCDF <var double-int> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_doubleint_lld_tf(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_int_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleint_lld_tf



!NetCDF <var double-float> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_doublefloat_lld_tf(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_float_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublefloat_lld_tf



!NetCDF <var double-double> (lon <double>, lat <double>, time <float>)
subroutine setfvalue3d_doubledouble_lld_tf(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_double_lld_tf) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubledouble_lld_tf



!NetCDF <var byte-byte> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_bytebyte_llf_td(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_byte_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytebyte_llf_td



!NetCDF <var byte-short> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_byteshort_llf_td(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_short_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteshort_llf_td



!NetCDF <var byte-int> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_byteint_llf_td(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_int_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteint_llf_td



!NetCDF <var byte-float> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_bytefloat_llf_td(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_float_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytefloat_llf_td



!NetCDF <var byte-double> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_bytedouble_llf_td(mask, map, num)
  type (nc2d_byte_llf) :: mask
  type (nc3d_double_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytedouble_llf_td



!NetCDF <var short-byte> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_shortbyte_llf_td(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_byte_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortbyte_llf_td



!NetCDF <var short-short> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_shortshort_llf_td(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_short_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortshort_llf_td



!NetCDF <var short-int> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_shortint_llf_td(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_int_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortint_llf_td



!NetCDF <var short-float> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_shortfloat_llf_td(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_float_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortfloat_llf_td



!NetCDF <var short-double> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_shortdouble_llf_td(mask, map, num)
  type (nc2d_short_llf) :: mask
  type (nc3d_double_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortdouble_llf_td



!NetCDF <var int-byte> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_intbyte_llf_td(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_byte_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intbyte_llf_td



!NetCDF <var int-short> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_intshort_llf_td(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_short_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intshort_llf_td



!NetCDF <var int-int> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_intint_llf_td(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_int_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intint_llf_td



!NetCDF <var int-float> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_intfloat_llf_td(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_float_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intfloat_llf_td



!NetCDF <var int-double> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_intdouble_llf_td(mask, map, num)
  type (nc2d_int_llf) :: mask
  type (nc3d_double_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intdouble_llf_td



!NetCDF <var float-byte> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_floatbyte_llf_td(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_byte_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatbyte_llf_td



!NetCDF <var float-short> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_floatshort_llf_td(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_short_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatshort_llf_td



!NetCDF <var float-int> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_floatint_llf_td(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_int_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatint_llf_td



!NetCDF <var float-float> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_floatfloat_llf_td(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_float_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatfloat_llf_td



!NetCDF <var float-double> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_floatdouble_llf_td(mask, map, num)
  type (nc2d_float_llf) :: mask
  type (nc3d_double_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatdouble_llf_td



!NetCDF <var double-byte> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_doublebyte_llf_td(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_byte_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublebyte_llf_td



!NetCDF <var double-short> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_doubleshort_llf_td(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_short_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleshort_llf_td



!NetCDF <var double-int> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_doubleint_llf_td(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_int_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleint_llf_td



!NetCDF <var double-float> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_doublefloat_llf_td(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_float_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublefloat_llf_td



!NetCDF <var double-double> (lon <float>, lat <float>, time <double>)
subroutine setfvalue3d_doubledouble_llf_td(mask, map, num)
  type (nc2d_double_llf) :: mask
  type (nc3d_double_llf_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubledouble_llf_td



!NetCDF <var byte-byte> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_bytebyte_lld_td(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_byte_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytebyte_lld_td



!NetCDF <var byte-short> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_byteshort_lld_td(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_short_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteshort_lld_td



!NetCDF <var byte-int> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_byteint_lld_td(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_int_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_byteint_lld_td



!NetCDF <var byte-float> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_bytefloat_lld_td(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_float_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytefloat_lld_td



!NetCDF <var byte-double> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_bytedouble_lld_td(mask, map, num)
  type (nc2d_byte_lld) :: mask
  type (nc3d_double_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_bytedouble_lld_td



!NetCDF <var short-byte> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_shortbyte_lld_td(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_byte_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortbyte_lld_td



!NetCDF <var short-short> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_shortshort_lld_td(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_short_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortshort_lld_td



!NetCDF <var short-int> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_shortint_lld_td(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_int_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortint_lld_td



!NetCDF <var short-float> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_shortfloat_lld_td(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_float_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortfloat_lld_td



!NetCDF <var short-double> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_shortdouble_lld_td(mask, map, num)
  type (nc2d_short_lld) :: mask
  type (nc3d_double_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_shortdouble_lld_td



!NetCDF <var int-byte> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_intbyte_lld_td(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_byte_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intbyte_lld_td



!NetCDF <var int-short> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_intshort_lld_td(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_short_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intshort_lld_td



!NetCDF <var int-int> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_intint_lld_td(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_int_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intint_lld_td



!NetCDF <var int-float> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_intfloat_lld_td(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_float_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intfloat_lld_td



!NetCDF <var int-double> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_intdouble_lld_td(mask, map, num)
  type (nc2d_int_lld) :: mask
  type (nc3d_double_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_intdouble_lld_td



!NetCDF <var float-byte> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_floatbyte_lld_td(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_byte_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatbyte_lld_td



!NetCDF <var float-short> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_floatshort_lld_td(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_short_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatshort_lld_td



!NetCDF <var float-int> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_floatint_lld_td(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_int_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatint_lld_td



!NetCDF <var float-float> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_floatfloat_lld_td(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_float_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatfloat_lld_td



!NetCDF <var float-double> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_floatdouble_lld_td(mask, map, num)
  type (nc2d_float_lld) :: mask
  type (nc3d_double_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_floatdouble_lld_td



!NetCDF <var double-byte> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_doublebyte_lld_td(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_byte_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublebyte_lld_td



!NetCDF <var double-short> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_doubleshort_lld_td(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_short_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleshort_lld_td



!NetCDF <var double-int> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_doubleint_lld_td(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_int_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubleint_lld_td



!NetCDF <var double-float> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_doublefloat_lld_td(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_float_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doublefloat_lld_td



!NetCDF <var double-double> (lon <double>, lat <double>, time <double>)
subroutine setfvalue3d_doubledouble_lld_td(mask, map, num)
  type (nc2d_double_lld) :: mask
  type (nc3d_double_lld_td) :: map
  integer, optional, intent(in):: num
  integer(kind=intgr) :: i, j, k

  if(present(num))then
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  else
    do k = 1, map%ntimes
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
        end do
      end do
    end do
  end if
end subroutine setfvalue3d_doubledouble_lld_td


