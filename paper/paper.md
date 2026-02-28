---
title: 'FPL: A Fortran Processing Library for NetCDF Data with OpenMP Parallelization'
tags:
  - Fortran
  - NetCDF
  - scientific computing
  - geospatial data
  - OpenMP
  - climate science
authors:
  - name: Fernando Martins Pimenta
    orcid: 0000-0002-7589-5721
    affiliation: 1
affiliations:
  - name: Agricultural Engineering Department, Federal University of Viçosa, Av. P. H. Rolfs, s/n Viçosa, MG 36570-900, Brazil
    index: 1
date: 27 February 2026
bibliography: paper.bib
---

# Summary

The Fortran Processing Library (FPL) is a set of high-level Fortran 90
structures that simplify the handling and development of applications based on
NetCDF datasets and parallel processing. FPL is intended to be a powerful and
easy-to-use Fortran 90 module for reading, writing, and processing NetCDF
datasets for scientists and programmers. The library supports 5 types of NetCDF
variables (`byte`, `short`, `int`, `float`, `double`) of up to 4 dimensions
(longitude, latitude, time, and level), and its structure is composed of 15
source files containing definitions of physical constants, abstract data types,
interfaces, intrinsic subroutines, functions, and error handling. FPL also
provides utilities for regular grid generation from bounding-box
specifications, FillValue-based spatial masking, zonal statistics computation,
file metadata inspection, and safe memory management. Both the masking and
zonal statistics routines are parallelized with OpenMP. The library compiles as
a single shared object (`libFPL.so`) and is designed for use in atmospheric
science, climate research, and geospatial data processing workflows written in
Fortran.

# Statement of Need

Most geoscientists are familiar with NetCDF (Network Common Data Form), a
self-described array-based data structure for storing multidimensional data and
a set of interfaces, libraries, and formats that support the creation, access,
and sharing of array-oriented data [@robinson2015ncio; @ravazzani2013mosaico].
The NetCDF libraries support a machine-independent format for representing
n-dimensional scientific data with multiple variables, grid types (regular and
irregular), and metadata, eliminating binary output dependencies in a particular
computing system and ensuring that the data is fully self-described within a
file [@rew1990netcdf]. When faced with problems involving large databases,
massive processing, and many data types, scientists need to use efficient
languages, parallel computing techniques, and data abstraction approaches to
improve performance and facilitate the handling of NetCDF datasets. This is not
a straightforward task because the user needs to understand how
Fortran--NetCDF--OpenMP interaction works, in addition to having sufficient
programming expertise.

The native NetCDF-Fortran API [@pincus2008netcdf] is inherently low-level:
reading a single variable requires opening the file, querying dimension IDs,
inquiring dimension lengths, allocating arrays, retrieving variable IDs, reading
coordinate variables, reading the data variable, extracting attributes, and
closing the file --- often spanning 30 or more lines of boilerplate code. This
verbosity is a significant source of programming errors and impedes rapid
prototyping.

FPL addresses this gap by providing generic interfaces (`readgrid`,
`writegrid`, `gengrid`, `griddims`, `setFillValue`, `zonalStats`, `dealloc`)
that reduce typical I/O and analysis operations to one or two subroutine calls. The user declares a
derived-type variable whose name encodes the desired combination of data type,
coordinate precision, and dimensionality (e.g., `nc4d_float_llf_tf_lf` for a
4D float variable with float coordinates, float time, and float levels), and
FPL handles all NetCDF bookkeeping internally. This design eliminates an entire
class of dimension-mismatch and type-mismatch bugs that are common when
interacting with the raw API.

The library is aimed at researchers and graduate students in atmospheric
sciences, climatology, oceanography, and remote sensing who write data
processing pipelines in Fortran and need a productive, type-safe interface to
NetCDF without leaving the Fortran ecosystem.

# State of the Field

Several tools exist for working with NetCDF data, but none occupy the same
niche as FPL:

- **NetCDF-Fortran** [@unidata_netcdff]: The official Fortran bindings provided
  by Unidata. This is a low-level API that maps directly to the C library
  calls. It provides maximum flexibility but requires substantial boilerplate
  for every I/O operation. FPL builds on top of NetCDF-Fortran rather than
  replacing it.

- **NCIO** [@robinson2015ncio]: A simple Fortran NetCDF interface that provides
  wrapper routines for reading and writing NetCDF files. NCIO focuses on
  simplifying individual read/write calls but does not provide derived types
  that bundle data with metadata, grid generation capabilities, or
  OpenMP-parallelized masking operations.

- **PyPnetCDF** [@galiano2010pypnetcdf]: A high-level Python framework for
  parallel access to NetCDF files. While it offers parallel I/O capabilities,
  it operates in the Python ecosystem and cannot be directly embedded in
  Fortran-based modeling workflows.

- **MOSAICO** [@ravazzani2013mosaico]: A Fortran library for raster-based
  hydrological applications that provides NetCDF I/O capabilities. MOSAICO is
  domain-specific to hydrological modeling and does not offer the generic
  multi-type, multi-dimensional interface that FPL provides.

- **CDO** (Climate Data Operators) [@schulzweida2019cdo] and **NCO** (NetCDF
  Operators) [@zender2008nco]: Command-line tool suites for processing NetCDF
  data. Both are powerful for batch operations but are not programmatic
  libraries --- they cannot be called from within a Fortran program's
  computational loop.

