How to Start
************

Build the library according to :ref:`buildlib`.

First program
=============

.. highlight:: fortran
   :linenothreshold: 2

Create a program in fortran 90 standard using the f90NetCDF module.

::

  program myfirstprogram
    use f90netcdf !f90NetCDF module
    implicit none
    write(*,*) "This is my first program using " f90NetCDF_libversion()
  end program myfirstprogram

Save as file (**myfirstprogram.f90**) and compiling using **gfortran**.

.. highlight:: sh

::

   #RedHat based systems
   gfortran -o myfirstprogram.out myfirstprogram.f90 -I/usr/lib64/gfortran/modules/ -lf90NetCDF
   
   #Debian based systems
   gfortran -o myfirstprogram.out myfirstprogram.f90 -I/usr/include/ -lf90NetCDF

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(f90NetCDF_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./myfirstprogram.out``

