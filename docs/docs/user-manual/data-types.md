---
sidebar_position: 3
---

# Data Type Structures

Structures can be defined in five data types (`byte`, `short`, `integer`, `float`, `double`) and in up to 4 dimensions. The FPL structure naming follows the syntax below:

## Naming Convention

```
nc[2d,3d,4d]_[byte,short,int,float,double]_ll[f,d]_t[i,f,d]_l[i,f]
```

| Component      | Options                                   | Description                  |
| -------------- | ----------------------------------------- | ---------------------------- |
| `nc[2d,3d,4d]` | `2d`, `3d`, `4d`                          | Dimension nomination         |
| `_[type]`      | `byte`, `short`, `int`, `float`, `double` | Variable data type           |
| `_ll[f,d]`     | `f` (float), `d` (double)                 | Coordinate (lon/lat) type    |
| `_t[i,f,d]`    | `i` (integer), `f` (float), `d` (double)  | Time type _(3D and 4D only)_ |
| `_l[i,f]`      | `i` (integer), `f` (float)                | Level type _(4D only)_       |

### Examples

```fortran
type(nc2d_double_llf) :: grid2d          ! 2D double, float coordinates
type(nc3d_int_llf_ti) :: grid3d          ! 3D integer, float coords, integer time
type(nc4d_short_lld_ti_li) :: grid4d     ! 4D short, double coords, int time, int level
```

## Structure Fields

All types share common fields. Fields marked with **[U]** are set by the user; fields marked with **[R]** are populated when reading data.

| Field        | Type                  | Description                               |
| ------------ | --------------------- | ----------------------------------------- |
| `varname`    | `character`           | Variable name **[U]**                     |
| `lonname`    | `character`           | Longitude dimension name **[U]**          |
| `latname`    | `character`           | Latitude dimension name **[U]**           |
| `timename`   | `character`           | Time dimension name _(3D/4D)_ **[U]**     |
| `levelname`  | `character`           | Level dimension name _(4D)_ **[U]**       |
| `long_name`  | `character`           | Long name / title **[U][R]**              |
| `varunits`   | `character`           | Variable units **[U][R]**                 |
| `lonunits`   | `character`           | Longitude units **[U][R]**                |
| `latunits`   | `character`           | Latitude units **[U][R]**                 |
| `timeunits`  | `character`           | Time units _(3D/4D)_ **[U][R]**           |
| `levelunits` | `character`           | Level units _(4D)_ **[U][R]**             |
| `dimname`    | `character(:)`        | Dimension names array **[R]**             |
| `dimunits`   | `character(:)`        | Dimension units array **[R]**             |
| `nlons`      | `integer`             | Number of longitudes **[U][R]**           |
| `nlats`      | `integer`             | Number of latitudes **[U][R]**            |
| `ntimes`     | `integer`             | Number of time steps _(3D/4D)_ **[U][R]** |
| `nlevels`    | `integer`             | Number of levels _(4D)_ **[U][R]**        |
| `ndims`      | `integer`             | Number of dimensions **[R]**              |
| `vartype`    | `integer`             | NetCDF type number **[R]**                |
| `FillValue`  | varies                | Fill / missing value **[U][R]**           |
| `longitudes` | `float/double(:)`     | Longitude array **[R]**                   |
| `latitudes`  | `float/double(:)`     | Latitude array **[R]**                    |
| `times`      | `int/float/double(:)` | Time array _(3D/4D)_ **[R]**              |
| `levels`     | `int/float(:)`        | Level array _(4D)_ **[R]**                |
| `ncdata`     | varies                | Data array **[R]**                        |
| `dimid`      | `integer(:)`          | Dimension IDs **[R]**                     |
| `dimsize`    | `integer(:)`          | Dimension sizes **[R]**                   |
| `varids`     | `integer(:)`          | Variable IDs **[R]**                      |
| `dims`       | `integer(2/3/4)`      | Variable dimension IDs **[R]**            |

## Code Example — Set Dataset Fields

```fortran
program main
  use fpl
  implicit none

  type(nc4d_float_llf_ti_li) :: grid4d

  ! Set metadata
  grid4d%long_name  = "My Grid  ~ 1 degree"
  grid4d%varname    = "grid"
  grid4d%lonname    = "lon"
  grid4d%latname    = "lat"
  grid4d%timename   = "time"
  grid4d%levelname  = "level"

  grid4d%varunits   = "dimensionless"
  grid4d%lonunits   = "degrees_east"
  grid4d%latunits   = "degrees_north"
  grid4d%timeunits  = "hour"
  grid4d%levelunits = "m"

  grid4d%ntimes     = 10
  grid4d%nlevels    = 5
  grid4d%FillValue  = -9999

  ! Print metadata
  write(*,*) "Grid 4d info ================================="
  write(*,'(a13,a20)')   "varname:    ", grid4d%varname
  write(*,'(a13,a20)')   "timename:   ", grid4d%timename
  write(*,'(a13,a20)')   "levelname:  ", grid4d%levelname
  write(*,'(a13,i4)')    "ntimes:     ", grid4d%ntimes
  write(*,'(a13,i4)')    "nlevels:    ", grid4d%nlevels
  write(*,'(a13,f10.4)') "FillValue:  ", grid4d%FillValue
end program main
```

### Compile & Run

```bash
gfortran -o setfields.out setfields.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./setfields.out
```
