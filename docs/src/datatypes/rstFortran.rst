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

.. f:function:: myfunc(a [,b])

    This is my primary function.

    :p float a: My first argument.
    :o integer b [optional]: My second argument.
    :from: :f:subr:`mysub`

.. f:subroutine:: mysub(a)

   Description.

   :param a: My parameter.
   :to: :f:func:`myfunc`

**Programme**

.. f:program:: make_stats

    Programm for computing statistics calcul des statistiques

**Module** :f:mod:`mymodule`

.. f:module:: mymodule
       :synopsis: Main statistical module

.. f:variable:: nx
       :type: integer
    :attrs: parameter=5

    Zonal dimension.

.. f:variable:: sst(nx)
       :type: float

    SST du modèle.

.. f:type:: obs

    Type that describes observations.

    :f x(nx): zonal axis.
    :ftype x: float
    :f float sst(nx): SST

.. f:subroutine:: stats(data, b, [c, d])

    Description of the routine.

    :param obs data: Data to analyse.
    :p integer a(nx,5) [in]: Also mandatory.
    :o float c [optional]: Optional.
    :o d: Also optional.
    :from: :f:prog:`make_stats`.
    :to: :f:func:`rms`

**Module** :f:mod:`special_stats`

.. f:module:: special_stats

.. f:function:: rms(mod, obs, unbiased)

    Compute RMS errors.

    :p float mod(nx) [in]: Model outputs.
    :p float obs(nx) [in]: Observations.
    :p logical mask(\:) [in]: Mask.
    :o logical unbiased [default=.true.]: Biased?
    :r rms(nx): Computed RMS.
    :rtype rms: float
    :from: :f:func:`mymodule/stats` :f:func:`~mymodule/stats` :f:subr:`stats` :f:func:`stats`

.. f:currentmodule::
