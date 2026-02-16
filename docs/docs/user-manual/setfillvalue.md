---
sidebar_position: 8
---

# setfillvalue — Set Fill Values

Masks grid data by applying a `FillValue` to positions matching a reference mask.

## Usage

```fortran
call setfillvalue(mask, idata)
call setfillvalue(mask, idata, num)   ! optional: filter by mask value
```

| Parameter | Type                | Description                                                                       |
| --------- | ------------------- | --------------------------------------------------------------------------------- |
| `mask`    | FPL 2D type         | Reference mask (first argument)                                                   |
| `idata`   | FPL type            | Data structure to mask — modified in-place (second argument)                      |
| `num`     | `integer`, optional | When present, masks cells where `mask%ncdata /= num` instead of using `FillValue` |

### Behavior

**Without `num`:** For every grid cell where `mask%ncdata(i,j) == mask%FillValue`, the corresponding cells in `idata%ncdata` are set to `idata%FillValue`.

**With `num`:** For every grid cell where `mask%ncdata(i,j) /= num`, the data is set to `FillValue`. Where `mask%ncdata(i,j) == num` and `idata` already has `FillValue`, it is set to `0`.

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
  call setfillvalue(maskara, cattle)

  ! Or filter by a specific mask value (e.g., state code 18):
  ! call setfillvalue(maskara, cattle, 18)

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
