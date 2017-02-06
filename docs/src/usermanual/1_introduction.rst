Introduction
************

Most scientists are familiar with NetCDF (|NETCDF|) processing using |NCL|.
However, when faced with problems involving large databases or massive processing, they need to use more efficient languages and parallel computing techniques to improve performance and processing.
This is not an easy task because the user needs to understand how fortran-NetCDF-OpenMP interaction works, in addition to programming enough for this.
Thinking about these problems, a set of modules was programmed in Fortran 90 to facilitate the development of applications using NetCDF and OpenMP.

.. |NETCDF| raw:: html

  <a href="http://www.unidata.ucar.edu/software/netcdf" target="_blank"> Network Common Data Form</a>

.. |NCL| raw:: html

  <a href="http://www.ncl.ucar.edu" target="_blank"> NCL - NCAR Command Language</a>
