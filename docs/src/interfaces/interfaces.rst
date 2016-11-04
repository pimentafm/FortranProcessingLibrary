.. highlight:: fortran
   :linenothreshold: 2

.. note::
  * All subroutine interfaces can be seen in the file f90NetCDF/src/f90NetCDF_interfaces.f90
  * Some error checking subroutines are not in the list of interfaces because of ambiguity problems.

checkerror
----------

::

  interface check
    module procedure checkerror, checktype, checkatt
  end interface check

ncoords
-------

::

  interface ncoords
    module procedure ncoords2d_byte_llf, &
                      ...
                      ncoords3d_byte_llf_ti, &
                      ...
                      ncoords4d_byte_llf_ti_li, &
                      ...
  end interface ncoords

readgrid
--------

::

  interface readgrid
    module procedure readgrid2d_byte_llf, &
                      ...
                      readgrid3d_byte_llf_ti, &
                      ...
                      readgrid4d_byte_llf_ti_li, &
                      ...
  end interface readgrid

writegrid
---------

::
 
  interface setFillValue
    module procedure setfvalue2d_bytebyte_llf, &
                     ...
                     setfvalue3d_bytebyte_llf_ti, &
                     ...
                     setfvalue3d_bytebyte_llf_ti_li, &
                     ...
  end interface setFillValue

setfillvalue
------------

::

  interface writegrid
    module procedure writegrid2d_byte_llf, &
                     ...
                     writegrid3d_byte_llf_ti, &
                     ...
                     writegrid4d_byte_llf_ti_li, &
                     ...
  end interface writegrid

gengrid
-------

::

  interface gengrid
    module procedure gengrid2d_byte_llf, &
                     ...
                     gengrid3d_byte_llf_ti, &
                     ...
                     gengrid4d_byte_llf_ti_li, &
                     ...
  end interface gengrid

dealloc
-------

::

  interface dealloc
    module procedure dealloc2d_byte_llf, &
                     ...
                     dealloc3d_byte_llf_ti, &
                     ...
                     dealloc4d_byte_llf_ti_li, &
                     ...
  end interface dealloc

