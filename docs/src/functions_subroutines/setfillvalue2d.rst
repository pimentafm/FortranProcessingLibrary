setfillvalue2d (2-dimensional Dataset)
``````````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

setfillvalue2d _ ``[maskdt][mapdt]`` _ll ``[cdt]`` subroutine is used to create a mask in a 2-dimensional NetCDF using another map. 
Combinations can be made for the statements of this subroutine by replacing ``[maskdt]`` and ``[mapdt]`` 
by one of the data types defined in the **FPL** library (``[byte, short, int, float, double]``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates (``f`` for float and ``d`` for double).

setfillvalue2d _ ``[maskdt][mapdt]`` _ll ``[cdt]`` (ifile, idata)
-----------------------------------------------------------------

:Type naming:
 :``[maskdt]``: variable datatype for mask `[byte, short, int, float, double]`
 :``[mapdt]``: variable datatype for map `[byte, short, int, float, double]`
 :``[cdt]``: coordinates datatype (float ``f``, double ``d``).
:Subroutine Parameters:
 :``mask``: map to use as mask. See :ref:`structurefields`. 
 :``map``: map to be masked. See :ref:`structurefields`. 
 :``num``: number in ``mask`` `[optional]`. See :ref:`structurefields`. 
:Local parameters: 
 :``i``: variable to iterate longitude positions `[integer]`
 :``j``: variable to iterate latitude positions `[integer]`

:Result: A map masked by another map.

**Example:**

Masks a 2-dimensional NetCDF dataset using other map as filter.
Map declared as double, mask declared as float and coordinates declared as float (setfillvalue2d _ ``floatdouble`` _ll ``f``).

::

  !NetCDF <variable float-double> (longitude <float>, latitude <float>)
  subroutine setfvalue2d_floatdouble_llf(mask, map, num)
    type (nc2d_float_llf) :: mask
    type (nc2d_double_llf) :: map
    integer, optional, intent(in):: num
    integer(kind=intgr) :: i, j
  
    if(present(num))then
      !$omp parallel do private(i, j)
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).ne.num) map%ncdata(i,j) = map%FillValue
          if((mask%ncdata(i,j).eq.num).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
        end do
      end do
      !$omp end parallel do
    else
      !$omp parallel do private(i, j)
      do i = 1, mask%nlats
        do j = 1, mask%nlons
          if(mask%ncdata(i,j).eq.mask%FillValue) map%ncdata(i,j) = map%FillValue
          if((mask%ncdata(i,j).ne.mask%FillValue).and.map%ncdata(i,j).eq.map%FillValue) map%ncdata(i,j) = 0
        end do
      end do
      !$omp end parallel do
    end if
  end subroutine setfvalue2d_floatdouble_llf
