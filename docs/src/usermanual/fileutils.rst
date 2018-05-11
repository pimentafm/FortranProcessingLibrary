Other useful subroutines/functions
**********************************

.. highlight:: fortran
   :linenothreshold: 2

file_exists
===========

How to use
----------

.. f:subroutine:: file_exists(path)

    :p path: file path [#f1]_
    :call: :f:prog:`file_exists(path)`

numRows
==========

How to use
----------

.. f:subroutine:: numRows(unit)

    :p unit: file unit [#f1]_
    :call: :f:prog:`numRows(unit)`

.. [#f1] Defined by user 

[Code example] Reads a file, checks to see if it exists, and counts the number of rows.
---------------------------------------------------------------------------------------


.. literalinclude:: fortran/fileutils.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o fileutils.out fileutils.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o fileutils.out fileutils.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./fileutils.out``

.. attention:: 
   Change the file paths according to your system!