- **xarray** [@hoyer2017xarray]: A Python library that provides labeled,
  multi-dimensional arrays with NetCDF I/O. While xarray offers an excellent
  high-level interface, it operates in the Python ecosystem and cannot be
  directly used in Fortran-based modeling workflows.

FPL fills a specific gap: a **high-level Fortran-native library** with derived
types that bundle data and metadata, generic interfaces for compile-time type
safety, built-in grid generation, OpenMP-parallelized spatial masking, and
zonal statistics computation.

# Software Design

## Architecture

FPL is organized as a single Fortran module (`module FPL`) that aggregates all
functionality through C preprocessor (CPP) `#include` directives. The main
source file `src/FPL.f90` includes 15 component files that provide constants,
derived types, generic interfaces, and implementation subroutines. This
single-module design allows users to access all functionality with a single
`use fpl` statement. Since Fortran 90 is not object-oriented, classes are
emulated through a language constructor (the module) and its objects are
accessed through subroutines or functions [@decyk2008oop]. FPL uses this
approach to handle NetCDF datasets by defining them as abstract data types
encapsulated in a module containing sets of predefined operations.

## Code Generation Strategy

The central design challenge in FPL is the combinatorial explosion of type
specializations required by Fortran's strong static type system. Supporting 5
numeric types, 2 coordinate precisions, 3 time types, and 2 level types across
3 dimensionalities yields 100 distinct derived types and corresponding
procedure specializations for each generic interface. Writing and maintaining
these by hand would be impractical.

FPL addresses this through a two-level code generation strategy:

1. **CPP Templates** (24 `.inc` files in `src/templates/`): Each template
   implements a generic algorithm (e.g., `readgrid_2d.inc`) using CPP macros
   as placeholders for type-specific tokens. At compile time, the preprocessor
   expands each template once per type combination, producing the full set of
   specialized subroutines.

2. **Python Generator** (`src/generate_cpp.py`): A Python script generates the
   Fortran source files that contain the `#define`/`#include`/`#undef` blocks
   for each type combination. This script produces the derived type
   definitions, interface blocks, and all procedure wrappers.

This approach was chosen over Fortran 2003+ object-oriented features
(type-bound procedures, class polymorphism) for two reasons: (a) it produces
zero-overhead, fully specialized code with no runtime dispatch, and (b) it
maximizes portability across Fortran compilers that may have incomplete support
for advanced OOP features.

## Error Handling

The error handling follows the NetCDF error standards, augmented with a series
of subroutines capable of handling specific errors according to a given
specification. FPL uses a color system to return errors: BLUE for help messages,
ORANGE for warning messages, and RED for fatal errors. The specific error
handlers include `checkvarid` (checks if a variable name exists),
`checkdimid` (checks if a dimension name exists), `checktype` (checks if the
declared data type matches the data to be read), and `checkatt` (checks if
attributes exist within the NetCDF file).

## Parallelization

The `setFillValue` and `zonalStats` interfaces are parallelized with OpenMP
[@openmp5] directives. The `setFillValue` routine, which applies 2D masks to
2D, 3D, or 4D datasets, uses `!$omp parallel do` on the spatial loops. The
`zonalStats` routine computes per-zone aggregate statistics (count, sum, mean,
minimum, maximum) from a data grid grouped by a 2D zone/classification grid;
for 2D data it uses `!$omp parallel do` with `reduction` on the accumulation
arrays, for 3D data it parallelizes over the time dimension, and for 4D data it
uses `!$omp parallel do collapse(2)` over the level and time dimensions. All
loop orderings are optimized for Fortran's column-major memory layout, with the
innermost loop iterating over the first (longitude) dimension to maximize cache
utilization.

# Research Applications

The full documentation is available at
[https://pimentafm.github.io/FortranProcessingLibrary/](https://pimentafm.github.io/FortranProcessingLibrary/),
with legacy documentation at
[http://www.biosfera.dea.ufv.br/fpl/](http://www.biosfera.dea.ufv.br/fpl/).

FPL has been used in research conducted by the Atmosphere-Biosphere Interaction
group at the Federal University of Viçosa since 2015. In particular, the
library was used to process data from BHALU (Brazilian Historical Agricultural
Land Use) [@dias2016bhalu], a publicly available historical and spatial
reconstruction of land-use change patterns (1940--2012) and productivity
(1990--2012) in Brazil. FPL enabled the processing of soybean cropland datasets
at 30" spatial resolution (~1 km), including reading, filtering, spatial
masking by state boundaries, and writing the results --- all within a concise
Fortran program. This work supported the analysis published by
@dias2016patterns, which examined patterns of land use, extensification, and
intensification of Brazilian agriculture using data processed with FPL.

# AI Usage Disclosure

Claude Code (Anthropic) was used to assist in build system modernization,
code review, and preparation of the JOSS submission materials. All generated
output was reviewed and validated by the author.

# Acknowledgements

The author acknowledges the Federal University of Viçosa and the Research Group
on Atmosphere-Biosphere Interaction for many fruitful discussions and tests on
FPL. The author also acknowledges Unidata for developing and maintaining the
NetCDF libraries.

# References
