---
sidebar_position: 12
---

# Error Checking

Subroutines for validating NetCDF operations and memory allocation.

## check (Generic Interface)

The `check` interface dispatches to three subroutines based on arguments:

### checkerror

General NetCDF status check. Aborts with a colored error message on failure.

```fortran
call check(nf90_status)
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `nf90_status` | `in` | `integer` | Return code from any `nf90_*` call |

### checktype

Validates that the declared FPL type matches the NetCDF variable type.

```fortran
call check(nf90_status, vartype_code, declared_type_string, filepath)
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `nf90_status` | `in` | `integer` | NetCDF status |
| `vartype_code` | `in` | `integer` | NetCDF variable type (1=byte, 3=short, 4=int, 5=float, 6=double) |
| `declared_type_string` | `in` | `character(*)` | Type declared by the user |
| `filepath` | `in` | `character(*)` | File path for diagnostics |

### checkatt

Validates NetCDF attribute retrieval. Provides guidance for missing `_FillValue`.

```fortran
call check(nf90_status, attribute_name, filepath)
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `nf90_status` | `in` | `integer` | NetCDF status |
| `attribute_name` | `in` | `character(*)` | Attribute name (e.g., `"_FillValue"`) |
| `filepath` | `in` | `character(*)` | File path for diagnostics |

## Standalone Subroutines

### checkvarid

Checks `nf90_inq_varid` status. Aborts if variable not found.

```fortran
call checkvarid(nf90_status, varname)
```

### checkdimid

Checks `nf90_inq_dimid` status. Aborts if dimension not found.

```fortran
call checkdimid(nf90_status, dimname)
```

### check_alloc

Checks `allocate` / `deallocate` status.

```fortran
integer :: istat
allocate(array(n), stat=istat)
call check_alloc(istat, "array")
```

| Parameter | Intent | Type | Description |
|---|---|---|---|
| `istat` | `in` | `integer` | Status from `stat=` keyword |
| `arrname` | `in` | `character(*)` | Array name for error message |

### print_filename

Extracts and prints the filename component from a full path.

```fortran
call print_filename("/path/to/file.nc")
! Output: File: file.nc
```
