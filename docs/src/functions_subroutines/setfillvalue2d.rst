setfillvalue2d (2-dimensional Dataset)
```````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

setfillvalue2d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to write a 2-dimensional NetCDF dataset into a file. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **f90NetCDF** library (``[byte, short, int, float, double]``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates (``f`` for float and ``d`` for double).

setfillvalue2d _ ``[vdt]`` _ll ``[cdt]`` (ifile, idata)
----------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
:Subroutine Parameters:
 :``ofile``: file path `[character]` 
 :``odata``: 2d dataset structure `[f90NetCDF defined type structure]` 
 :``headerfile``: text file `[character]` `[optional]`
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``dimids``: Array of dimension IDs corresponding to the variable dimensions `[integer]`
 :``xvarid``: longitude array ID `[integer]`
 :``yvarid``: latitude array ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
 :``headerfile``:
 :``attribute``:
 :``content``:
 :``nkeys``:
:Result:
 Save data into a NetCDF file format.

**Example:**

Masks a 2-dimensional NetCDF dataset using other map as filter.
Map declared as double and mask declared as float (setfillvalue2d _ ``floatdouble`` _ll ``f``).

::

  !NetCDF <var float-double> (lon <float>, lat <float>)
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
