readgrid subroutine
*******************

.. highlight:: fortran
   :linenothreshold: 2

Reads NetCDF files.

Hou to use
==========

.. f:subroutine:: readgrid(ifile, idata)

    :p ifile: dataset file path `[character]` [#f1]_
    :p idata: map structure to be readed. See :ref:`structurefields`. [#f1]_
    :r idata: map structure with readed fields.
    :r fields: structure fields. See :ref:`structurefields`.
    :call: :f:prog:`readgrid(ifile,idata)`

.. [#f1] Defined by user 


[Code example] Read data from NetCDF
------------------------------------

Read a dataset.

.. literalinclude:: fortran/5_readgrid.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o readgrid.out readgrid.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o readgrid.out readgrid.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./readgrid.out``

