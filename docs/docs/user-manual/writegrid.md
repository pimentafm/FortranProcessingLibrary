---
sidebar_position: 7
---

# writegrid — Write Grids to NetCDF

Writes FPL data structures to NetCDF files.

## Usage

```fortran
call writegrid(ofile, idata)
```

| Parameter | Type | Description |
|---|---|---|
| `ofile` | `character(*)` | Output file path |
| `idata` | FPL type | Structure with populated data |

### Behavior

- Creates a new NetCDF file (overwrites if exists)
- Writes coordinate variables (`longitudes`, `latitudes`, and optionally `times` / `levels`)
- Writes the main data variable with attributes (`long_name`, `varunits`, `FillValue`)
- Supports **byte, short, int, float, double** data types for 2D, 3D, and 4D grids

## Code Example

Read a file, convert Celsius to Fahrenheit, and write the result:

```fortran
program main
  use fpl
  implicit none

  type(nc2d_float_llf) :: tempC, tempF
  integer(kind=intgr)  :: i, j

  character(200) :: ipath, opath
  ipath = "database/temperature.nc"
  opath = "database/temperature_fahrenheit.nc"

  ! Read Celsius data
  call readgrid(ipath, tempC)

  ! Prepare Fahrenheit structure from Celsius
  tempF%varname    = tempC%varname
  tempF%lonname    = tempC%lonname
  tempF%latname    = tempC%latname
  tempF%long_name  = "Temperature"
  tempF%varunits   = "Fahrenheit"
  tempF%lonunits   = tempC%lonunits
  tempF%latunits   = tempC%latunits
  tempF%FillValue  = tempC%FillValue

  ! Get grid dimensions
  call griddims(ipath, tempF)

  ! Allocate and convert
  allocate(tempF%ncdata(tempF%nlons, tempF%nlats))

  do j = 1, tempF%nlats
    do i = 1, tempF%nlons
      tempF%ncdata(i,j) = (tempC%ncdata(i,j) * 1.8) + 32.0
    end do
  end do

  ! Copy coordinates
  tempF%longitudes = tempC%longitudes
  tempF%latitudes  = tempC%latitudes

  ! Write Fahrenheit data
  call writegrid(opath, tempF)

  call dealloc(tempC)
  call dealloc(tempF)
end program main
```

### Compile & Run

```bash
gfortran -o writegrid.out writegrid.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./writegrid.out
```
