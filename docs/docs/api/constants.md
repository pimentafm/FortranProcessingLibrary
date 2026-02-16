---
sidebar_position: 3
---

# Constants

Physical and mathematical constants defined as `real(kind=double), parameter`.

## Kind Parameters

Mapped from `iso_c_binding`:

| Name | C Equivalent | Fortran Kind |
|---|---|---|
| `byte` | `C_SIGNED_CHAR` | 1-byte integer |
| `short` | `C_SHORT` | 2-byte integer |
| `intgr` | `C_INT` | 4-byte integer |
| `float` | `C_FLOAT` | 4-byte real |
| `double` | `C_DOUBLE` | 8-byte real |

## Physical Constants

| Constant | Value | Units | Description |
|---|---|---|---|
| `pi` | $4 \arctan(1.0)$ | — | Pi |
| `earth_radius` | 6371.0 | km | Average radius of Earth |
| `acc_gravity` | 9.80616 | m/s² | Acceleration of gravity |
| `stefan_boltzmann` | $5.670373 \times 10^{-8}$ | W/m²K⁴ | Stefan–Boltzmann constant |
| `boltzmann` | $1.38064852 \times 10^{-23}$ | J/K | Boltzmann constant |
| `speed_of_light` | 299792458.0 | m/s | Speed of light in vacuum |
| `atomic_mass` | $1.660539040 \times 10^{-27}$ | kg | Atomic mass unit |
| `avogadro` | $6.022140857 \times 10^{23}$ | mol⁻¹ | Avogadro constant |

## Usage

```fortran
use fpl
implicit none

real(kind=double) :: circumference
circumference = 2.0 * pi * earth_radius

write(*,*) "Earth circumference:", circumference, "km"
```
