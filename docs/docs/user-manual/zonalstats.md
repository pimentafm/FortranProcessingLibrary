---
sidebar_position: 9
---

# zonalStats — Zonal Statistics

Computes per-zone aggregate statistics (count, mean, min, max, sum, variance) from a data grid grouped by a 2D zone/classification grid — a common GIS operation used in land-use analysis, climate studies, etc.

## Usage

```fortran
call zonalStats(zones, data, nzones, zcount, zmean, zmin, zmax, zsum, zvar)
```

| Parameter | Type                                       | Description                                      |
| --------- | ------------------------------------------ | ------------------------------------------------ |
| `zones`   | FPL 2D type                                | Zone grid with integer zone IDs (1 to `nzones`)  |
| `data`    | FPL 2D/3D/4D type                          | Data grid (pixels with `FillValue` are excluded) |
| `nzones`  | `integer(kind=intgr)`                      | Number of zones                                  |
| `zcount`  | `integer(kind=intgr), dimension(...)`      | Pixel count per zone                             |
| `zmean`   | `real(kind=double), dimension(...)`        | Mean value per zone                              |
| `zmin`    | `real(kind=double), dimension(...)`        | Minimum value per zone                           |
| `zmax`    | `real(kind=double), dimension(...)`        | Maximum value per zone                           |
| `zsum`    | `real(kind=double), dimension(...)`        | Sum of values per zone                           |
| `zvar`    | `real(kind=double), dimension(...)`        | Variance per zone                                |

### Output Array Dimensions

| Data Grid | Output Arrays Shape              |
| --------- | -------------------------------- |
| 2D        | `(nzones)`                       |
| 3D        | `(nzones, ntimes)`               |
| 4D        | `(nzones, ntimes, nlevels)`      |

### Behavior

- Zone IDs are obtained by casting `zones%ncdata(i,j)` to integer
- Pixels where `zone < 1` or `zone > nzones` are skipped
- Pixels where `data%ncdata == data%FillValue` are excluded
- Zones with zero valid pixels get `zmean = zmin = zmax = zvar = 0`
- Variance is computed as population variance: `var = E[x²] - E[x]²`

### Parallelization

- **2D:** OpenMP `reduction` on the accumulation arrays across the latitude loop
- **3D:** OpenMP `parallel do` on the time loop (each timestep is independent)
- **4D:** OpenMP `parallel do collapse(2)` on the level/time loops

## Code Example

Compute soybean land use statistics grouped by Brazilian state:

```fortran
program main
  use fpl
  implicit none

  type(nc2d_byte_lld)   :: zones
  type(nc2d_double_lld) :: soja
  integer(kind=intgr), parameter :: nzones = 28

  integer(kind=intgr), dimension(nzones) :: zcount
  real(kind=double), dimension(nzones)   :: zmean, zmin, zmax, zsum, zvar
  integer(kind=intgr) :: z

  zones%varname = "UF"
  zones%lonname = "lon"
  zones%latname = "lat"
  call readgrid("database/brazil_UF.nc", zones)

  soja%varname = "landuse"
  soja%lonname = "lon"
  soja%latname = "lat"
  call readgrid("database/LUCULTSOJA2012.nc", soja)

  call zonalStats(zones, soja, nzones, zcount, zmean, zmin, zmax, zsum, zvar)

  do z = 1, nzones
    if (zcount(z) > 0) then
      write(*,*) "Zone", z, ": count=", zcount(z), " mean=", zmean(z)
    end if
  end do

  call dealloc(zones)
  call dealloc(soja)
end program main
```

### Combining with setFillValue (Masked Zonal Statistics)

You can apply a mask before computing zonal statistics to restrict the analysis to a specific region:

```fortran
! Read mask and data
call readgrid("database/brazil_UF.nc", mask)
call readgrid("database/LUCULTSOJA2012.nc", soja)

! Keep only Minas Gerais (UF=18)
call setFillValue(mask, soja, 18)

! Compute stats — only Minas Gerais pixels remain
call zonalStats(zones, soja, nzones, zcount, zmean, zmin, zmax, zsum, zvar)
```

### Compile & Run

```bash
gfortran -fopenmp -o zonalstats.out zonalstats.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./zonalstats.out
```
