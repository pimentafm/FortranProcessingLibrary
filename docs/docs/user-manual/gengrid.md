---
sidebar_position: 6
---

# gengrid — Generate Grids

Generates grids from user-defined coordinates and resolution.

## Usage

```fortran
call gengrid(idata, Xmin, Ymin, Xmax, Ymax, res)
```

| Parameter | Type          | Description               |
| --------- | ------------- | ------------------------- |
| `idata`   | FPL type      | Structure to create       |
| `Xmin`    | `real/double` | Westernmost longitude     |
| `Ymin`    | `real/double` | Southernmost latitude     |
| `Xmax`    | `real/double` | Easternmost longitude     |
| `Ymax`    | `real/double` | Northernmost latitude     |
| `res`     | `real/double` | Grid resolution (degrees) |

### Returns

`idata` structure with defined `longitudes`, `latitudes`, and allocated `ncdata` array.

```
    Latitude|                                  Xmin: westernmost longitude
            |                                  Ymin: southernmost latitude
            |       Ymax                       Xmax: easternmost longitude
            |_________________                 Ymax: northernmost latitude
            |__|__|__|__|__|__|
            |__|__|__|__|__|__|
       Xmin |__|__|__|__|__|__| Xmax
            |__|__|__|__|__|__|
           j|__|__|__|__|__|__|_____________
            i                      Longitude
                    Ymin
```

## Code Example

Create a 3D netCDF grid:

```fortran
program main
  use fpl
  implicit none

  type(nc3d_int_llf_ti) :: grid3d
  integer(kind=intgr) :: i, j, k

  character(200) :: opath3d
  opath3d = "database/grid3d.nc"

  ! Grid 3D definitions
  grid3d%long_name  = "My Grid 1 degree"
  grid3d%varname    = "grid"
  grid3d%lonname    = "lon"
  grid3d%latname    = "lat"
  grid3d%timename   = "time"
  grid3d%varunits   = "dimensionless"
  grid3d%lonunits   = "degrees_east"
  grid3d%latunits   = "degrees_north"
  grid3d%timeunits  = "hour"
  grid3d%ntimes     = 10
  grid3d%FillValue  = -9999

  ! Generate a 3D grid (1-degree resolution)
  call gengrid(grid3d, -74.737, -34.344, -34.737, 5.656, 1.0)

  ! Fill the array data
  do i = 1, grid3d%ntimes
    do k = 1, grid3d%nlats
      do j = 1, grid3d%nlons
        grid3d%ncdata(j,k,i) = int(i * (cos(real(j)) * grid3d%longitudes(j) &
                                        + k * grid3d%latitudes(k)))
      end do
    end do
  end do

  ! Write data to file
  call writegrid(opath3d, grid3d)
  call dealloc(grid3d)
end program main
```

### Compile & Run

```bash
gfortran -o gengrid.out gengrid.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./gengrid.out
```
