readgrid subroutine
*******************

.. highlight:: fortran
   :linenothreshold: 2

Reads NetCDF files.

Hou to use
==========

.. f:subroutine:: readgrid(ifile, idata)

    :p ifile: dataset file path `[character]` [#f1]_
    :p idata: map structure to be readed `[f90NetCDF defined type structure]` [#f1]_

.. [#f1] Defined by user 


[Code example] Read info from NetCDF file in fortran 90
-------------------------------------------------------

Read a dataset.

.. literalinclude:: fortran/5_readgrid.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o readgrid.out readgrid.f90 -I/usr/lib64/gfortran/modules/ -lf90NetCDF
   
   #Debian based systems
   gfortran -o readgrid.out readgrid.f90 -I/usr/include/ -lf90NetCDF

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(f90NetCDF_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./readgrid.f90``

