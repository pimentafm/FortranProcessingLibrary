#:=============================================================================
# This file is part of FPL (Fortran Processing Library).
# Copyright (C) 2015 Fernando Martins Pimenta

# FPL API is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# FPL API is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with FPL_tools.  If not, see <http://www.gnu.org/licenses/>.

#:=============================================================================
# About Author:
#  Fernando Martins Pimenta
#  Student of Surveying and Cartographic Engineering
#  Federal University of Viçosa - Brazil

#  Bachelor of Biosystems Engineer
#  Federal University of São João del-Rei - Brazil

#  Research Group on Atmosphere-Biosphere Interaction
#  Federal University of Viçosa
#  Data: August 09, 2015

# Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
#:=============================================================================

#------------------------------------------------------------------------------
# System detection (uses /etc/os-release; falls back to lsb_release)
#------------------------------------------------------------------------------
OS := $(shell . /etc/os-release 2>/dev/null && echo $$ID || lsb_release -si 2>/dev/null | tr 'A-Z' 'a-z')
VERSION := $(shell . /etc/os-release 2>/dev/null && echo $$VERSION_ID || lsb_release -sr 2>/dev/null)
ARCH := $(shell uname -m)

$(info --- $(OS) $(VERSION) $(ARCH) ---)

#------------------------------------------------------------------------------
# FPL library and module names
#------------------------------------------------------------------------------
FPL_lib  := libFPL.so
FPL_mod  := fpl.mod
FPL_srcdir := $(CURDIR)/src

#------------------------------------------------------------------------------
# Compiler settings
#------------------------------------------------------------------------------
FC       := gfortran
FCFLAGS  := -Wall -O3 -shared -fPIC -cpp
OPENMP   := -fopenmp

#------------------------------------------------------------------------------
# Distro-specific paths (override with: make LIBDIR=... MODDIR=... NETCDF=...)
#------------------------------------------------------------------------------
ifneq (,$(filter $(OS),fedora korora rhel centos rocky alma))
  LIBDIR   ?= /usr/lib64
  MODDIR   ?= /usr/lib64/gfortran/modules
  NETCDF   ?= -I$(MODDIR) -lnetcdff -lnetcdf
else ifneq (,$(filter $(OS),debian ubuntu linuxmint pop))
  LIBDIR   ?= /usr/lib
  MODDIR   ?= /usr/include
  NETCDF   ?= -I$(MODDIR) -lnetcdff -lnetcdf
else
  # Generic fallback — user can override via NETCDF=...
  LIBDIR   ?= /usr/local/lib
  MODDIR   ?= /usr/local/include
  NETCDF   ?= -lnetcdff -lnetcdf
  $(warning Unknown OS "$(OS)". Set LIBDIR, MODDIR, and NETCDF manually if needed.)
endif

#------------------------------------------------------------------------------
# Targets
#------------------------------------------------------------------------------
.PHONY: all build install uninstall clean help

all: build

build: $(FPL_lib)

$(FPL_lib): $(FPL_srcdir)/FPL.f90
	$(FC) $(OPENMP) $(FCFLAGS) -o $(FPL_lib) $(FPL_srcdir)/FPL.f90 $(NETCDF)
	@echo "Build complete: $(FPL_lib)  $(FPL_mod)"

install: $(FPL_lib)
	install -d $(DESTDIR)$(LIBDIR) $(DESTDIR)$(MODDIR)
	install -m 755 $(FPL_lib) $(DESTDIR)$(LIBDIR)/
	install -m 644 $(FPL_mod) $(DESTDIR)$(MODDIR)/
	@echo "Installed $(FPL_lib) -> $(DESTDIR)$(LIBDIR)/"
	@echo "Installed $(FPL_mod) -> $(DESTDIR)$(MODDIR)/"

uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/$(FPL_lib)
	rm -f $(DESTDIR)$(MODDIR)/$(FPL_mod)
	@echo "Uninstalled $(FPL_lib) and $(FPL_mod)"

clean:
	rm -f $(FPL_lib) $(FPL_mod)

# Backward compatibility with the old target name
compile: build install

help:
	@echo "Usage:"
	@echo "  make              Build the library (local)"
	@echo "  make build        Build the library (local)"
	@echo "  make install      Build + install to system dirs (may need sudo)"
	@echo "  make uninstall    Remove from system dirs"
	@echo "  make clean        Remove local build artifacts"
	@echo "  make compile      Legacy: build + install"
	@echo ""
	@echo "Overridable variables:"
	@echo "  FC       Fortran compiler   (default: gfortran)"
	@echo "  LIBDIR   Library install dir (default: auto-detected)"
	@echo "  MODDIR   Module install dir  (default: auto-detected)"
	@echo "  NETCDF   NetCDF flags        (default: auto-detected)"
