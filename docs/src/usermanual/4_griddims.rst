griddims subroutine
*******************

.. highlight:: fortran
   :linenothreshold: 2

Inquire about the coordinates, time, level and variable type of a NetCDF dataset.

How to use
==========

.. f:subroutine:: griddims(ifile,idata)

    :p ifile: dataset file path `[character]` [#f1]_
    :p idata: map structure to be readed. See :ref:`structurefields`. [#f1]_
    :r ndims: number of dimensions of variable
    :r nlons: number of longitudes
    :r nlats: number of latitudes
    :r ntimes: number of times ``[3d and 4d datasets]``
    :r nlevels: number of levels ``[4d datasets]``
    :r lonunits: longitude units
    :r latunits: latitude units
    :r timeunits: time units ``[3d and 4d datasets]``
    :r levelunits: level units ``[4d datasets]``
    :r vartype: variable type
    :r varunits: variable units
    :r long_name: long name
    :r _FillValue: fill value
    :call: :f:prog:`griddims(ifile,idata)`

.. [#f1] Defined by user 


[Code example] Read dataset information
---------------------------------------

Get the number of latitudes and longitudes of a file.

.. literalinclude:: fortran/4_griddims.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o griddims.out griddims.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o griddims.out griddims.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./griddims.out``

