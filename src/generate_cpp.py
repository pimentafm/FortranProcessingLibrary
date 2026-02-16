#!/usr/bin/env python3
"""
Generate FPL instantiation (.f90) files from CPP templates (.inc).

The .inc template files in src/templates/ are maintained manually.
This script only generates the .f90 files that contain repeated
#define / #include / #undef blocks for each type combination.

Usage:  python3 src/generate_cpp.py
"""
import os

DIR = os.path.dirname(os.path.abspath(__file__))

GPL = """\
!:=============================================================================
! This file is part of FPL (Fortran Processing Library).

! Copyright (C) 2015 Fernando Martins Pimenta

! FPL is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! FPL is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with FPL.  If not, see <http://www.gnu.org/licenses/>.

!:=============================================================================
! About Author:
! Fernando Martins Pimenta
!  Student of Surveying and Cartographic Engineering
!  Federal University of Viçosa - Brazil

!  Bachelor of Biosystems Engineer
!  Federal University of São João del-Rei - Brazil

!  Research Group on Atmosphere-Biosphere Interaction
!  Federal University of Viçosa
!  Data: August 09, 2015

!Contacts: fernando.m.pimenta@gmail.com, fernando.m.pimenta@ufv.br
!:=============================================================================
"""

# ── Type catalogue ───────────────────────────────────────────────────────────
#               name     kind     class      nf90             label
DTYPES  = [("byte","byte","integer","nf90_byte","BYTE"),
           ("short","short","integer","nf90_short","SHORT"),
           ("int","intgr","integer","nf90_int","INT"),
           ("float","float","real","nf90_float","FLOAT"),
           ("double","double","real","nf90_double","DOUBLE")]
COORDS  = [("llf","float","nf90_float"), ("lld","double","nf90_double")]
TIMES   = [("ti","intgr","integer","nf90_int"),
           ("tf","float","real","nf90_float"),
           ("td","double","real","nf90_double")]
LEVELS  = [("li","intgr","integer","nf90_int"),
           ("lf","float","real","nf90_float")]

# ── Helpers ──────────────────────────────────────────────────────────────────
def block(defines, inc):
    """One #define / #include / #undef block."""
    keys = [k for k, _ in defines]
    return "".join(f"#define {k} {v}\n" for k, v in defines) + \
           f'#include "templates/{inc}"\n' + \
           "".join(f"#undef {k}\n" for k in keys) + "\n"

def write(name, content):
    path = os.path.join(DIR, name)
    with open(path, "w", newline="\n") as f:
        f.write(content)
    print(f"  {name}  ({sum(1 for c in content if c == chr(10))} lines)")


# ── Combo generators ────────────────────────────────────────────────────────
def combos_2d():
    return [(d, c) for d in DTYPES for c in COORDS]

def combos_3d():
    return [(d, c, t) for d in DTYPES for c in COORDS for t in TIMES]

def combos_4d():
    return [(d, c, t, l) for d in DTYPES for c in COORDS for t in TIMES for l in LEVELS]

def suf2(d, c):       return f"{d[0]}_{c[0]}"
def suf3(d, c, t):    return f"{d[0]}_{c[0]}_{t[0]}"
def suf4(d, c, t, l): return f"{d[0]}_{c[0]}_{t[0]}_{l[0]}"
def fdecl(d):          return f"{d[2]}(kind={d[1]})"

# ── File generators ─────────────────────────────────────────────────────────
def gen_datatypes():
    out = GPL
    for d, c in combos_2d():
        out += block([("FPL_TYPE", f"nc2d_{suf2(d,c)}"),
                      ("FPL_FILL_DECL", fdecl(d)),
                      ("FPL_COORD_KIND", c[1])], "datatypes_2d.inc")
    for d, c, t in combos_3d():
        out += block([("FPL_TYPE", f"nc3d_{suf3(d,c,t)}"),
                      ("FPL_FILL_DECL", fdecl(d)),
                      ("FPL_COORD_KIND", c[1]),
                      ("FPL_TIME_DECL", f"{t[2]}(kind={t[1]})")], "datatypes_3d.inc")
    for d, c, t, l in combos_4d():
        out += block([("FPL_TYPE", f"nc4d_{suf4(d,c,t,l)}"),
                      ("FPL_FILL_DECL", fdecl(d)),
                      ("FPL_COORD_KIND", c[1]),
                      ("FPL_TIME_DECL", f"{t[2]}(kind={t[1]})"),
                      ("FPL_LEVEL_DECL", f"{l[2]}(kind={l[1]})")], "datatypes_4d.inc")
    write("FPL_datatypes.f90", out)

def gen_simple(module, prefix):
    """Generate dealloc, griddims, gengrid, readgrid (only FPL_SUBR + FPL_TYPE)."""
    extra = {"readgrid": lambda d: [("FPL_LABEL", f'"{d[4]}"')],
             "gengrid":  lambda d: [("FPL_NF90_VARTYPE", d[3])]}
    out = GPL
    for d, c in combos_2d():
        defs = [("FPL_SUBR", f"{prefix}2d_{suf2(d,c)}"),
                ("FPL_TYPE", f"nc2d_{suf2(d,c)}")]
        if module in extra: defs += extra[module](d)
        out += block(defs, f"{module}_2d.inc")
    for d, c, t in combos_3d():
        defs = [("FPL_SUBR", f"{prefix}3d_{suf3(d,c,t)}"),
                ("FPL_TYPE", f"nc3d_{suf3(d,c,t)}")]
        if module in extra: defs += extra[module](d)
        out += block(defs, f"{module}_3d.inc")
    for d, c, t, l in combos_4d():
        defs = [("FPL_SUBR", f"{prefix}4d_{suf4(d,c,t,l)}"),
                ("FPL_TYPE", f"nc4d_{suf4(d,c,t,l)}")]
        if module in extra: defs += extra[module](d)
        out += block(defs, f"{module}_4d.inc")
    write(f"FPL_{module}.f90", out)

