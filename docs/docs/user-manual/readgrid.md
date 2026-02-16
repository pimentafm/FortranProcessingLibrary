---
sidebar_position: 5
---

# readgrid — Read NetCDF Data

Reads NetCDF files, populating all structure fields including coordinate arrays and the data array.

## Usage

```fortran
call readgrid(ifile, idata)
```

| Parameter | Type | Description |
|---|---|---|
| `ifile` | `character(*)` | Dataset file path |
| `idata` | FPL type | Structure to populate with data |

### Returns

All [structure fields](data-types#structure-fields) are populated including `longitudes`, `latitudes`, `times`, `levels`, and `ncdata`.

## Code Example

Read a 3D spectral dataset and print its information:

```fortran
program main
  use fpl
  implicit none

  type(nc3d_float_lld_td) :: spectral

  character(200) :: inputpath
  inputpath = "database/test_echam_spectral.nc"

  spectral%varname  = "albedo_nir"
  spectral%timename = "time"
  spectral%lonname  = "lon"
  spectral%latname  = "lat"

  call readgrid(inputpath, spectral)

  write(*,*) "====== Dataset Information ======="
  write(*,'(2a12)') "  varname: ", spectral%varname
  write(*,'(2a12)') " varunits: ", spectral%varunits
  write(*,'(2a12)') "  lonname: ", spectral%lonname
  write(*,'(a12,i3)') "    nlons: ", spectral%nlons
  write(*,'(2a12)') "  latname: ", spectral%latname
  write(*,'(a12,i3)') "    nlats: ", spectral%nlats
  write(*,'(2a12)') " timename: ", spectral%timename
  write(*,'(a12,i3)') "   ntimes: ", spectral%ntimes

  call dealloc(spectral)
end program main
```

### Compile & Run

```bash
gfortran -o readgrid.out readgrid.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./readgrid.out
```
