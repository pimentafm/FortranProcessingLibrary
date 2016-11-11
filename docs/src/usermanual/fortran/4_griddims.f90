program main
  use f90netcdf
  implicit none

  !Database download from UNIDATA:
  !                               file: test_echam_spectral.nc
  !                               http://www.unidata.ucar.edu/software/netcdf/examples/files.html                  

  !Set float datatype 3d dataset with, longitude and latitude and time in double datatype  
  type(nc3d_float_lld_td) :: spectral

  !Input and Output declarations
  character(200) :: inputpath

  inputpath = "database/test_echam_spectral.nc"
  
  !Set necessary parameters for read the data
  spectral%varname = "albedo_nir"
  spectral%timename = "time"
  spectral%lonname = "lon"
  spectral%latname = "lat"

  !Call function to get data dimension sizes
  call griddims(inputpath, spectral)
  
  write(*,*) "====== Dataset Information ======="
  write(*,*) "=================================="
  
  !Get data information using pointer to structures
  
  write(*,101) "    nlons: ", spectral%nlons

  write(*,101) "    nlats: ", spectral%nlats

  write(*,101) "   ntimes: ", spectral%ntimes

101 format(a12,i3)

end program main