def gen_writegrid():
    out = GPL
    for d, c in combos_2d():
        out += block([("FPL_SUBR", f"writegrid2d_{suf2(d,c)}"),
                      ("FPL_TYPE", f"nc2d_{suf2(d,c)}"),
                      ("FPL_NF90_COORD", c[2])], "writegrid_2d.inc")
    for d, c, t in combos_3d():
        out += block([("FPL_SUBR", f"writegrid3d_{suf3(d,c,t)}"),
                      ("FPL_TYPE", f"nc3d_{suf3(d,c,t)}"),
                      ("FPL_NF90_COORD", c[2]),
                      ("FPL_NF90_TIME", t[3])], "writegrid_3d.inc")
    for d, c, t, l in combos_4d():
        out += block([("FPL_SUBR", f"writegrid4d_{suf4(d,c,t,l)}"),
                      ("FPL_TYPE", f"nc4d_{suf4(d,c,t,l)}"),
                      ("FPL_NF90_COORD", c[2]),
                      ("FPL_NF90_TIME", t[3]),
                      ("FPL_NF90_LEVEL", l[3])], "writegrid_4d.inc")
    write("FPL_writegrid.f90", out)

def gen_setfillvalue():
    out = GPL
    for c in COORDS:
        for md in DTYPES:
            for mp in DTYPES:
                out += block([("FPL_SUBR", f"setfvalue2d_{md[0]}{mp[0]}_{c[0]}"),
                              ("FPL_MASK_TYPE", f"nc2d_{md[0]}_{c[0]}"),
                              ("FPL_MAP_TYPE",  f"nc2d_{mp[0]}_{c[0]}")], "setfillvalue_2d.inc")
    for c in COORDS:
        for t in TIMES:
            for md in DTYPES:
                for mp in DTYPES:
                    out += block([("FPL_SUBR", f"setfvalue3d_{md[0]}{mp[0]}_{c[0]}_{t[0]}"),
                                  ("FPL_MASK_TYPE", f"nc2d_{md[0]}_{c[0]}"),
                                  ("FPL_MAP_TYPE",  f"nc3d_{mp[0]}_{c[0]}_{t[0]}")], "setfillvalue_3d.inc")
    for c in COORDS:
        for t in TIMES:
            for l in LEVELS:
                for md in DTYPES:
                    for mp in DTYPES:
                        out += block([("FPL_SUBR", f"setfvalue4d_{md[0]}{mp[0]}_{c[0]}_{t[0]}_{l[0]}"),
                                      ("FPL_MASK_TYPE", f"nc2d_{md[0]}_{c[0]}"),
                                      ("FPL_MAP_TYPE",  f"nc4d_{mp[0]}_{c[0]}_{t[0]}_{l[0]}")], "setfillvalue_4d.inc")
    write("FPL_setfillvalue.f90", out)

def gen_interfaces():
    out = GPL
    out += "interface check\n  module procedure checkerror, checktype, checkatt\nend interface check\n\n"
    for iface, prefix in [("griddims","griddims"),("readgrid","readgrid"),
                          ("writegrid","writegrid"),("gengrid","gengrid"),("dealloc","dealloc")]:
        names = ([f"{prefix}2d_{suf2(d,c)}" for d,c in combos_2d()] +
                 [f"{prefix}3d_{suf3(d,c,t)}" for d,c,t in combos_3d()] +
                 [f"{prefix}4d_{suf4(d,c,t,l)}" for d,c,t,l in combos_4d()])
        out += f"interface {iface}\n  module procedure " + \
               ", &\n                ".join(names) + f"\nend interface {iface}\n\n"
    # setFillValue
    names = ([f"setfvalue2d_{md[0]}{mp[0]}_{c[0]}" for c in COORDS for md in DTYPES for mp in DTYPES] +
             [f"setfvalue3d_{md[0]}{mp[0]}_{c[0]}_{t[0]}" for c in COORDS for t in TIMES for md in DTYPES for mp in DTYPES] +
             [f"setfvalue4d_{md[0]}{mp[0]}_{c[0]}_{t[0]}_{l[0]}" for c in COORDS for t in TIMES for l in LEVELS for md in DTYPES for mp in DTYPES])
    out += "interface setFillValue\n  module procedure " + \
           ", &\n                ".join(names) + "\nend interface setFillValue\n"
    write("FPL_interfaces.f90", out)

def gen_fpl():
    write("FPL.f90", GPL + """\
!:=========================== FPL Main Module =================================
module FPL
  use omp_lib
  use netcdf
  use iso_c_binding
  implicit none
#include "FPL_constants.f90"
#include "FPL_datatypes.f90"
#include "FPL_interfaces.f90"

  contains
#include "FPL_checkerror.f90"
#include "FPL_datetime.f90"
#include "FPL_griddims.f90"
#include "FPL_readgrid.f90"
#include "FPL_writegrid.f90"
#include "FPL_setfillvalue.f90"
#include "FPL_gengrid.f90"
#include "FPL_dealloc.f90"
#include "FPL_fileutils.f90"
#include "FPL_misc.f90"
#include "FPL_sort.f90"
! #include "FPL_zonalstats.f90"
end module FPL
""")

# ── Main ─────────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    print("Generating FPL .f90 instantiation files...")
    gen_datatypes()
    gen_simple("dealloc", "dealloc")
    gen_simple("griddims", "griddims")
    gen_simple("readgrid", "readgrid")
    gen_simple("gengrid", "gengrid")
    gen_writegrid()
    gen_setfillvalue()
    gen_interfaces()
    gen_fpl()
    print("Done.")
