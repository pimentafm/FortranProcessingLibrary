program main
  use fpl
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

  !Call function to read the data (readgrid(input_data_path, defined_data_structure))
  call readgrid(inputpath, spectral)
  
  write(*,*) "====== Dataset Information ======="
  write(*,*) "=================================="
  
  !Get data information using pointer to structures
  write(*,100) "  varname: ", spectral%varname  
  write(*,100) " varunits: ", spectral%varunits
  
  write(*,100) "  lonname: ", spectral%lonname 
  write(*,101) "    nlons: ", spectral%nlons
  write(*,100) " lonunits: ", spectral%lonunits

  write(*,100) "  latname: ", spectral%latname
  write(*,101) "    nlats: ", spectral%nlats
  write(*,100) " latunits: ", spectral%latunits

  write(*,100) " timename: ", spectral%timename  
  write(*,101) "   ntimes: ", spectral%ntimes
  write(*,100) "timeunits: ", spectral%timeunits

100 format(2a12)
101 format(a12,i3)

end program main
