How to Start
************

Build the library according to :ref:`buildlib`.

First program
=============

.. highlight:: fortran
   :linenothreshold: 2

Create a program in fortran 90 standard using the FPL module.

::

  program myfirstprogram
    use fpl !FPL module
    implicit none
    write(*,*) "This is my first program using " fpl_libversion()
  end program myfirstprogram

Save as file (**myfirstprogram.f90**) and compiling using **gfortran**.

.. highlight:: sh

::

   #RedHat based systems
   gfortran -o myfirstprogram.out myfirstprogram.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o myfirstprogram.out myfirstprogram.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./myfirstprogram.out``

