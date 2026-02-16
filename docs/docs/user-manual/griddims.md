---
sidebar_position: 4
---

# griddims — Read Grid Dimensions

Inquire about the coordinates, time, level, and variable type of a NetCDF dataset.

## Usage

```fortran
call griddims(ifile, idata)
```

| Parameter | Type | Description |
|---|---|---|
| `ifile` | `character(*)` | Dataset file path |
| `idata` | FPL type | Structure to populate with dimension info |

### Returns (populated fields)

`ndims`, `nlons`, `nlats`, `ntimes` (3D/4D), `nlevels` (4D), `lonunits`, `latunits`, `timeunits` (3D/4D), `levelunits` (4D), `vartype`, `varunits`, `long_name`, `FillValue`

## Code Example

Get the number of latitudes and longitudes of a file:

```fortran
program main
  use fpl
  implicit none

  type(nc3d_float_lld_td) :: spectral

  character(100) :: inputpath
  inputpath = "database/test_echam_spectral.nc"

  spectral%varname  = "albedo_nir"
  spectral%timename = "time"
  spectral%lonname  = "lon"
  spectral%latname  = "lat"

  call readgrid(inputpath, spectral)

  write(*,*) "====== Dataset Information ======="
  write(*,'(a13,a25)') "varname :    ", spectral%varname
  write(*,'(a13,a25)') "lonname :    ", spectral%lonname
  write(*,'(a13,i4)')  "nlons :      ", spectral%nlons
  write(*,'(a13,i4)')  "nlats :      ", spectral%nlats
  write(*,'(a13,i4)')  "ntimes :     ", spectral%ntimes
  write(*,'(a13,f10.4)') "FillValue :  ", spectral%FillValue

  call dealloc(spectral)
end program main
```

### Compile & Run

```bash
gfortran -o griddims.out griddims.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./griddims.out
```
