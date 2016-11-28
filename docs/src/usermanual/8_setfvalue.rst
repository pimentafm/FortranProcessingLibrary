setFillValue subroutine
***********************

.. highlight:: fortran
   :linenothreshold: 2

Set a Fill Value from a mask data in an array.

Hou to use
==========

.. f:subroutine:: setFillValue(mask,idata[,num])

    :p idata: map to be masked `[FPL defined type structure]`
    :p mask: mask `[FPL defined type structure]`
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
   gfortran -o setFillValue.out setFillValue.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o setFillValue.out setFillValue.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./setFillValue.out``

