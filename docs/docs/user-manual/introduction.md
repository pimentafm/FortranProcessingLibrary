---
sidebar_position: 1
---

# Introduction

Most scientists are familiar with NetCDF processing using tools like [NCL (NCAR Command Language)](http://www.ncl.ucar.edu). However, when faced with problems involving large databases or massive processing, they need to use more efficient languages and parallel computing techniques to improve performance.

This is not an easy task because the user needs to understand how the Fortran-NetCDF-OpenMP interaction works, in addition to having enough programming knowledge.

Thinking about these problems, **FPL** — a set of modules programmed in Fortran 90 — was created to facilitate the development of applications using [NetCDF](http://www.unidata.ucar.edu/software/netcdf/) and [OpenMP](http://openmp.org/).

FPL reads and writes data up to 4 dimensions in a very simple way (similar to NCL) using dynamic data structures and dynamic modules.
