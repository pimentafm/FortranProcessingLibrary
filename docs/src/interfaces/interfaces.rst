.. highlight:: fortran
   :linenothreshold: 2

Interfaces can be seen in FPL/src/**FPL_interfaces.f90**

checkerror
----------

::

  interface check
    module procedure checkerror, checktype, checkatt
  end interface check

.. note::
  Some error checking subroutines are not in the interface list due to ambiguity problems.

griddims
--------

::

  interface griddims
    module procedure griddims2d_byte_llf, &
                      ...
                      griddims3d_byte_llf_ti, &
                      ...
                      griddims4d_byte_llf_ti_li, &
                      ...
  end interface griddims

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

