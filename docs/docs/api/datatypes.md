---
sidebar_position: 1
---

# Data Types

FPL defines structured types that hold NetCDF grid data, coordinates, metadata, and attributes in a single variable.

## Naming Convention

Type names follow the pattern:

```
nc{D}d_{type}_{coord}[_t{ttype}][_l{ltype}]
```

| Segment | Values | Meaning |
|---|---|---|
| `D` | `2`, `3`, `4` | Number of dimensions |
| `type` | `byte`, `short`, `int`, `float`, `double` | Data precision |
| `coord` | `llf`, `lld` | Coordinate precision (float / double) |
| `ttype` | `ti`, `tf`, `td` | Time dimension type (int / float / double) — 3D/4D only |
| `ltype` | `li`, `lf` | Level dimension type (int / float) — 4D only |

### Examples

| Type Name | Description |
|---|---|
| `nc2d_float_llf` | 2D float grid, float coordinates |
| `nc3d_int_lld_ti` | 3D integer grid, double coordinates, integer time |
| `nc4d_double_llf_tf_lf` | 4D double grid, float coords, float time, float levels |

## 2D Type Fields

```fortran
type :: nc2d_{type}_{coord}
  sequence
  character(len=100) :: varname      ! Variable name
  character(len=100) :: lonname      ! Longitude dimension name
  character(len=100) :: latname      ! Latitude dimension name
  character(len=100) :: long_name    ! Descriptive name
  character(len=100) :: varunits     ! Variable units
  character(len=100) :: lonunits     ! Longitude units
  character(len=100) :: latunits     ! Latitude units

  integer :: nlons, nlats            ! Grid dimensions
  integer :: ndims, vartype          ! Number of dims, NetCDF type code
  {type} :: FillValue                ! Missing data marker

  real({coord}), allocatable :: longitudes(:)   ! Longitude array
  real({coord}), allocatable :: latitudes(:)    ! Latitude array
  {type}, allocatable :: ncdata(:,:)            ! Data array (lon × lat)
end type
```

## 3D Type Fields

Adds to 2D fields:

| Field | Type | Description |
|---|---|---|
| `timename` | `character(100)` | Time dimension name |
| `timeunits` | `character(100)` | Time units |
| `ntimes` | `integer` | Number of time steps |
| `times(:)` | `integer/real` | Time coordinate array |
| `ncdata(:,:,:)` | `{type}` | Data array (lon × lat × time) |

## 4D Type Fields

Adds to 3D fields:

| Field | Type | Description |
|---|---|---|
| `levelname` | `character(100)` | Level dimension name |
| `levelunits` | `character(100)` | Level units |
| `nlevels` | `integer` | Number of levels |
| `levels(:)` | `integer/real` | Level coordinate array |
| `ncdata(:,:,:,:)` | `{type}` | Data array (lon × lat × time × level) |

## Internal Metadata Fields

All types also contain these internal fields used by the I/O routines:

| Field | Type | Description |
|---|---|---|
| `dimname(:)` | `character(100)` | Dimension names (allocatable) |
| `dimunits(:)` | `character(100)` | Dimension units (allocatable) |
| `dimid(:)` | `integer` | NetCDF dimension IDs |
| `dimsize(:)` | `integer` | Dimension sizes |
| `varids(:)` | `integer` | NetCDF variable IDs |
| `dims(D)` | `integer` | Array of dimension sizes |

## Total Types

FPL provides **5 data types × 2 coordinate precisions = 10** variants per dimension class:

| Class | Variants | Total |
|---|---|---|
| 2D | 5 types × 2 coords | 10 |
| 3D | 5 types × 2 coords × 3 time types | 30 |
| 4D | 5 types × 2 coords × 3 time types × 2 level types | 60 |
| **Grand Total** | | **100 types** |
