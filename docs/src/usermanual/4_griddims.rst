griddims subroutine
*******************

.. highlight:: fortran
   :linenothreshold: 2

Inquire about the coordinates, time, level and variable type of a NetCDF dataset.

Hou to use
==========

.. f:subroutine:: griddims(ifile,idata)

    :p ifile: dataset file path `[character]` [#f1]_
    :p idata: map structure to be readed `[f90NetCDF defined type structure]` [#f1]_
    :r nlons: number of longitudes
    :r nlats: number of latitudes
    :r ntimes: number of times ``[3d and 4d datasets]``
    :r nlevels: number of levels ``[4d datasets]``
    :r vartype: variable type of file
    :call: :f:prog:`griddims(ifile,idata)`

.. [#f1] Defined by user 


[Code example]  fortran 90
-----------------------------------------------

Get the number of latitudes and longitudes of a file.

.. literalinclude:: fortran/4_griddims.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o griddims.out griddims.f90 -I/usr/lib64/gfortran/modules/ -lf90NetCDF
   
   #Debian based systems
   gfortran -o griddims.out griddims.f90 -I/usr/include/ -lf90NetCDF

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(f90NetCDF_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./griddims.out``

