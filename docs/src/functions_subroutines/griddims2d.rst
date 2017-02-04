griddims2d (2-dimensional Dataset)
``````````````````````````````````
.. highlight:: fortran
   :linenothreshold: 2

griddims2d _ ``[vdt]`` _ll ``[cdt]`` subroutine is used to read the dimension informations in a 2-dimensional NetCDF dataset. 
Combinations can be made for the statements of this subroutine by replacing ``[vdt]`` 
by one of the data types defined in the **FPL** library (``[byte, short, int, float, double]``) 
and ``[cdt]`` by a defined suffix for the data type of the coordinates ``f`` for float and ``d`` for double.

griddims2d _ ``[vdt]`` _ll ``[cdt]`` (ifile, idata)
---------------------------------------------------

:Type naming:
 :``[vdt]``: variable datatype `[byte, short, int, float or double]`
 :``[cdt]``: coordinates datatype(float ``f``, double ``d``).
:Subroutine Parameters:
 :``ifile``: file path `[character]` 
 :``idata``: 2d dataset structure `[FPL defined type structure]` 
:Local parameters: 
 :``ncid``: map ID `[integer]`
 :``xdimid``: longitude dimension ID `[integer]`
 :``ydimid``: latitude dimension ID `[integer]`
 :``varid``: variable dimension ID `[integer]`
:Return:
 :``varunits``: variable units `[character]`
 :``lonunits``: longitude units `[character]`
 :``latunits``: latitude units `[character]`
 :``dimunits``: dimension units array `[character]`
 :``dimnames``: array of dimension names `[character]`
 :``ndims``: number of variable dimensions `[integer]`
 :``dims``: dimension IDs corresponding to the variable dimensions `[integer]`
 :``dimid``: array of dimension IDs `[integer]`
 :``dimsize``: array of size of dimensions `[integer]`
 :``nlons``: longitude dimension size from ``ifile`` `[integer]`
 :``nlats``: latitude dimension size from ``ifile`` `[integer]`
 :``vartype``: number of variable datatype `[integer]` according to `NetCDF Library (C/C++ and Fortran) <https://github.com/Unidata/netcdf-fortran>`_
 :``varids``: array of variables IDs `[integer]`
 :``long_name``: `[long name dataset title]`
 :``_FillValue``: fill value `[byte, short, integer, float, double]`

**Example:**

Read variable datatype ID and coordinates dimensions of a 2-dimensional NetCDF dataset with variable declared as byte and coordinates declared as float (nc2d _ ``byte`` _ll ``f``).

::

  subroutine griddims2d_byte_llf(ifile, idata)
    type (nc2d_byte_llf) :: idata
    integer(kind=intgr) :: ncid, varid, i
    character(*), intent(in) :: ifile
    !Open NetCDF File
    call check(nf90_open(ifile, nf90_nowrite, ncid))
  
    !Inquire variable type and number of dimensions
    call checkvarid(nf90_inq_varid(ncid, idata%varname, varid), idata%varname)
    call check(nf90_inquire_variable(ncid,varid,idata%varname, idata%vartype, idata%ndims, idata%dims))
   
    allocate(idata%dimid(idata%ndims))
    allocate(idata%varids(idata%ndims))
    allocate(idata%dimunits(idata%ndims))
    allocate(idata%dimname(idata%ndims))
    allocate(idata%dimsize(idata%ndims)) 
  
    idata%dimname(1) = idata%lonname
    idata%dimname(2) = idata%latname
    
    !Get number of
    do i = 1, idata%ndims 
      call checkdimid(nf90_inq_dimid(ncid, idata%dimname(i), idata%dimid(i)), idata%dimname(i))
    end do
  
    call bubbleSort(idata%dimid, idata%dimname, idata%ndims)
  
    !Get dimension sizes
    do i = 1, idata%ndims
      call check(nf90_inquire_dimension(ncid, idata%dimid(i), idata%dimname(i), idata%dimsize(i)))
    end do
  
    !Get 
    do i = 1, idata%ndims
      call check(nf90_inq_varid(ncid, idata%dimname(i), idata%varids(i)))
      call check(nf90_get_att(ncid, idata%varids(i), "units", idata%dimunits(i)), idata%dimunits(i), ifile)
    end do 
    
    !Get some attributes
    call check(nf90_get_att(ncid, varid, "long_name", idata%long_name), "long_name", ifile)
    call check(nf90_get_att(ncid, varid, "_FillValue", idata%FillValue), "_FillValue", ifile)
    call check(nf90_get_att(ncid, varid, "units", idata%varunits),"varunits", ifile)
  
    do i = 1, idata%ndims
      if(idata%dimname(i).eq."longitude".or.idata%dimname(i).eq."lon") then
        idata%nlons = idata%dimsize(i)
        idata%lonunits = idata%dimunits(i)
      end if
      if(idata%dimname(i).eq."latitude".or.idata%dimname(i).eq."lat") then
        idata%nlats = idata%dimsize(i)
        idata%latunits = idata%dimunits(i)
      end if
    end do
  
    !Close NetCDF
    call check(nf90_close(ncid))
  end subroutine griddims2d_byte_llf

