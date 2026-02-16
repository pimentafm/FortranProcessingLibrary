---
sidebar_position: 11
---

# Date & Time

Utility subroutines for date/time operations.

## fdate_time

Returns the current system date and time as a formatted string.

```fortran
character(len=21) :: datetime
call fdate_time(datetime)
write(*,*) datetime   ! e.g., "Aug 09 2024 14:30:05"
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `datetime` | `out` | `character(21)` | Formatted date/time string |

**Format:** `Mon DD YYYY HH:MM:SS`

## exec_time

Returns the current time as a real number for profiling.

```fortran
real(kind=4) :: t_start, t_end

call exec_time(t_start)
! ... computation ...
call exec_time(t_end)

write(*,*) "Elapsed:", t_end - t_start
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `time` | `out` | `real(4)` | Current time value |

## Example

```fortran
program timing
  use fpl
  implicit none

  character(len=21) :: dt
  real(kind=4) :: t0, t1

  call fdate_time(dt)
  write(*,*) "Start:", dt

  call exec_time(t0)
  ! ... heavy computation ...
  call exec_time(t1)

  write(*,*) "Elapsed:", t1 - t0
end program timing
```
