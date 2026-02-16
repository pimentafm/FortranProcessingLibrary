---
sidebar_position: 6
---

# writegrid

Writes an FPL data structure to a new NetCDF file.

## Signature

```fortran
call writegrid(ofile, idata)
call writegrid(ofile, idata, headerfile)   ! optional header file
```

| Parameter    | Intent | Type                     | Description                                                                          |
| ------------ | ------ | ------------------------ | ------------------------------------------------------------------------------------ |
| `ofile`      | `in`   | `character(*)`           | Output file path                                                                     |
| `idata`      | `in`   | FPL type                 | Structure with populated data                                                        |
| `headerfile` | `in`   | `character(*)`, optional | Path to a header file with custom attributes (see [fileutils](fileutils#readheader)) |

## Behavior

1. Creates a new NetCDF file (overwrites existing)
2. Defines dimensions (lon, lat, and optionally time, level)
3. Defines coordinate and data variables with attributes (`long_name`, units, `_FillValue`)
4. Writes coordinate arrays and the `ncdata` variable
5. Closes the file

:::tip
Ensure all metadata fields (`varname`, `lonname`, `latname`, `long_name`, `varunits`, `lonunits`, `latunits`, `FillValue`) are set before calling `writegrid`.
:::

## Supported Types

Works with all 100 FPL data types via the `writegrid` generic interface.

## Example

```fortran
type(nc2d_float_llf) :: output

! Set metadata
output%varname   = "result"
output%lonname   = "lon"
output%latname   = "lat"
output%long_name = "Processed Result"
output%varunits  = "K"
output%lonunits  = "degrees_east"
output%latunits  = "degrees_north"
output%FillValue = -9999.0

! ... allocate and fill output%ncdata, longitudes, latitudes ...

call writegrid("output.nc", output)
call dealloc(output)
```
