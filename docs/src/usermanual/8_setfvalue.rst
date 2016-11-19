setFillValue subroutine
***********************

.. highlight:: fortran
   :linenothreshold: 2

Set a Fill Value from a mask data in an array.

Hou to use
==========

.. f:subroutine:: setFillValue(mask,idata[,num])

    :p idata: map to be masked `[f90NetCDF defined type structure]`
    :p mask: mask `[f90NetCDF defined type structure]`
    :p num[optional]: Parameter filtering according to mask
    :call: :f:prog:`setFillValue(mask,map[,num])`

[Code example] Masks a NetCDF dataset
-------------------------------------

Masks the 23 years of brazilian cattle productivity to São Paulo using the states map.

.. literalinclude:: fortran/8_setfvalue.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o setFillValue.out setFillValue.f90 -I/usr/lib64/gfortran/modules/ -lf90NetCDF
   
   #Debian based systems
   gfortran -o setFillValue.out setFillValue.f90 -I/usr/include/ -lf90NetCDF

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(f90NetCDF_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./setFillValue.out``

