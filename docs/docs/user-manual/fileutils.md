---
sidebar_position: 10
---

# File Utilities

Helper functions for common file operations.

## file_exists

Check whether a file exists on disk.

```fortran
logical :: exists
exists = file_exists(filepath)
```

| Parameter | Type | Description |
|---|---|---|
| `filepath` | `character(*)` | Path to the file |

**Returns:** `.true.` if the file exists, `.false.` otherwise.

## numRows

Count the number of lines (rows) in a text file.

```fortran
integer :: nrows
nrows = numRows(filepath)
```

| Parameter | Type | Description |
|---|---|---|
| `filepath` | `character(*)` | Path to a text file |

**Returns:** Number of lines in the file (`integer`).

## Code Example

```fortran
program main
  use fpl
  implicit none

  character(200) :: filepath
  integer :: nrows
  logical :: exists

  filepath = "database/data.txt"

  ! Check if the file exists
  exists = file_exists(filepath)

  if (exists) then
    write(*,*) "File found: ", trim(filepath)

    ! Count lines
    nrows = numRows(filepath)
    write(*,*) "Number of rows: ", nrows
  else
    write(*,*) "File not found: ", trim(filepath)
  end if
end program main
```

### Compile & Run

```bash
gfortran -o fileutils.out fileutils.f90 -I/usr/lib64/gfortran/modules/ -lFPL
./fileutils.out
```
