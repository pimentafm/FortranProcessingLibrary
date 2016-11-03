checkerror
----------

ncoords
-------

readgrid
--------

writegrid
---------

setfillvalue
------------

gengrid
-------

dealloc
-------


.. highlight:: fortran
   :linenothreshold: 2

Interfaces can be used to invoke different functions using the same name.

::

   !f90NetCDF_interfaces.f90  

   interface check
     module procedure checkerror, checktype, checkatt
   end interface check
   
   !All subroutine interfaces can be seen in the file f90NetCDF/src/f90NetCDF_interfaces.f90
   interface ncoords
     module procedure ncoords2d_byte_llf, &
                   ...
                   ncoords3d_byte_llf_ti, &
                   ...
                   ncoords4d_byte_llf_ti_li, &
                   ...
   end interface ncoords
   
   interface readgrid
     module procedure readgrid2d_byte_llf, &
                   ...
                   readgrid3d_byte_llf_ti, &
                   ...
                   readgrid4d_byte_llf_ti_li, &
                   ...
   end interface readgrid
   
   interface writegrid
     module procedure writegrid2d_byte_llf, &
                   ...
                   writegrid3d_byte_llf_ti, &
                   ...
                   writegrid4d_byte_llf_ti_li, &
                   ...
   end interface writegrid
   
   interface setFillValue
     module procedure setfvalue2d_bytebyte_llf, &
                   ...
                   setfvalue3d_bytebyte_llf_ti, &
                   ...
                   setfvalue3d_bytebyte_llf_ti_li, &
                   ...
   end interface setFillValue
