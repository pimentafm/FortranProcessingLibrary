---
sidebar_position: 9
---

# dealloc — Deallocate Structures

Deallocates all allocatable arrays within an FPL data structure, releasing memory.

## Usage

```fortran
call dealloc(idata)
```

| Parameter | Type     | Description             |
| --------- | -------- | ----------------------- |
| `idata`   | FPL type | Structure to deallocate |

### Behavior

Deallocates the following arrays if allocated:

- `ncdata` — main data array
- `longitudes` — longitude coordinates
- `latitudes` — latitude coordinates
- `times` — time coordinates (3D/4D types)
- `levels` — level coordinates (4D types)

:::caution
Always call `dealloc` before reusing or discarding an FPL structure. Failing to deallocate causes **memory leaks**, which accumulate quickly when processing large geospatial datasets.
:::

## Code Example

Filter soybean data by state and deallocate between iterations:

```fortran
program main
  use fpl
  implicit none

  type(nc3d_float_llf_ti) :: soybean
  type(nc2d_byte_llf)     :: states

  integer(kind=intgr) :: s
  character(200) :: ipath_soybean, ipath_states, opath

  ipath_soybean = "database/soybean_production.nc"
  ipath_states  = "database/states.nc"

  ! Read soybean and states data
  call readgrid(ipath_soybean, soybean)
  call readgrid(ipath_states, states)

  ! Filter production per state (1 to 27)
  do s = 1, 27
    ! Set FillValue for the current state code
    states%FillValue = int(s, kind=byte)

    ! Mask soybean where state != s
    call setfillvalue(soybean, states)

    ! Write filtered output
    write(opath, '(A,I2.2,A)') "database/soybean_state_", s, ".nc"
    call writegrid(opath, soybean)

    ! Deallocate and re-read for next state
    call dealloc(soybean)
    call dealloc(states)

    call readgrid(ipath_soybean, soybean)
    call readgrid(ipath_states, states)
  end do

  call dealloc(soybean)
  call dealloc(states)
end program main
```

### Compile & Run

```bash
gfortran -o dealloc.out dealloc.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./dealloc.out
```
