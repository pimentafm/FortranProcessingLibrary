! FPL - Example 06
!
! Purpose:       Filters some files with soybean cultivation
! FPL datatypes: nc2d_double_lld 
! FPL tools:     readgrid, writegrid, dealloc  

program main
  use FPL
  implicit none

  integer(kind=4) :: k
  character(len=4) :: year

  !variable type: double
  !longitude and latitude type: double

  !Related article and original data download
  !Dias, L.C.P., Pimenta, F.M., Santos, A.B., Costa, M.H., Ladle, R.J. (2016). 
  !Patterns of land use, extensification and intensification of Brazilian agriculture. 
  !Global Change Biology. doi:10.1111/gcb.13314
  !http://onlinelibrary.wiley.com/doi/10.1111/gcb.13314/ful

  !Download: http://www.biosfera.dea.ufv.br/en-US/bancos
  
  !Soybean is in hectare (ha)
  type(nc2d_double_lld) :: soybean

  !Reads data from 2000 to 2014
  do k = 2000, 2014
    write(year, '(i4)') k
    write(*, '(1a1,a25,x,i4,$)') char(13), "Filtering :::::::::::::: ", k
 
    soybean%varname = "landuse"
    soybean%lonname = "lon"
    soybean%latname = "lat"

    call readgrid("database/LUCULTSOJA"//year//".nc", soybean)
    !Remove the data below 10 ha.
    where(soybean%ncdata.lt.10.and.soybean%ncdata.ne.soybean%FillValue)
      soybean%ncdata = 0.0
    elsewhere(soybean%ncdata.eq.0)
      soybean%ncdata = 0.0
    endwhere
 
    !Write filtered data on file
    call writegrid("database/filteredSoybean"//year//".nc", soybean)
    
    !Deallocates the structure to receive new data
    call dealloc(soybean)
  end do
    
  write(*,*) "Finish filtering"

end program main
