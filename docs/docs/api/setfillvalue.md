---
sidebar_position: 8
---

# setFillValue

Applies a spatial mask to grid data by copying fill values from a 2D reference mask.

## Signature

```fortran
call setFillValue(mask, idata)
call setFillValue(mask, idata, num)   ! optional: filter by value
```

| Parameter | Intent  | Type                | Description                                                                       |
| --------- | ------- | ------------------- | --------------------------------------------------------------------------------- |
| `mask`    | `in`    | FPL 2D type         | Reference mask (first argument)                                                   |
| `idata`   | `inout` | FPL 2D/3D/4D type   | Data to be masked (second argument)                                               |
| `num`     | `in`    | `integer`, optional | When present, masks cells where `mask%ncdata /= num` instead of using `FillValue` |

## Behavior

**Without `num`:** For every `(i,j)` where `mask%ncdata(i,j) == mask%FillValue`:

- **2D:** `idata%ncdata(i,j) = idata%FillValue`
- **3D:** `idata%ncdata(i,j,t) = idata%FillValue` for all `t`
- **4D:** `idata%ncdata(i,j,t,l) = idata%FillValue` for all `t,l`

**With `num`:** For every `(i,j)` where `mask%ncdata(i,j) /= num`, the data is set to `FillValue`. Where `mask%ncdata(i,j) == num` and `idata` already has `FillValue`, it is set to `0`.

:::caution
The mask and data grids must have the **same spatial dimensions** (`nlons × nlats`). The mask is always 2D regardless of the data dimensionality.
:::

## Type Combinations

The data and mask can have different numeric types. FPL provides specific procedures for every combination (e.g., `setfvalue3d_floatbyte_llf_ti` for float data with byte mask).

## Example

```fortran
type(nc3d_float_llf_ti) :: temperature
type(nc2d_byte_llf)     :: land_mask

call readgrid("temperature.nc", temperature)
call readgrid("land_mask.nc", land_mask)

! Mask ocean cells (where land_mask is FillValue)
call setFillValue(land_mask, temperature)

! Or filter by a specific mask value (e.g., state code 18)
! call setFillValue(land_mask, temperature, 18)

call writegrid("temperature_land_only.nc", temperature)

call dealloc(temperature)
call dealloc(land_mask)
```
