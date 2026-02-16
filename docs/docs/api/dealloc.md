---
sidebar_position: 9
---

# dealloc

Deallocates all allocatable arrays within an FPL data structure.

## Signature

```fortran
call dealloc(idata)
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `idata` | `inout` | FPL type | Structure to deallocate |

## Behavior

Deallocates the following arrays if allocated:

| Array | Present In |
|---|---|
| `ncdata` | All types |
| `longitudes` | All types |
| `latitudes` | All types |
| `times` | 3D and 4D types |
| `levels` | 4D types |
| `dimname`, `dimunits` | All types |
| `dimid`, `dimsize`, `varids` | All types |

## Supported Types

Works with all 100 FPL data types via the `dealloc` generic interface.

## Example

```fortran
type(nc3d_float_llf_ti) :: data

call readgrid("input.nc", data)
! ... process data ...
call dealloc(data)  ! Free all memory
```

:::tip
Always call `dealloc` when you're done with an FPL variable, especially inside loops where structures are repeatedly allocated.
:::
