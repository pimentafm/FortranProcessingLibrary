program main
  use fpl
  implicit none

  !Structure declarations for CATTLE19902012.nc (3d dataset)
  !variable type: double
  !longitude and latitude type: double
  !time type: integer

  !Related article and original data download
  !Dias, L.C.P., Pimenta, F.M., Santos, A.B., Costa, M.H., Ladle, R.J. (2016). 
  !Patterns of land use, extensification and intensification of Brazilian agriculture. 
  !Global Change Biology. doi:10.1111/gcb.13314
  !http://onlinelibrary.wiley.com/doi/10.1111/gcb.13314/ful

  !Download: http://www.biosfera.dea.ufv.br/en-US/bancos
 
  !Stocking rate of cattle are in heads per hectare (head/ha)
  type(nc3d_double_lld_ti) :: cattle

  !Structure declarations for brazil_UF.nc (2d dataset)
  !variable type: byte
  !longitude and latitude datatype: double

  !Brazilian UF data
  type(nc2d_byte_lld) :: maskara

  !Auxiliary variables for time calculation
  real*4 :: start_time, end_time
  
  character(200) :: inputpath, outputpath, maskfile

  inputpath = "database/CATTLE19902012.nc"
  maskfile = "database/brazil_UF.nc"
  outputpath = "database/cattle19902012_mask.nc"
  
  cattle%varname = "Cattle"
  cattle%timename = "time"
  cattle%lonname = "lon"
  cattle%latname = "lat"
 
  maskara%varname = "UF"
  maskara%lonname = "lon"
  maskara%latname = "lat"
 
  write(*,*)"Readind data" 
  call readgrid(maskfile, maskara)                               !Read states data
  
  write(*,*)"Reading mask"
  call readgrid(inputpath, cattle)                               !Read cattle data

  write(*,*)"Setting FillValue"
  call setfvalue3d_bytedouble_lld_ti(maskara, cattle, 18)        !Masks the cattle data where the state map is equal to 18 (Brazil-MG).

  write(*,*) "Writing data"
  call writegrid(outputpath, cattle)                             !Saves the masked data

end program main
