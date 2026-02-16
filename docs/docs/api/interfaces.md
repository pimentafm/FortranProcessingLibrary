---
sidebar_position: 2
---

# Interfaces

FPL uses Fortran 90 generic interfaces to provide a single procedure name for all type/dimension combinations.

## Generic Interfaces

| Interface      | Specific Procedures                   | Description                |
| -------------- | ------------------------------------- | -------------------------- |
| `check`        | `checkerror`, `checktype`, `checkatt` | NetCDF error checking      |
| `griddims`     | `griddims{2d,3d,4d}_*`                | Read grid dimensions       |
| `readgrid`     | `readgrid{2d,3d,4d}_*`                | Read data from NetCDF      |
| `writegrid`    | `writegrid{2d,3d,4d}_*`               | Write data to NetCDF       |
| `gengrid`      | `gengrid{2d,3d,4d}_*`                 | Generate grids from bounds |
| `setFillValue` | `setfvalue{2d,3d,4d}_*`               | Apply fill-value masking   |
| `dealloc`      | `dealloc{2d,3d,4d}_*`                 | Deallocate structures      |

## How It Works

The compiler dispatches to the correct implementation based on the type of the argument passed. For example:

```fortran
type(nc2d_float_llf) :: data2d
type(nc3d_int_lld_ti) :: data3d

! Both calls use the same interface name
call readgrid("file2d.nc", data2d)   ! calls readgrid2d_float_llf
call readgrid("file3d.nc", data3d)   ! calls readgrid3d_int_lld_ti
```

## Specific Procedure Naming

Specific procedures follow the pattern:

```
{operation}{Dd}_{type}_{coord}[_t{ttype}][_l{ltype}]
```

For `setFillValue`, the mask and data types are combined (mask type first):

```
setfvalue{Dd}_{masktype}{datatype}_{coord}[_t{ttype}][_l{ltype}]
```

### Example Resolutions

| Call                                                  | Resolves To                    |
| ----------------------------------------------------- | ------------------------------ |
| `call griddims(file, nc2d_byte_llf)`                  | `griddims2d_byte_llf`          |
| `call readgrid(file, nc3d_float_llf_ti)`              | `readgrid3d_float_llf_ti`      |
| `call writegrid(file, nc4d_double_lld_td_lf)`         | `writegrid4d_double_lld_td_lf` |
| `call setFillValue(nc2d_float_llf, nc3d_byte_llf_ti)` | `setfvalue3d_floatbyte_llf_ti` |
| `call dealloc(nc2d_int_lld)`                          | `dealloc2d_int_lld`            |
