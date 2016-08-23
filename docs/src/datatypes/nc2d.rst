nc2d (NetCDF 2-dimensional [lon, lat] dataset)
``````````````````````````````````````````````

2-dimensional datasets are declared as follow:

.. highlight:: none

:prototype:

::

  type :: "**nc2d**"_<variable datatype>_ll<coordinates datatype>
    sequence
    character(len=100) :: varname, lonname, latname, long_name, varunits, &
                          lonunits, latunits
    integer(kind=intgr) :: nlons, nlats, vartype
    integer(kind=<variable datatype>) :: FillValue
    real(kind=<coordinates datatype>), dimension(:), allocatable :: longitudes, latitudes
    integer(kind=variable datatype), dimension(:,:), allocatable :: ncdata
  end type nc2d_<variavble datatype>_ll<coordinates datatype>

.. f:subroutine:: mysub(a)

   Description.

   :param a: My parameter.
   :to: :f:func:`myfunc`

.. f:function:: myfunc(a [,b])

    This is my primary function.

    :p float a: My first argument.
    :o integer b [optional]: My second argument.
    :from: :f:subr:`mysub`
