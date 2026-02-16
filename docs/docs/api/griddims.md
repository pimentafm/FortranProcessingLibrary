---
sidebar_position: 4
---

# griddims

Reads the grid dimensions and coordinate arrays from a NetCDF file into an FPL structure.

## Signature

```fortran
call griddims(ifile, idata)
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `ifile` | `in` | `character(*)` | Path to the NetCDF file |
| `idata` | `inout` | FPL type | Structure to populate with dimension info |

## Behavior

1. Opens the NetCDF file in read-only mode
2. Queries dimension sizes (`nlons`, `nlats`, and optionally `ntimes`, `nlevels`)
3. Allocates and reads coordinate arrays (`longitudes`, `latitudes`, `times`, `levels`)
4. Closes the file

:::note
You must set `varname`, `lonname`, `latname` (and `timename`, `levelname` for 3D/4D) **before** calling `griddims`.
:::

## Supported Types

Works with all 100 FPL data types (2D, 3D, 4D) via the `griddims` generic interface.

## Example

```fortran
type(nc2d_float_llf) :: temp

temp%varname = "temperature"
temp%lonname = "lon"
temp%latname = "lat"

call griddims("data.nc", temp)

write(*,*) "Grid:", temp%nlons, "x", temp%nlats
```
