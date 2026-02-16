---
sidebar_position: 7
---

# gengrid

Generates a regular grid from bounding box coordinates and resolution.

## Signature

```fortran
call gengrid(idata, Xmin, Ymin, Xmax, Ymax, res)
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `idata` | `inout` | FPL type | Structure to populate |
| `Xmin` | `in` | `real/double` | Western boundary (longitude) |
| `Ymin` | `in` | `real/double` | Southern boundary (latitude) |
| `Xmax` | `in` | `real/double` | Eastern boundary (longitude) |
| `Ymax` | `in` | `real/double` | Northern boundary (latitude) |
| `res` | `in` | `real/double` | Grid cell resolution (degrees) |

## Behavior

1. Computes `nlons` and `nlats` from the bounding box and resolution
2. Allocates and fills `longitudes` and `latitudes` arrays
3. Allocates `ncdata` initialized to zero
4. For 3D/4D types, uses `ntimes` / `nlevels` already set in the structure

:::note
Set `ntimes` (3D/4D) and `nlevels` (4D) **before** calling `gengrid`.
:::

## Supported Types

Works with all 100 FPL data types via the `gengrid` generic interface.

## Example

```fortran
type(nc2d_float_llf) :: dem

dem%varname   = "elevation"
dem%lonname   = "lon"
dem%latname   = "lat"
dem%long_name = "Digital Elevation Model"
dem%varunits  = "meters"
dem%lonunits  = "degrees_east"
dem%latunits  = "degrees_north"
dem%FillValue = -9999.0

! Generate a 0.5-degree grid over South America
call gengrid(dem, -82.0, -56.0, -34.0, 13.0, 0.5)

write(*,*) "Grid size:", dem%nlons, "x", dem%nlats
! Output: Grid size: 96 x 138

call dealloc(dem)
```
