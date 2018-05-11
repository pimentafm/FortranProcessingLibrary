writegrid subroutine
********************

.. highlight:: fortran
   :linenothreshold: 2

Write NetCDF files.

How to use
==========

.. f:subroutine:: writegrid(ifile,idata,[headerfile])

    :p ifile: dataset file path `[character]` [#f1]_
    :p idata: map structure to be readed `[FPL defined type structure]` [#f1]_
    :o headerfile: text file with metadata informations `[character]` `[optional]`  [#f1]_
    :r file: NetCDF dataset
    :call: :f:prog:`writegrid(ifile,idata[,headerfile])`
 
.. [#f1] Defined by user 


[Code example] Write data to NetCDF
------------------------------------

Read netCDF temperature (°C) data, converts it to Farenheit and write other file.

.. literalinclude:: fortran/7_writegrid.f90
   :language: fortran

.. highlight:: sh

::

   #RedHat based systems
   gfortran -o writegrid.out writegrid.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o writegrid.out writegrid.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./writegrid.out``

