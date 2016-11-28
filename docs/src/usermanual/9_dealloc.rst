dealloc subroutine
******************

.. highlight:: fortran
   :linenothreshold: 2

Dealloc data, longitudes, latitudes, times and levels from a dataset array.

Hou to use
==========

.. f:subroutine:: dealloc(idata)

    :p idata: map to be created `[FPL defined type structure]` [#f1]_
    :call: :f:prog:`dealloc(idata)`

.. [#f1] Defined by user 


[Code example] Deallocating of a dataset structure
--------------------------------------------------

Reusing the same structure to read multiple NetCDF files.

.. literalinclude:: fortran/9_dealloc.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o dealloc.out dealloc.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o dealloc.out dealloc.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./dealloc.out``

