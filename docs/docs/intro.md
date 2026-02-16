---
sidebar_position: 1
slug: /
---

# FPL — Fortran Processing Library

**FPL** is a Fortran 90 library designed to facilitate the reading, writing, and processing of data in [NetCDF](http://www.unidata.ucar.edu/software/netcdf/) format using dynamic data structures and [OpenMP](http://openmp.org/) for parallel processing.

Developed at the [Federal University of Viçosa](https://www.ufv.br/) (UFV), Brazil — Research Group on Atmosphere-Biosphere Interaction — by [Fernando Martins Pimenta](http://lattes.cnpq.br/0646984654461300).

## Features

- **NetCDF I/O** — Read and write 2D, 3D, and 4D grids with support for byte, short, int, float, and double data types
- **Grid generation** — Create regular grids from bounding box and resolution parameters
- **Fill value masking** — Apply spatial masks using `_FillValue` with OpenMP parallelization
- **Cache-optimized** — Column-major loop ordering for optimal Fortran memory access patterns
- **Robust error handling** — Allocation checks with `stat=`, explicit `intent` declarations, pure Fortran diagnostics
- **Shared library** — Compiles as `libFPL.so` for easy linking

## Architecture

The main module `src/FPL.f90` aggregates all components via Fortran `include` statements and compiles as a shared library:

```fortran
module FPL
  use omp_lib
  use netcdf
  use iso_c_binding
  implicit none
  include "FPL_constants.f90"
  include "FPL_datatypes.f90"
  include "FPL_interfaces.f90"

  contains
  include "FPL_checkerror.f90"
  include "FPL_datetime.f90"
  include "FPL_griddims.f90"
  include "FPL_readgrid.f90"
  include "FPL_writegrid.f90"
  include "FPL_setfillvalue.f90"
  include "FPL_gengrid.f90"
  include "FPL_dealloc.f90"
  include "FPL_fileutils.f90"
  include "FPL_misc.f90"
  include "FPL_sort.f90"
end module FPL
```

### Source Modules (~49,900 lines)

| File | Lines | Description |
|---|---|---|
| `FPL_setfillvalue.f90` | 17,036 | Fill value masking with OpenMP `parallel do` |
| `FPL_writegrid.f90` | 9,073 | Write grids to NetCDF-4 (HDF5 format) |
| `FPL_griddims.f90` | 7,283 | Read NetCDF dimensions (lon, lat, time, level) |
| `FPL_gengrid.f90` | 7,233 | Generate regular grids from bounding box |
| `FPL_readgrid.f90` | 5,173 | Read variables and coordinates from NetCDF |
| `FPL_datatypes.f90` | 1,643 | ~60 derived type definitions |
| `FPL_interfaces.f90` | 1,055 | Generic interfaces (static polymorphism) |
| `FPL_dealloc.f90` | 833 | Memory deallocation with `stat=` checks |
| `FPL_checkerror.f90` | 205 | Error handling with colored output (pure Fortran) |
| `FPL_fileutils.f90` | 111 | File utilities: `file_exists`, `countkeys`, `readheader` |
| `FPL_datetime.f90` | 77 | System date/time (`fdate_time`, `exec_time`) |
| `FPL_sort.f90` | 57 | Bubble sort for dimension ID ordering |
| `FPL_constants.f90` | 49 | Physical constants and type aliases via `iso_c_binding` |
| `FPL_misc.f90` | 39 | Library version |

## Code Generation

The `shell_gencodes/` directory contains Bash scripts that **automatically generate** the combinatorial explosion of subroutines for each type/dimension combination — this explains the source files with thousands of lines of repetitive code.

## License

FPL is free software licensed under the [GNU General Public License v3.0](http://www.gnu.org/licenses/).

## Citing FPL

> PIMENTA, F. M. **FPL - Fortran Processing Library** (Version 1.0) [Software]. (2016). Viçosa, Minas Gerais - Brazil. [http://www.biosfera.dea.ufv.br](http://www.biosfera.dea.ufv.br).

## Support

[![Atmosphere-Biosphere Research Group](/img/logo_grupo_en_verde.png)](http://www.biosfera.dea.ufv.br)

## Quick Links

- [GNU Fortran Compiler](https://gcc.gnu.org/onlinedocs/gfortran/)
- [NetCDF Library](http://www.unidata.ucar.edu/software/netcdf/)
- [Fortran 90 Documentation](http://www.fortran90.org/)
- [Fortran Standards](https://gcc.gnu.org/wiki/GFortranStandards)
- [OpenMP Specifications](http://openmp.org/wp/openmp-specifications/)
