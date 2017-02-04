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

!Sort 2 arrays of integers
Subroutine Order(p,q, dp, dq)
  integer p,q,temp
  character(len=100) :: dp, dq, tempd
  if (p>q) then
    temp=p
    tempd=dp
    p=q
    dp=dq
    q=temp
    dq=tempd
  end if
end subroutine Order

Subroutine bubbleSort(dimid, dimname, n)
  integer dimid(1:n), j, n, i
  character(len=100) :: dimname(1:n)
  do i=1, n
    do j=n, i+1, -1
      call Order(dimid(j-1), dimid(j), dimname(j-1), dimname(j))
    end do
  end do
end subroutine bubbleSort
