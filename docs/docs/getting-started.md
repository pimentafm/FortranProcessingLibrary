---
sidebar_position: 2
---

# Getting Started

## Requirements

| Dependency         | Description                                      |
| ------------------ | ------------------------------------------------ |
| **GFortran**       | GNU Fortran compiler (part of GCC)               |
| **NetCDF**         | Network Common Data Form libraries               |
| **NetCDF-Fortran** | Fortran bindings for NetCDF (`libnetcdff`)       |
| **OpenMP**         | Multi-threading support (included with GFortran) |
| **Make**           | Build automation tool                            |
| **Python 3**       | Code generation script (`generate_cpp.py`)       |

### Debian / Ubuntu

```bash
sudo apt install gfortran libnetcdf-dev libnetcdff-dev make python3
```

### Fedora / RHEL

```bash
sudo dnf install gcc-gfortran netcdf-devel netcdf-fortran-devel make python3
```

## Directory Structure

```
FPL/
  ├── src/                    # Library source files
  │   ├── FPL.f90             # Main module (aggregates all via #include)
  │   ├── FPL_constants.f90   # Parameter variables
  │   ├── FPL_datatypes.f90   # Datatype structure declarations
  │   ├── FPL_interfaces.f90  # Generic interfaces
  │   ├── FPL_checkerror.f90  # Error checker subroutines
  │   ├── FPL_griddims.f90    # Read dimensions from NetCDF
  │   ├── FPL_readgrid.f90    # Read data from NetCDF
  │   ├── FPL_writegrid.f90   # Write data to NetCDF
  │   ├── FPL_setfillvalue.f90 # FillValue masking (OpenMP)
  │   ├── FPL_gengrid.f90     # Generate regular grids
  │   ├── FPL_dealloc.f90     # Memory deallocation
  │   ├── FPL_fileutils.f90   # File utilities
  │   ├── FPL_datetime.f90    # Date/time subroutines
  │   ├── FPL_sort.f90        # Bubble sort
  │   ├── FPL_misc.f90        # Library version
  │   ├── generate_cpp.py     # Code generation script
  │   └── templates/          # CPP template files (.inc)
  │       ├── datatypes_{2d,3d,4d}.inc
  │       ├── dealloc_{2d,3d,4d}.inc
  │       ├── griddims_{2d,3d,4d}.inc
  │       ├── readgrid_{2d,3d,4d}.inc
  │       ├── writegrid_{2d,3d,4d}.inc
  │       ├── gengrid_{2d,3d,4d}.inc
  │       └── setfillvalue_{2d,3d,4d}.inc
  ├── examples/               # Example programs
  ├── docs/                   # Documentation (Docusaurus)
  └── Makefile                # Build system
```

## Build & Install

### Build the library

```bash
git clone https://github.com/pimentafm/FortranProcessingLibrary.git
cd FortranProcessingLibrary
make build
```

### Install to system directories

```bash
sudo make install
```

Default install locations (distro-dependent):

| Distribution                          | Library                    | Module                                |
| ------------------------------------- | -------------------------- | ------------------------------------- |
| **Fedora / RHEL / Rocky / Alma**      | `/usr/lib64/libFPL.so`     | `/usr/lib64/gfortran/modules/fpl.mod` |
| **Debian / Ubuntu / Mint / Pop!\_OS** | `/usr/lib/libFPL.so`       | `/usr/include/fpl.mod`                |
| **Other**                             | `/usr/local/lib/libFPL.so` | `/usr/local/include/fpl.mod`          |

Override paths if needed:

```bash
sudo make install LIBDIR=/usr/local/lib64 MODDIR=/usr/local/include
```

### Other targets

| Target           | Description                      |
| ---------------- | -------------------------------- |
| `make build`     | Compile `libFPL.so` locally      |
| `make install`   | Install library and module files |
| `make uninstall` | Remove installed files           |
| `make clean`     | Remove build artifacts           |
| `make help`      | Show all available targets       |

### Compile examples

After installing the library, compile the example programs to verify installation:

```bash
cd examples/
make ex1    # Compile example 1
./ex1_readwrite.out
```

### Makefile configuration

The Makefile auto-detects your Linux distribution via `/etc/os-release` and configures the correct NetCDF paths. It supports:

- **Fedora / RHEL / Rocky / Alma / Korora**: `-I/usr/lib64/gfortran/modules/`
- **Debian / Ubuntu / Mint / Pop!\_OS**: `-I/usr/include/`

:::info
If auto-detection fails, override the NetCDF flags:

```bash
make NETCDF="-I/custom/path -lnetcdff -lnetcdf"
```

:::
