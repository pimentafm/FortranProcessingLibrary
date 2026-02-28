---
sidebar_position: 9
---

# zonalStats

Computes per-zone aggregate statistics from a data grid grouped by a 2D zone/classification grid.

## Signature

```fortran
call zonalStats(zones, data, nzones, zcount, zmean, zmin, zmax, zsum, zvar)
```

| Parameter | Intent | Type                                  | Description                                     |
| --------- | ------ | ------------------------------------- | ----------------------------------------------- |
| `zones`   | `in`   | FPL 2D type                           | Zone grid (IDs cast to integer, range 1..nzones) |
| `data`    | `in`   | FPL 2D/3D/4D type                     | Data grid (FillValue pixels excluded)            |
| `nzones`  | `in`   | `integer(kind=intgr)`                 | Number of zones                                  |
| `zcount`  | `out`  | `integer(kind=intgr), dimension(...)` | Pixel count per zone                             |
| `zmean`   | `out`  | `real(kind=double), dimension(...)`   | Mean value per zone                              |
| `zmin`    | `out`  | `real(kind=double), dimension(...)`   | Minimum value per zone                           |
| `zmax`    | `out`  | `real(kind=double), dimension(...)`   | Maximum value per zone                           |
| `zsum`    | `out`  | `real(kind=double), dimension(...)`   | Sum of values per zone                           |
| `zvar`    | `out`  | `real(kind=double), dimension(...)`   | Population variance per zone                     |

## Output Dimensions

| Data Dimensionality | Output Shape                    |
| -------------------- | ------------------------------- |
| 2D                   | `(nzones)`                      |
| 3D                   | `(nzones, ntimes)`              |
| 4D                   | `(nzones, ntimes, nlevels)`     |

For 3D/4D data, output arrays must be allocated by the caller before calling `zonalStats`.

## Behavior

For each pixel `(i,j)`:

1. The zone ID is obtained: `z = int(zones%ncdata(i,j))`
2. If `z < 1` or `z > nzones`, the pixel is skipped
3. If `data%ncdata(i,j,...) == data%FillValue`, the pixel is excluded
4. Otherwise, the pixel value is accumulated into `zcount(z,...)`, `zsum(z,...)`, `zmin(z,...)`, `zmax(z,...)`

After accumulation:

- `zmean = zsum / zcount`
- `zvar = E[x²] - E[x]²` (population variance)
- Zones with zero valid pixels: all outputs set to `0`

:::caution
The zone and data grids must have the **same spatial dimensions** (`nlons × nlats`). The zone grid is always 2D regardless of the data dimensionality.
:::

## Parallelization

| Dimensionality | Strategy | Description |
| -------------- | -------- | ----------- |
| 2D | `reduction(+:zcount,zsum,zsumsq) reduction(min:zmin) reduction(max:zmax)` | Array reduction on latitude loop |
| 3D | `parallel do` on time loop | Each timestep is independent |
| 4D | `parallel do collapse(2)` on level/time loops | Each (level,time) pair is independent |

## Type Combinations

The zone and data grids can have different numeric types. FPL provides specific procedures for every combination, following the same pattern as `setFillValue`:

```
zonalstats{Dd}_{zonetype}{datatype}_{coord}[_t{ttype}][_l{ltype}]
```

| Dimensionality | Combinations | Total |
| -------------- | ------------ | ----- |
| 2D             | 5 zone types × 5 data types × 2 coords | 50 |
| 3D             | 5 × 5 × 2 × 3 time types | 150 |
| 4D             | 5 × 5 × 2 × 3 × 2 level types | 300 |
| **Total**      | | **500** |

## Example

```fortran
type(nc2d_byte_lld)   :: zones
type(nc3d_double_lld_ti) :: cattle

integer(kind=intgr), parameter :: nzones = 28
integer(kind=intgr), allocatable :: zcount(:,:)
real(kind=double), allocatable   :: zmean(:,:), zmin(:,:), zmax(:,:), zsum(:,:), zvar(:,:)

call readgrid("brazil_UF.nc", zones)
call readgrid("CATTLE19902012.nc", cattle)

allocate(zcount(nzones, cattle%ntimes))
allocate(zmean(nzones, cattle%ntimes))
allocate(zmin(nzones, cattle%ntimes))
allocate(zmax(nzones, cattle%ntimes))
allocate(zsum(nzones, cattle%ntimes))
allocate(zvar(nzones, cattle%ntimes))

call zonalStats(zones, cattle, nzones, zcount, zmean, zmin, zmax, zsum, zvar)

! Results: zmean(18, k) = mean cattle density in Minas Gerais at timestep k

deallocate(zcount, zmean, zmin, zmax, zsum, zvar)
call dealloc(zones)
call dealloc(cattle)
```
