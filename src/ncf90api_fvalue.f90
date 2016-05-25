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
!Set FillValue in map using mask FillValue - NetCDF(i,j) ======================

!NetCDF(i,j)-> byte-byte
subroutine setFillValue2d_bb(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc2d_byte) :: map
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
end subroutine setFillValue2d_bb


!NetCDF(i,j)-> byte-short
subroutine setFillValue2d_bs(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc2d_short) :: map
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
end subroutine setFillValue2d_bs


!NetCDF(i,j)-> byte-int
subroutine setFillValue2d_bi(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc2d_int) :: map
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
end subroutine setFillValue2d_bi


!NetCDF(i,j)-> byte-float
subroutine setFillValue2d_bf(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc2d_float) :: map
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
end subroutine setFillValue2d_bf


!NetCDF(i,j)-> byte-double
subroutine setFillValue2d_bd(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc2d_double) :: map
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
end subroutine setFillValue2d_bd


!NetCDF(i,j)-> short-byte
subroutine setFillValue2d_sb(mask, map, num)
  type (nc2d_short) :: mask
  type (nc2d_byte) :: map
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
end subroutine setFillValue2d_sb


!NetCDF(i,j)-> short-short
subroutine setFillValue2d_ss(mask, map, num)
  type (nc2d_short) :: mask
  type (nc2d_short) :: map
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
end subroutine setFillValue2d_ss


!NetCDF(i,j)-> short-int
subroutine setFillValue2d_si(mask, map, num)
  type (nc2d_short) :: mask
  type (nc2d_int) :: map
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
end subroutine setFillValue2d_si


!NetCDF(i,j)-> short-float
subroutine setFillValue2d_sf(mask, map, num)
  type (nc2d_short) :: mask
  type (nc2d_float) :: map
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
end subroutine setFillValue2d_sf


!NetCDF(i,j)-> short-double
subroutine setFillValue2d_sd(mask, map, num)
  type (nc2d_short) :: mask
  type (nc2d_double) :: map
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
end subroutine setFillValue2d_sd


!NetCDF(i,j)-> int-byte
subroutine setFillValue2d_ib(mask, map, num)
  type (nc2d_int) :: mask
  type (nc2d_byte) :: map
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
end subroutine setFillValue2d_ib


!NetCDF(i,j)-> int-short
subroutine setFillValue2d_is(mask, map, num)
  type (nc2d_int) :: mask
  type (nc2d_short) :: map
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
end subroutine setFillValue2d_is


!NetCDF(i,j)-> int-int
subroutine setFillValue2d_ii(mask, map, num)
  type (nc2d_int) :: mask
  type (nc2d_int) :: map
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
end subroutine setFillValue2d_ii


!NetCDF(i,j)-> int-float
subroutine setFillValue2d_if(mask, map, num)
  type (nc2d_int) :: mask
  type (nc2d_float) :: map
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
end subroutine setFillValue2d_if


!NetCDF(i,j)-> int-double
subroutine setFillValue2d_id(mask, map, num)
  type (nc2d_int) :: mask
  type (nc2d_double) :: map
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
end subroutine setFillValue2d_id


!NetCDF(i,j)-> float-byte
subroutine setFillValue2d_fb(mask, map, num)
  type (nc2d_float) :: mask
  type (nc2d_byte) :: map
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
end subroutine setFillValue2d_fb


!NetCDF(i,j)-> float-short
subroutine setFillValue2d_fs(mask, map, num)
  type (nc2d_float) :: mask
  type (nc2d_short) :: map
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
end subroutine setFillValue2d_fs


!NetCDF(i,j)-> float-int
subroutine setFillValue2d_fi(mask, map, num)
  type (nc2d_float) :: mask
  type (nc2d_int) :: map
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
end subroutine setFillValue2d_fi


!NetCDF(i,j)-> float-float
subroutine setFillValue2d_ff(mask, map, num)
  type (nc2d_float) :: mask
  type (nc2d_float) :: map
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
end subroutine setFillValue2d_ff


!NetCDF(i,j)-> float-double
subroutine setFillValue2d_fd(mask, map, num)
  type (nc2d_float) :: mask
  type (nc2d_double) :: map
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
end subroutine setFillValue2d_fd


!NetCDF(i,j)-> double-byte
subroutine setFillValue2d_db(mask, map, num)
  type (nc2d_double) :: mask
  type (nc2d_byte) :: map
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
end subroutine setFillValue2d_db


!NetCDF(i,j)-> double-short
subroutine setFillValue2d_ds(mask, map, num)
  type (nc2d_double) :: mask
  type (nc2d_short) :: map
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
end subroutine setFillValue2d_ds


!NetCDF(i,j)-> double-int
subroutine setFillValue2d_di(mask, map, num)
  type (nc2d_double) :: mask
  type (nc2d_int) :: map
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
end subroutine setFillValue2d_di


!NetCDF(i,j)-> double-float
subroutine setFillValue2d_df(mask, map, num)
  type (nc2d_double) :: mask
  type (nc2d_float) :: map
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
end subroutine setFillValue2d_df


!NetCDF(i,j)-> double-double
subroutine setFillValue2d_dd(mask, map, num)
  type (nc2d_double) :: mask
  type (nc2d_double) :: map
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
end subroutine setFillValue2d_dd

!Set FillValue in map using mask FillValue - NetCDF(i,j,k) ===========

