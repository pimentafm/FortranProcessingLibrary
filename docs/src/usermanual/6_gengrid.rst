gengrid subroutine
******************

.. highlight:: fortran
   :linenothreshold: 2

Generates grids from user-defined coordinates and resolution.

Hou to use
==========

.. f:subroutine:: gengrid(idata, Xmin, Ymin, Xmax, Ymax, res)

    :p idata: map to be created `[FPL defined type structure]` [#f1]_
    :p Xmin: westernmost longitude `[double or float]` [#f1]_
    :p Ymin: southernmost latitude `[double or float]` [#f1]_
    :p Xmax: easternmost longitude `[double or float]` [#f1]_
    :p Ymax: northernmost latitude `[double or float]` [#f1]_
    :p res: map resolution `[double or float]` [#f1]_
    :r idata: map structure with defined longitudes, latitudes and resolution `[FPL defined type structure]` [#f1]_
    :call: :f:prog:`gengrid(idata,Xmin,Ymin,Xmax,Ymax,res)`

.. [#f1] Defined by user 


[Code example] Create grided data
---------------------------------

Create a grid dataset from map extent ``-74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965`` and ``1.0`` degree resolution.

.. literalinclude:: fortran/6_gengrid.f90
   :language: fortran


.. highlight:: sh

::

   #RedHat based systems
   gfortran -o gengrid.out gengrid.f90 -I/usr/lib64/gfortran/modules/ -lFPL
   
   #Debian based systems
   gfortran -o gengrid.out gengrid.f90 -I/usr/include/ -lFPL

.. important::
   ``-I<dir>`` This option specifies where to put .mod files for compiled modules. It is also added to the list of directories to Influencing the linking step. `See the GNU Fortran Compiler Documentation <https://gcc.gnu.org/onlinedocs/gfortran/>`_ .
   
   ``<dir>`` is defined in Makefile as ``$(FPL_moddir)``. See :ref:`buildlib`.
   

After compilation run the program ``./gengrid.out``


