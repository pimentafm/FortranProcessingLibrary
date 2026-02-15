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

### Installation of dependencies

**Debian / Ubuntu:**

```bash
sudo apt install gfortran libnetcdf-dev libnetcdff-dev make
```

**Fedora / RHEL:**

```bash
sudo dnf install gcc-gfortran netcdf-devel netcdf-fortran-devel make
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

The main module `src/FPL.f90` aggregates all source files via Fortran `include` statements, using `omp_lib`, `netcdf`, and `iso_c_binding`. It is compiled as a shared library (`libFPL.so`) with `gfortran -O3 -shared -fPIC -fopenmp`.

### Source Modules (~49,900 lines)

| File                   | Lines  | Description                                                                                       |
| ---------------------- | ------ | ------------------------------------------------------------------------------------------------- |
| `FPL_setfillvalue.f90` | 17,036 | FillValue mask application (parallelized with OpenMP `!$omp parallel do`)                         |
| `FPL_writegrid.f90`    | 9,073  | Grid writing to NetCDF (HDF5 format), with custom header file support                             |
| `FPL_griddims.f90`     | 7,283  | Dimension reading (lon, lat, time, level) from NetCDF files                                       |
| `FPL_gengrid.f90`      | 7,233  | Regular grid generation from Xmin/Ymin/Xmax/Ymax/resolution                                       |
| `FPL_readgrid.f90`     | 5,173  | Variable and coordinate reading from NetCDF                                                       |
| `FPL_datatypes.f90`    | 1,643  | Definition of ~60 derived types                                                                   |
| `FPL_interfaces.f90`   | 1,055  | Generic interfaces (static polymorphism)                                                          |
| `FPL_dealloc.f90`      | 833    | Memory deallocation for all types (with `stat=` error handling)                                   |
| `FPL_checkerror.f90`   | 205    | Error handling with colored messages, `print_filename`, `check_alloc` (pure Fortran, no `system`) |
| `FPL_fileutils.f90`    | 111    | Utilities: `file_exists`, `countkeys`, `readheader`, row counter                                  |
| `FPL_datetime.f90`     | 77     | System date/time (`fdate_time`, `exec_time`)                                                      |
| `FPL_sort.f90`         | 57     | Bubble sort for dimension ID ordering                                                             |
| `FPL_constants.f90`    | 49     | Physical constants (pi, Earth radius, Boltzmann, etc.) and type aliases via `iso_c_binding`       |
| `FPL_misc.f90`         | 39     | Library version                                                                                   |

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

The `setFillValue` routines use `!$omp parallel do` on the lon/lat loops — the most computationally expensive operation on large datasets. Loop order follows Fortran column-major convention (inner loop over the first array dimension) for optimal cache performance. The Makefile compiles with `-fopenmp`.

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

## Recent Improvements

### Performance

- **Loop order optimization** — All 1,000 loop nests in `FPL_setfillvalue.f90` were reordered to iterate the first array dimension (longitude) in the inner loop, matching Fortran's column-major memory layout for better cache utilization.

### Robustness

- **`intent` declarations** — Added `intent(in)`, `intent(inout)` to all 1,500 subroutine parameters across 500 subroutines (`readgrid`, `griddims`, `writegrid`, `gengrid`, `dealloc`, `setfillvalue`), enabling the compiler to catch misuse at compile time.
- **Allocation error handling** — All ~2,100 `allocate()` calls now use `stat=alloc_stat` and are followed by `call check_alloc(alloc_stat, "array_name")`, which prints a colored error message and stops on failure instead of segfaulting. All ~200 `deallocate()` calls use `stat=` to silently handle already-freed memory.
- **Eliminated `call system()`** — Replaced 3 non-portable shell calls in `FPL_checkerror.f90` with a pure Fortran `print_filename()` subroutine using `index(ifile, '/', back=.true.)`.

### Build System

- **Modern OS detection** — Makefile now uses `/etc/os-release` (with `lsb_release` fallback), supporting modern Fedora, RHEL, Rocky, Alma, Debian, Ubuntu, Mint, and Pop!\_OS.
- **Separate `build` and `install` targets** — `make` builds locally; `sudo make install` installs to system directories. Added `clean`, `uninstall`, and `help` targets.
- **Overridable paths** — `LIBDIR`, `MODDIR`, and `NETCDF` can be customized on the command line.

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
