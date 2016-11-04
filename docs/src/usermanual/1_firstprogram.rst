How to Start
************

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

Save as file and compiling using gfortran.

.. highlight:: sh

::

   #Fedora  based systems
   gfortran -o myfirstprogram.out fp.f90 -I/usr/lib64/gfortran/modules/ -lf90NetCDF
   #Debian based systems
   gfortran -o myfirstprogram.out fp.f90 -I/usr/include/ -lf90NetCDF
