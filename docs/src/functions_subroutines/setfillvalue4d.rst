setfillvalue4d (4-dimensional Dataset)
``````````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

setfillvalue4d _ ``[maskdt][mapdt]`` _ll ``[cdt]`` _t ``[tdt]`` subroutine is used to create a mask in a 4-dimensional NetCDF using another map. 
Combinations can be made for the statements of this subroutine by replacing ``[maskdt]`` and ``[mapdt]`` 
by one of the data types defined in the **f90NetCDF** library (``[byte, short, int, float, double]``), ``[cdt]`` by a defined suffix 
for the data type of the coordinates (``f`` for float and ``d`` for double), ``[tdt]`` by a defined suffix 
for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double) and ``[ldt]`` for a level suffix ((``f`` for float and ``d`` for double).

setfillvalue4d _ ``[maskdt][mapdt]`` _ll ``[cdt]`` _t ``[tdt]`` (ifile, idata)
------------------------------------------------------------------------------

:Type naming:
 :``[maskdt]``: variable datatype for mask `[byte, short, int, float, double]`
 :``[mapdt]``: variable datatype for map `[byte, short, int, float, double]`
 :``[cdt]``: coordinates datatype (float ``f``, double ``d``).
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``i``)
 :``[ldt]``: level datatype (integer ``i``, float ``f``, double ``i``)
:Subroutine Parameters:
 :``mask``: map to use as mask `[f90NetCDF defined type structure]` 
 :``map``: map to be masked `[f90NetCDF defined type structure]` 
 :``num``: number in ``mask`` `[optional]` `[f90NetCDF defined type structure]` 
:Local parameters: 
 :``i``: variable to iterate longitude positions `[integer]`
 :``j``: variable to iterate latitude positions `[integer]`
 :``k``: variable to iterate time positions `[integer]`
 :``l``: variable to iterate level positions `[integer]`

:Result: A map masked by another map.

**Example:**

Masks a 4-dimensional NetCDF dataset using other map as filter.
Map declared as float, mask declared as integer, coordinates declared as double and time 
declared as integer (setfillvalue4d _ ``intfloat`` _ll ``d`` _t ``[i]``).

::

  !NetCDF <variable double-double> (longitude <double>, latitude <double>, time <double>, level <float>)
  subroutine setfvalue4d_doubledouble_lld_td_lf(mask, map, num)
    type (nc2d_double_lld) :: mask
    type (nc4d_double_lld_td_lf) :: map
    integer, optional, intent(in):: num
    integer(kind=intgr) :: i, j, k, l
  
    if(present(num))then
      !$omp parallel do private(l, k, i, j)
      do l = 1, map%nlevels
        do k = 1, map%ntimes
          do i = 1, mask%nlats
            do j = 1, mask%nlons
              if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k,l) = map%FillValue
              if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k,l).eq.map%FillValue) map%ncdata(i,j,k,l) = 0
            end do
          end do
        end do
      end do
      !$omp end parallel do
    else
      !$omp parallel do private(l, k, i, j)
      do l = 1, map%nlevels
        do k = 1, map%ntimes
          do i = 1, mask%nlats
            do j = 1, mask%nlons
              if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k,l) = map%FillValue
              if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k,l).eq.map%FillValue) map%ncdata(i,j,k,l) = 0
            end do
          end do
        end do
      end do
      !$omp end parallel do
    end if
  end subroutine setfvalue4d_doubledouble_lld_td_lf
