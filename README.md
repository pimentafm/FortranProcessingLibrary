# FPL - Fortran Processing Library

```
 This file is part of FPL (Fortran Processing Library).
 Copyright (C) 2015 Fernando Martins Pimenta

  FPL is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  FPL is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with FPL.  If not, see <http://www.gnu.org/licenses/>.

 ===========================================================================
  About Author:
  Fernando Martins Pimenta
   Student of Surveying and Cartographic Engineering
   Federal University of Viçosa - Brazil

   Bachelor of Biosystems Engineer
   Federal University of São João del-Rei - Brazil

   Research Group on Atmosphere-Biosphere Interaction
   Federal University of Viçosa
   Data: August 09, 2015

 Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
```

<p align="center">
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/pimentafm/FortranProcessingLibrary?color=blue">

  <a href="https://github.com/pimentafm">
    <img alt="Made by Fernando Pimenta" src="https://img.shields.io/badge/made%20by-Fernando%20Pimenta-blue">
  </a>

  <img alt="License" src="https://img.shields.io/badge/license-GNUGPL-blue">
</p>

## Made with:

[![made-with-fortran](https://img.shields.io/badge/Fortran90-green.svg)](https://www.fortran90.org/)
[![made-with-fortran90netcdf !](https://img.shields.io/badge/Fortran%2090-NetCDF-1abc9c.svg)](https://GitHub.com/Naereen/ama)
[![made-with-openmp](https://img.shields.io/badge/OpemMP-2188b6.svg)](https://www.unidata.ucar.edu/software/netcdf/docs-fortran/)

<hr>

## How to install

Download FPL from [My Github](https://github.com/pimentafm/FortranProcessingLibrary).

Compile the library as root.

```bash
cd /FortranProcessingLibrary
make
```

<hr>

## Architecture

The main module `src/FPL.f90` aggregates all source files via Fortran `include` statements, using `omp_lib`, `netcdf`, and `iso_c_binding`. It is compiled as a shared library (`libFPL.so`) with `gfortran -O3 -shared -fPIC -fopenmp`.

### Source Modules (~47,300 lines)

| File                   | Lines  | Description                                                                                 |
| ---------------------- | ------ | ------------------------------------------------------------------------------------------- |
| `FPL_setfillvalue.f90` | 17,036 | FillValue mask application (parallelized with OpenMP `!$omp parallel do`)                   |
| `FPL_writegrid.f90`    | 8,773  | Grid writing to NetCDF (HDF5 format), with custom header file support                       |
| `FPL_griddims.f90`     | 6,683  | Dimension reading (lon, lat, time, level) from NetCDF files                                 |
| `FPL_gengrid.f90`      | 6,183  | Regular grid generation from Xmin/Ymin/Xmax/Ymax/resolution                                 |
| `FPL_readgrid.f90`     | 4,623  | Variable and coordinate reading from NetCDF                                                 |
| `FPL_datatypes.f90`    | 1,643  | Definition of ~60 derived types                                                             |
| `FPL_interfaces.f90`   | 1,055  | Generic interfaces (static polymorphism)                                                    |
| `FPL_dealloc.f90`      | 733    | Memory deallocation for all types                                                           |
| `FPL_checkerror.f90`   | 181    | Error handling with colored terminal messages (ANSI escape codes)                           |
| `FPL_fileutils.f90`    | 111    | Utilities: `file_exists`, `countkeys`, `readheader`, row counter                            |
| `FPL_datetime.f90`     | 77     | System date/time (`fdate_time`, `exec_time`)                                                |
| `FPL_sort.f90`         | 57     | Bubble sort for dimension ID ordering                                                       |
| `FPL_constants.f90`    | 49     | Physical constants (pi, Earth radius, Boltzmann, etc.) and type aliases via `iso_c_binding` |
| `FPL_misc.f90`         | 39     | Library version                                                                             |

<hr>

## Type System

The core of the library is a combinatorial scheme of derived types. Each type name encodes:

- **Dimensionality**: `nc2d` (lon, lat), `nc3d` (lon, lat, time), `nc4d` (lon, lat, time, level)
- **Variable type**: `byte`, `short`, `int`, `float`, `double`
- **Coordinate type**: `llf` (lon/lat float), `lld` (lon/lat double)
- **Time type**: `ti` (int), `tf` (float), `td` (double)
- **Level type**: `li` (int), `lf` (float)

Example: `nc4d_float_llf_tf_lf` = float variable, 4D, float coordinates, float time, float level.

Each type stores: `varname`, `longitudes(:)`, `latitudes(:)`, `ncdata(:,:,...)`, `FillValue`, metadata, dimension IDs, etc.

<hr>

## Generic Interfaces (Polymorphism)

The interfaces in `FPL_interfaces.f90` allow calling the same generic procedure for any type:

- **`check`** → `checkerror`, `checktype`, `checkatt`
- **`griddims`** → get dimensions from NetCDF (dispatch by type)
- **`readgrid`** → read data from NetCDF
- **`writegrid`** → write NetCDF (HDF5 format)
- **`setFillValue`** → apply FillValue mask between two variables
- **`gengrid`** → generate regular grid
- **`dealloc`** → deallocate memory

<hr>

## Parallelization (OpenMP)

The `setFillValue` routines use `!$omp parallel do` on the lon/lat loops — the most computationally expensive operation on large datasets. The Makefile compiles with `-fopenmp`.

<hr>

## Typical Usage Pipeline

```fortran
program main
  use fpl
  implicit none

  type(nc4d_float_llf_tf_lf) :: temp

  temp%varname   = "temp"
  temp%lonname   = "longitude"
  temp%latname   = "latitude"
  temp%timename  = "time"
  temp%levelname = "level"

  call readgrid("input.nc", temp)        ! read all data
  temp%ncdata = temp%ncdata * 1.8 + 32   ! process (e.g., Celsius to Fahrenheit)
  call writegrid("output.nc", temp)      ! write output
  call dealloc(temp)                     ! free memory
end program main
```

<hr>

## Code Generation

The `shell_gencodes/` directory contains Bash scripts that **automatically generate** the combinatorial explosion of subroutines for each type/dimension combination — this explains the source files with thousands of lines of repetitive code.

<hr>

## API and USER Documentation

The documentation can be found at [Research Group on Atmosphere-Biosphere](http://www.biosfera.dea.ufv.br/fpl/) website.

<hr>

```
TODO:
     [Partially OK] Parallelize the code.
     [Partially OK] Creategrid subroutine.
     [->] Implement zonal statistics subroutines/functions
     [->] Implement map plotting subroutines (GMT/Python/GNUPLOT ????).
     [->] Implement subroutines to convert datatypes.
     [->] Command Line Args subroutines
```

<hr>

Fernando Pimenta [My Github!](https://github.com/pimentafm)