!NetCDF(i,j,k)-> byte-byte 
subroutine setFillValue3d_bb(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc3d_byte) :: map
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
end subroutine setFillValue3d_bb


!NetCDF(i,j,k)-> byte-short 
subroutine setFillValue3d_bs(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc3d_short) :: map
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
end subroutine setFillValue3d_bs


!NetCDF(i,j,k)-> byte-int 
subroutine setFillValue3d_bi(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc3d_int) :: map
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
end subroutine setFillValue3d_bi


!NetCDF(i,j,k)-> byte-float 
subroutine setFillValue3d_bf(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc3d_float) :: map
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
end subroutine setFillValue3d_bf


!NetCDF(i,j,k)-> byte-double 
subroutine setFillValue3d_bd(mask, map, num)
  type (nc2d_byte) :: mask
  type (nc3d_double) :: map
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
end subroutine setFillValue3d_bd


!NetCDF(i,j,k)-> short-byte 
subroutine setFillValue3d_sb(mask, map, num)
  type (nc2d_short) :: mask
  type (nc3d_byte) :: map
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
end subroutine setFillValue3d_sb


!NetCDF(i,j,k)-> short-short 
subroutine setFillValue3d_ss(mask, map, num)
  type (nc2d_short) :: mask
  type (nc3d_short) :: map
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
end subroutine setFillValue3d_ss


!NetCDF(i,j,k)-> short-int 
subroutine setFillValue3d_si(mask, map, num)
  type (nc2d_short) :: mask
  type (nc3d_int) :: map
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
end subroutine setFillValue3d_si


!NetCDF(i,j,k)-> short-float 
subroutine setFillValue3d_sf(mask, map, num)
  type (nc2d_short) :: mask
  type (nc3d_float) :: map
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
end subroutine setFillValue3d_sf


!NetCDF(i,j,k)-> short-double 
subroutine setFillValue3d_sd(mask, map, num)
  type (nc2d_short) :: mask
  type (nc3d_double) :: map
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
end subroutine setFillValue3d_sd


!NetCDF(i,j,k)-> int-byte 
subroutine setFillValue3d_ib(mask, map, num)
  type (nc2d_int) :: mask
  type (nc3d_byte) :: map
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
end subroutine setFillValue3d_ib


!NetCDF(i,j,k)-> int-short 
subroutine setFillValue3d_is(mask, map, num)
  type (nc2d_int) :: mask
  type (nc3d_short) :: map
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
end subroutine setFillValue3d_is


!NetCDF(i,j,k)-> int-int 
subroutine setFillValue3d_ii(mask, map, num)
  type (nc2d_int) :: mask
  type (nc3d_int) :: map
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
end subroutine setFillValue3d_ii


!NetCDF(i,j,k)-> int-float 
subroutine setFillValue3d_if(mask, map, num)
  type (nc2d_int) :: mask
  type (nc3d_float) :: map
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
end subroutine setFillValue3d_if


!NetCDF(i,j,k)-> int-double 
subroutine setFillValue3d_id(mask, map, num)
  type (nc2d_int) :: mask
  type (nc3d_double) :: map
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
end subroutine setFillValue3d_id


!NetCDF(i,j,k)-> float-byte 
subroutine setFillValue3d_fb(mask, map, num)
  type (nc2d_float) :: mask
  type (nc3d_byte) :: map
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
end subroutine setFillValue3d_fb


!NetCDF(i,j,k)-> float-short 
subroutine setFillValue3d_fs(mask, map, num)
  type (nc2d_float) :: mask
  type (nc3d_short) :: map
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
end subroutine setFillValue3d_fs


!NetCDF(i,j,k)-> float-int 
subroutine setFillValue3d_fi(mask, map, num)
  type (nc2d_float) :: mask
  type (nc3d_int) :: map
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
end subroutine setFillValue3d_fi


!NetCDF(i,j,k)-> float-float 
subroutine setFillValue3d_ff(mask, map, num)
  type (nc2d_float) :: mask
  type (nc3d_float) :: map
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
end subroutine setFillValue3d_ff


!NetCDF(i,j,k)-> float-double 
subroutine setFillValue3d_fd(mask, map, num)
  type (nc2d_float) :: mask
  type (nc3d_double) :: map
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
end subroutine setFillValue3d_fd


!NetCDF(i,j,k)-> double-byte 
subroutine setFillValue3d_db(mask, map, num)
  type (nc2d_double) :: mask
  type (nc3d_byte) :: map
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
end subroutine setFillValue3d_db


!NetCDF(i,j,k)-> double-short 
subroutine setFillValue3d_ds(mask, map, num)
  type (nc2d_double) :: mask
  type (nc3d_short) :: map
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
end subroutine setFillValue3d_ds


!NetCDF(i,j,k)-> double-int 
subroutine setFillValue3d_di(mask, map, num)
  type (nc2d_double) :: mask
  type (nc3d_int) :: map
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
end subroutine setFillValue3d_di


!NetCDF(i,j,k)-> double-float 
subroutine setFillValue3d_df(mask, map, num)
  type (nc2d_double) :: mask
  type (nc3d_float) :: map
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
end subroutine setFillValue3d_df


!NetCDF(i,j,k)-> double-double 
subroutine setFillValue3d_dd(mask, map, num)
  type (nc2d_double) :: mask
  type (nc3d_double) :: map
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
end subroutine setFillValue3d_dd

