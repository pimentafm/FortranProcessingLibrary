program main
  use f90netcdf
  implicit none

  !Structure declarations for CATTLE19902012.nc (3d dataset)
  !variable type: double
  !longitude and latitude type: double
  !time type: integer

  !Related article and data download
  !Dias, L.C.P., Pimenta, F.M., Santos, A.B., Costa, M.H., Ladle, R.J. (2016). 
  !Patterns of land use, extensification and intensification of Brazilian agriculture. 
  !Global Change Biology. doi:10.1111/gcb.13314
  !http://onlinelibrary.wiley.com/doi/10.1111/gcb.13314/ful

  !Download: http://www.biosfera.dea.ufv.br/pt-BR/banco/uso-do-solo-agricola-no-brasil-1940-2012---dias-et-al-2016
 
  type(nc3d_double_lld_ti) :: cattle

  !Structure declarations for maskestadosBR2012.nc (2d dataset)
  !variable type: byte
  !longitude and latitude datatype: double
  
  !Download:

  type(nc2d_byte_lld) :: maskara

  character(200) :: inputpath, outputpath, maskfile

  inputpath = "database/CATTLE19902012.nc"
  maskfile = "database/maskestadosBRbyte.nc"
  outputpath = "database/cattle19902012_mask.nc"
  
  cattle%varname = "Cattle"
  cattle%timename = "time"
  cattle%lonname = "lon"
  cattle%latname = "lat"
 
  maskara%varname = "Band1"
  maskara%lonname = "lon"
  maskara%latname = "lat"
 
  write(*,*)"Readind data" 
  call readgrid(maskfile, maskara)

  write(*,*)"Reading mask"
  call readgrid(inputpath, cattle)

  write(*,*)"Setting FillValue"
  call setFillValue(maskara, cattle, 21)
  
  write(*,*) "Writing masked data"
  call writegrid(outputpath, cattle)
end program main
