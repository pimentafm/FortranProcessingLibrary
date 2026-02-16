---
sidebar_position: 5
---

# readgrid

Reads a complete NetCDF grid — dimensions, coordinates, attributes, and data — into an FPL structure.

## Signature

```fortran
call readgrid(ifile, idata)
```

| Parameter | Intent  | Type           | Description             |
| --------- | ------- | -------------- | ----------------------- |
| `ifile`   | `in`    | `character(*)` | Path to the NetCDF file |
| `idata`   | `inout` | FPL type       | Structure to populate   |

## Behavior

1. Calls `griddims` internally to get dimensions and coordinates
2. Reads the `_FillValue` attribute
3. Reads the `long_name` and unit attributes
4. Allocates `ncdata` and reads the variable data
5. Performs type checking (aborts with diagnostic if declared type doesn't match file)

## Supported Types

Works with all 100 FPL data types via the `readgrid` generic interface.

## Example

```fortran
type(nc3d_float_llf_ti) :: precipitation

precipitation%varname  = "precip"
precipitation%lonname  = "longitude"
precipitation%latname  = "latitude"
precipitation%timename = "time"

call readgrid("precip.nc", precipitation)

write(*,*) "Shape:", precipitation%nlons, precipitation%nlats, precipitation%ntimes
write(*,*) "FillValue:", precipitation%FillValue

call dealloc(precipitation)
```
