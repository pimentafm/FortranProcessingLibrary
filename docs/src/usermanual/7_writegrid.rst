writegrid subroutine
********************

.. highlight:: fortran
   :linenothreshold: 2

Write NetCDF files.

Hou to use
==========

.. f:subroutine:: writegrid(ifile,idata,[headerfile])

    :p ifile: dataset file path `[character]` [#f1]_
    :p idata: map structure to be readed `[f90NetCDF defined type structure]` [#f1]_
    :o headerfile: text file with metadata informations `[character]` `[optional]`  [#f1]_
    :r file: NetCDF dataset
    :call: :f:prog:`writegrid(ifile,idata[,headerfile])`
 
.. [#f1] Defined by user 


[Code example] Write data to NetCDF
------------------------------------

Write a NetCDF dataset.

.. literalinclude:: fortran/7_writegrid.f90
   :language: fortran

.. highlight:: sh

::

   #RedHat based systems
   gfortran -o writegrid.out writegrid.f90 -I/usr/lib64/gfortran/modules/ -lf90NetCDF
   
   #Debian based systems
   gfortran -o writegrid.out writegrid.f90 -I/usr/include/ -lf90NetCDF

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(f90NetCDF_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./writegrid.out``
