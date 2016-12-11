program main
  use fpl
  implicit none

  integer(kind=4) :: k
  character(len=4) :: year

  type(nc2d_double_lld) :: soybean

  do k = 2000, 2010
    write(year, '(i4)') k
    write(*, '(1a1,a25,x,i4,$)') char(13), "Filtering :::::::::::::: ", k
 
    soybean%varname = "landuse"
    soybean%lonname = "lon"
    soybean%latname = "lat"

    call readgrid("database/LUCULTSOJA"//year//".nc", soybean)
 
    where(soybean%ncdata.lt.10.and.soybean%ncdata.ne.soybean%FillValue)
      soybean%ncdata = 0.0
    elsewhere(soybean%ncdata.eq.0)
      soybean%ncdata = 0.0
    endwhere

    call writegrid("database/SojaMun"//year//".nc", soybean)

    call dealloc(soybean)
  end do
    
  write(*,*) "Finish filtering"

end program main
