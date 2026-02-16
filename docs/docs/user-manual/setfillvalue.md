---
sidebar_position: 8
---

# setfillvalue — Set Fill Values

Masks grid data by applying a `FillValue` to positions matching a reference mask.

## Usage

```fortran
call setfillvalue(idata, mask)
```

| Parameter | Type | Description |
|---|---|---|
| `idata` | FPL type | Data structure to mask (modified in-place) |
| `mask` | FPL 2D type | Reference mask — positions with `FillValue` are applied to `idata` |

### Behavior

For every grid cell where `mask%ncdata(i,j) == mask%FillValue`, the corresponding cells in `idata%ncdata` are set to `idata%FillValue`.

Works with 2D, 3D, and 4D grids of any numeric type.

## Code Example

Apply a state-boundary mask to cattle density data:

```fortran
program main
  use fpl
  implicit none

  type(nc3d_float_llf_ti) :: cattle
  type(nc2d_float_llf)    :: maskara

  character(200) :: ipath_cattle, ipath_mask, opath
  ipath_cattle = "database/cattle_data.nc"
  ipath_mask   = "database/state_mask.nc"
  opath        = "database/cattle_masked.nc"

  ! Read cattle and mask data
  call readgrid(ipath_cattle, cattle)
  call readgrid(ipath_mask, maskara)

  ! Apply FillValue where mask is FillValue
  call setfillvalue(cattle, maskara)

  ! Write masked result
  call writegrid(opath, cattle)

  call dealloc(cattle)
  call dealloc(maskara)
end program main
```

### Compile & Run

```bash
gfortran -o setfvalue.out setfvalue.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./setfvalue.out
```
