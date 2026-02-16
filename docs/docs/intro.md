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

The main module `src/FPL.f90` aggregates all components via CPP `#include` directives and compiles as a shared library:

```fortran
module FPL
  use omp_lib
  use netcdf
  use iso_c_binding
  implicit none
#include "FPL_constants.f90"
#include "FPL_datatypes.f90"
#include "FPL_interfaces.f90"

  contains
#include "FPL_checkerror.f90"
#include "FPL_datetime.f90"
#include "FPL_griddims.f90"
#include "FPL_readgrid.f90"
#include "FPL_writegrid.f90"
#include "FPL_setfillvalue.f90"
#include "FPL_gengrid.f90"
#include "FPL_dealloc.f90"
#include "FPL_fileutils.f90"
#include "FPL_misc.f90"
#include "FPL_sort.f90"
end module FPL
```

The compiler flag `-cpp` tells `gfortran` to expand the preprocessor macros at compile time.

### Source Modules

| File                   | Lines | Description                                              |
| ---------------------- | ----- | -------------------------------------------------------- |
| `FPL_setfillvalue.f90` | 4,033 | Fill value masking with OpenMP `parallel do`             |
| `FPL_writegrid.f90`    | 1,133 | Write grids to NetCDF-4 (HDF5 format)                    |
| `FPL_datatypes.f90`    | 1,133 | 100 derived type definitions via CPP templates           |
| `FPL_interfaces.f90`   | 1,054 | Generic interfaces (static polymorphism)                 |
| `FPL_readgrid.f90`     | 833   | Read variables and coordinates from NetCDF               |
| `FPL_gengrid.f90`      | 833   | Generate regular grids from bounding box                 |
| `FPL_griddims.f90`     | 633   | Read NetCDF dimensions (lon, lat, time, level)           |
| `FPL_dealloc.f90`      | 633   | Memory deallocation with `stat=` checks                  |
| `FPL_checkerror.f90`   | 205   | Error handling with colored output (pure Fortran)        |
| `FPL_fileutils.f90`    | 111   | File utilities: `file_exists`, `countkeys`, `readheader` |
| `FPL_datetime.f90`     | 77    | System date/time (`fdate_time`, `exec_time`)             |
| `FPL_sort.f90`         | 57    | Bubble sort for dimension ID ordering                    |
| `FPL_constants.f90`    | 49    | Physical constants and type aliases via `iso_c_binding`  |
| `FPL_misc.f90`         | 39    | Library version                                          |
| `templates/*.inc`      | 942   | 21 CPP template files (7 modules × 3 dimensions)         |
| `generate_cpp.py`      | 239   | Python generator for `.f90` instantiation files          |
| `FPL_dealloc.f90`      | 833   | Memory deallocation with `stat=` checks                  |
| `FPL_checkerror.f90`   | 205   | Error handling with colored output (pure Fortran)        |
| `FPL_fileutils.f90`    | 111   | File utilities: `file_exists`, `countkeys`, `readheader` |
| `FPL_datetime.f90`     | 77    | System date/time (`fdate_time`, `exec_time`)             |
| `FPL_sort.f90`         | 57    | Bubble sort for dimension ID ordering                    |
| `FPL_constants.f90`    | 49    | Physical constants and type aliases via `iso_c_binding`  |
| `FPL_misc.f90`         | 39    | Library version                                          |

## Architecture Diagrams

### System Context (C1)

High-level view of FPL and its external dependencies.

![C1 — System Context](/diagrams/c4_context.png)

### Containers (C2)

Main artifacts that compose the FPL build system.

![C2 — Containers](/diagrams/c4_container.png)

### Components (C3)

Internal modules of the FPL library and their relationships.

![C3 — Components](/diagrams/c4_component.png)

## Code Generation

FPL uses the **C preprocessor (CPP)** to handle the combinatorial explosion of subroutines for each type/dimension combination. The system has two layers:

1. **Template files** (`src/templates/*.inc`) — Fortran source with CPP macro placeholders (`FPL_TYPE`, `FPL_SUBR`, etc.), maintained manually
2. **Generator script** (`src/generate_cpp.py`) — Python script that produces `.f90` files with `#define`/`#include`/`#undef` blocks for every type combination

The compiler flag `-cpp` tells `gfortran` to expand the macros at compile time. To regenerate:

```bash
python3 src/generate_cpp.py
make clean && make
```

See the [Contributing](contributing) guide for details on adding new templates.

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
