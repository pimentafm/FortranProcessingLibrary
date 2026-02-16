---
sidebar_position: 2
---

# First Program

Build the library according to the [Getting Started](../getting-started) guide.

## Creating your first program

Create a program in Fortran 90 using the FPL module:

```fortran
program myfirstprogram
  use fpl
  implicit none
  write(*,*) "This is my first program using ", fpl_libversion()
end program myfirstprogram
```

Save it as `myfirstprogram.f90` and compile using **gfortran**:

```bash
# Fedora / RHEL based systems
gfortran -o myfirstprogram.out myfirstprogram.f90 -I/usr/lib64/gfortran/modules/ -lFPL

# Debian / Ubuntu based systems
gfortran -o myfirstprogram.out myfirstprogram.f90 -I/usr/include/ -lFPL
```

:::info
`-I<dir>` specifies where to find `.mod` files for compiled modules. The directory corresponds to the `MODDIR` variable defined in the Makefile. See [GNU Fortran Compiler Documentation](https://gcc.gnu.org/onlinedocs/gfortran/) for details.
:::

Run the program:

```bash
./myfirstprogram.out
```
