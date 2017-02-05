! FPL - Example 03
!
! Purpose:       Masks cattle data according to Minas Gerais State
! FPL datatypes: nc2d_byte_lld, nc3d_double_lld_ti 
! FPL tools:     readgrid, writegrid, exec_time, setFillValue 

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
  call exec_time(start_time)                                     !Save initial time
  call readgrid(maskfile, maskara)                               !Read estates data
  call exec_time(end_time)                                       !Save final time
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time !Execution time

  write(*,*) "vartype: ", maskara%vartype

  write(*,*)"Reading mask"
  call exec_time(start_time)
  call readgrid(inputpath, cattle)                               !Read cattle data
  call exec_time(end_time)
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time

  write(*,*) "cattle vartype: ", cattle%vartype
  
  write(*,*)"Setting FillValue"
  call exec_time(start_time)
  call setFillValue(maskara, cattle, 18)        !Masks the cattle data where the state map is equal to 18.
  call exec_time(end_time)
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time

  write(*,*) "Writing data"
  call exec_time(start_time)
  call writegrid(outputpath, cattle)                             !Saves the masked data
  call exec_time(end_time)
  write(*,'("  Time:", f15.3," seconds")') end_time - start_time
end program main
