! FPL - Example 05
!
! Purpose:        Reads a netCDF, show some information and saves the variable was read in another file
! FPL datatypes: nc2d_byte_lld, nc3d_double_lld_ti 
! FPL tools:     readgrid, writegrid, exec_time  

program main
  use fpl
  implicit none

  !  Source: UNIDATA
  !    file: test_echam_spectral.nc
  !download: http://www.unidata.ucar.edu/software/netcdf/examples/files.html                  

  !Set float datatype 3d dataset with, longitude and latitude and time in double datatype  
  type(nc3d_float_lld_td) :: spectral

  !Input and Output declarations
  character(100) :: inputpath, outputpath

  inputpath = "database/test_echam_spectral.nc"
  
  outputpath = "database/spectral.nc"

  !Set necessary parameters for read the data
  spectral%varname = "albedo_nir"
  spectral%timename = "time"
  spectral%lonname = "lon"
  spectral%latname = "lat"

  !Call function to read the data (readgrid(input_data_path, defined_data_structure))
  call readgrid(inputpath, spectral)
  
  write(*,*) "====== Dataset Information ======="
  write(*,*) "=================================="
  
  !Get data information using pointer to structures
  write(*,*) "Grid 4d info ================================="
  write(*,100) "varname :    ", spectral%varname  
  write(*,100) "timename :   ", spectral%timename
  write(*,100) "latname :    ", spectral%latname
  write(*,100) "lonname :    ", spectral%lonname
  write(*,100) "long_name :  ", spectral%long_name
  write(*,100) "varunits :   ", spectral%varunits 
  write(*,100) "timeunits :  ", spectral%timeunits
  write(*,100) "lonunits :   ", spectral%lonunits
  write(*,100) "latunits :   ", spectral%latunits
  write(*,101) "dimname() :  ", spectral%dimname
  write(*,101) "dimunits() : ", spectral%dimunits
  write(*,102) "nlons :      ", spectral%nlons
  write(*,102) "nlats :      ", spectral%nlats
  write(*,102) "ntimes :     ", spectral%ntimes
  write(*,102) "ndims :      ", spectral%ndims
  write(*,102) "vartype :    ", spectral%vartype
  write(*,103) "dimid() :    ", spectral%dimid
  write(*,103) "dimsize() :  ", spectral%dimsize
  write(*,103) "varids() :   ", spectral%varids
  write(*,103) "dims() :     ", spectral%dims
  write(*,'(a13,f10.4)') "FillValue :  ", spectral%FillValue
   
100 format(a13,a25)
101 format(a13,3a20)
102 format(a13,i4)
103 format(a13,3i4)
 
  !Write the data on file
  call writegrid(outputpath, spectral) 
    
end program main
