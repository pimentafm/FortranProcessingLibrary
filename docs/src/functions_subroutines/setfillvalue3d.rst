setfillvalue3d (3-dimensional Dataset)
``````````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

setfillvalue3d _ ``[maskdt][mapdt]`` _ll ``[cdt]`` _t ``[tdt]`` subroutine is used to create a mask in a 3-dimensional NetCDF
using another map. Combinations can be made for the statements of this subroutine by replacing ``[maskdt]`` and ``[mapdt]`` 
by one of the data types defined in the **FPL** library (``[byte, short, int, float, double]``), 
``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double and
``[tdt]`` by a defined suffix for the datatype of time (``i`` for integer, ``f`` for float and ``d`` for double).

setfillvalue3d _ ``[maskdt][mapdt]`` _ll ``[cdt]`` _t ``[tdt]`` (ifile, idata)
------------------------------------------------------------------------------

:Type naming:
 :``[maskdt]``: variable datatype for mask `[byte, short, int, float, double]`
 :``[mapdt]``: variable datatype for map `[byte, short, int, float, double]`
 :``[cdt]``: coordinates datatype (float ``f``, double ``d``).
 :``[tdt]``: time datatype (integer ``i``, float ``f``, double ``i``)
:Subroutine Parameters:
 :``mask``: map to use as mask. See :ref:`structurefields`. 
 :``map``: map to be masked. See :ref:`structurefields`. 
 :``num``: number in ``mask`` `[optional]`. See :ref:`structurefields`. 
:Local parameters: 
 :``i``: variable to iterate longitude positions `[integer]`
 :``j``: variable to iterate latitude positions `[integer]`
 :``k``: variable to iterate time positions `[integer]`

:Result: A map masked by another map.

**Example:**

Masks a 3-dimensional NetCDF dataset using other map as filter.
Map declared as float, mask declared as integer, coordinates declared as double and time 
declared as integer (setfillvalue3d _ ``intfloat`` _ll ``d`` _t ``[i]``).

::

  !NetCDF <variable int-float> (longitude <double>, latitude <double>, time <int>)
  subroutine setfvalue3d_intfloat_lld_ti(mask, map, num)
    type (nc2d_int_lld) :: mask
    type (nc3d_float_lld_ti) :: map
    integer, optional, intent(in):: num
    integer(kind=intgr) :: i, j, k
  
    if(present(num))then
      !$omp parallel do private(k, i, j)
      do k = 1, map%ntimes
        do i = 1, mask%nlats
          do j = 1, mask%nlons
            if(mask%ncdata(i,j).ne.num) map%ncdata(i,j,k) = map%FillValue
            if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
          end do
        end do
      end do
      !$omp end parallel do
    else
      !$omp parallel do private(k, i, j)
      do k = 1, map%ntimes
        do i = 1, mask%nlats
          do j = 1, mask%nlons
            if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j,k) = map%FillValue
            if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j,k).eq.map%FillValue) map%ncdata(i,j,k) = 0
          end do
        end do
      end do
      !$omp end parallel do
    end if
  end subroutine setfvalue3d_intfloat_lld_ti
