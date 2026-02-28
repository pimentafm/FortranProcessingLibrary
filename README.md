# FPL - Fortran Processing Library

**Documentation:** [https://pimentafm.github.io/FortranProcessingLibrary/](https://pimentafm.github.io/FortranProcessingLibrary/)

**Legacy documentation:** [http://www.biosfera.dea.ufv.br/fpl/](http://www.biosfera.dea.ufv.br/fpl/)

Copyright (C) 2015 Fernando Martins Pimenta. Licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html).

**Author:** Fernando Martins Pimenta — [Research Group on Atmosphere-Biosphere Interaction](http://www.biosfera.dea.ufv.br/), Federal University of Viçosa, Brazil

**Contact:** fernando.m.pimenta@gmail.com | fernando.m.pimenta@ufv.br

<p align="center">
  <a href="https://github.com/pimentafm/FortranProcessingLibrary">
    <img alt="GitHub stars" src="https://img.shields.io/github/stars/pimentafm/FortranProcessingLibrary?style=flat-square&color=yellow">
  </a>
  <a href="https://github.com/pimentafm/FortranProcessingLibrary/issues">
    <img alt="GitHub issues" src="https://img.shields.io/github/issues/pimentafm/FortranProcessingLibrary?style=flat-square&color=orange">
  </a>
  <a href="https://github.com/pimentafm/FortranProcessingLibrary">
    <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/pimentafm/FortranProcessingLibrary?style=flat-square&color=blue">
  </a>
  <a href="https://github.com/pimentafm/FortranProcessingLibrary">
    <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/pimentafm/FortranProcessingLibrary?style=flat-square&color=blue">
  </a>
  <a href="https://github.com/pimentafm/FortranProcessingLibrary/blob/master/LICENSE">
    <img alt="License: GPL v3" src="https://img.shields.io/badge/license-GPLv3-blue?style=flat-square">
  </a>
  <a href="https://github.com/pimentafm">
    <img alt="Made by Fernando Pimenta" src="https://img.shields.io/badge/author-Fernando%20Pimenta-blue?style=flat-square">
  </a>
</p>

<p align="center">
  <img alt="Fortran" src="https://img.shields.io/badge/Fortran_90-734F96?style=for-the-badge&logo=fortran&logoColor=white">
  <img alt="NetCDF" src="https://img.shields.io/badge/NetCDF-1abc9c?style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAA0SURBVDhPYxgFgwkwMjD8B2IGKM0ABYxQGgUwQWkUMApKowAmKI0CmKA0CmCC0ihg4AEAG1YEL0GpVDsAAAAASUVORK5CYII=&logoColor=white">
  <img alt="OpenMP" src="https://img.shields.io/badge/OpenMP-2188b6?style=for-the-badge">
  <img alt="HDF5" src="https://img.shields.io/badge/HDF5-0075B8?style=for-the-badge">
</p>

<hr>

## Requirements

| Dependency         | Description                                      |
| ------------------ | ------------------------------------------------ |
| **GFortran**       | GNU Fortran compiler (part of GCC)               |
| **NetCDF**         | Network Common Data Form libraries               |
| **NetCDF-Fortran** | Fortran bindings for NetCDF (`libnetcdff`)       |
| **OpenMP**         | Multi-threading support (included with GFortran) |
| **Make**           | Build automation tool                            |
| **Python 3**       | Code generation script (`generate_cpp.py`)       |

### Installation of dependencies

**Debian / Ubuntu:**

```bash
sudo apt install gfortran libnetcdf-dev libnetcdff-dev make python3
```

**Fedora / RHEL:**

```bash
sudo dnf install gcc-gfortran netcdf-devel netcdf-fortran-devel make python3
```

<hr>

## How to build and install

Download FPL from [GitHub](https://github.com/pimentafm/FortranProcessingLibrary).

**Build the library (local):**

```bash
cd FortranProcessingLibrary
make
```

**Install to system directories (needs root):**

```bash
sudo make install
```

**Other targets:**

```bash
make clean       # Remove local build artifacts
make uninstall   # Remove from system dirs
make help        # Show all targets and overridable variables
```

You can override paths if needed:

```bash
make LIBDIR=/custom/lib MODDIR=/custom/include NETCDF="-I/custom/include -lnetcdff -lnetcdf"
```

<hr>

## Architecture

The main module `src/FPL.f90` aggregates all source files via CPP `#include` directives, using `omp_lib`, `netcdf`, and `iso_c_binding`. It is compiled as a shared library (`libFPL.so`) with `gfortran -O3 -shared -fPIC -fopenmp -cpp`.

### Source Modules

Generated `.f90` files use CPP `#define`/`#include`/`#undef` blocks that expand templates from `src/templates/*.inc` at compile time.

| File                   | Lines | Description                                                                                       |
| ---------------------- | ----- | ------------------------------------------------------------------------------------------------- |
| `FPL_setfillvalue.f90` | 4,033 | FillValue mask application (parallelized with OpenMP `!$omp parallel do`)                         |
| `FPL_zonalstats.f90`   | 4,033 | Zonal statistics with OpenMP parallelization (reduction, parallel do, collapse)                   |
| `FPL_writegrid.f90`    | 1,133 | Grid writing to NetCDF (HDF5 format), with custom header file support                             |
| `FPL_interfaces.f90`   | 1,557 | Generic interfaces (static polymorphism)                                                          |
| `FPL_datatypes.f90`    | 1,133 | Definition of 100 derived types via CPP templates                                                 |
| `FPL_readgrid.f90`     | 833   | Variable and coordinate reading from NetCDF                                                       |
| `FPL_gengrid.f90`      | 833   | Regular grid generation from Xmin/Ymin/Xmax/Ymax/resolution                                       |
| `FPL_griddims.f90`     | 633   | Dimension reading (lon, lat, time, level) from NetCDF files                                       |
| `FPL_dealloc.f90`      | 633   | Memory deallocation for all types (with `stat=` error handling)                                   |
| `FPL_checkerror.f90`   | 205   | Error handling with colored messages, `print_filename`, `check_alloc` (pure Fortran, no `system`) |
| `FPL_fileutils.f90`    | 111   | Utilities: `file_exists`, `countkeys`, `readheader`, row counter                                  |
| `FPL_datetime.f90`     | 77    | System date/time (`fdate_time`, `exec_time`)                                                      |
| `FPL_sort.f90`         | 57    | Bubble sort for dimension ID ordering                                                             |
| `FPL_constants.f90`    | 49    | Physical constants (pi, Earth radius, Boltzmann, etc.) and type aliases via `iso_c_binding`       |
| `FPL_misc.f90`         | 39    | Library version                                                                                   |
| `templates/*.inc`      | 1,084 | 24 CPP template files (8 modules × 3 dimensionalities)                                            |
| `generate_cpp.py`      | 271   | Python script to generate `.f90` from templates                                                   |

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
- **`zonalStats`** → compute per-zone aggregate statistics
- **`gengrid`** → generate regular grid
- **`dealloc`** → deallocate memory

<hr>

## Parallelization (OpenMP)

The `setFillValue` and `zonalStats` routines use OpenMP parallelization:

- **`setFillValue`**: `!$omp parallel do` on the lon/lat loops
- **`zonalStats` (2D)**: `!$omp parallel do` with `reduction` on accumulation arrays across the latitude loop
- **`zonalStats` (3D)**: `!$omp parallel do` on the time loop (each timestep is independent)
- **`zonalStats` (4D)**: `!$omp parallel do collapse(2)` on the level/time loops

Loop order follows Fortran column-major convention (inner loop over the first array dimension) for optimal cache performance. The Makefile compiles with `-fopenmp`.

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

FPL uses the **C preprocessor (CPP)** to generate the combinatorial explosion of subroutines for each type/dimension combination. The system has two layers:

1. **Template files** (`src/templates/*.inc`) — Fortran source with CPP macro placeholders (`FPL_TYPE`, `FPL_SUBR`, etc.)
2. **Generator script** (`src/generate_cpp.py`) — Python script that produces `.f90` files with `#define`/`#include`/`#undef` blocks for every type combination

The compiler flag `-cpp` tells `gfortran` to expand the macros at compile time.

To regenerate after modifying templates or type definitions:

```bash
python3 src/generate_cpp.py
make clean && make
```

<hr>

## Examples

The `examples/` directory contains complete programs demonstrating all library features:

| Example | Description                                |
| ------- | ------------------------------------------ |
| `ex0`   | Library test                               |
| `ex1`   | Read and write NetCDF grids                |
| `ex2`   | Get variable info from NetCDF              |
| `ex3`   | Date and time utilities                    |
| `ex4`   | Generate regular grids                     |
| `ex5`   | File utilities                             |
| `ex6`   | Memory deallocation                        |
| `ex7`   | Zonal statistics (2D)                      |
| `ex8`   | Zonal statistics (3D)                      |
| `ex9`   | Zonal statistics with spatial masking (2D) |
| `ex10`  | Zonal statistics with spatial masking (3D) |

Build and run an example:

```bash
make
cd examples
gfortran -o ex1.out ex1_readwrite.f90 -I../build -L../build -lFPL $(nf-config --fflags --flibs) -fopenmp
./ex1.out
```

<hr>
