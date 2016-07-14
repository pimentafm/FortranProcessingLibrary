program fivep
  use ncf90api
  implicit none
  
  integer(kind = 4) :: i, j, k

  type(nc2d_double_lld) areapix, soja

  character(len=300) inputpath, outputpath, headerfile, pixpath 
  character(len=4) :: year
 
  pixpath = "/home/fernando/Documents/WORKSPACE/pousa/arquivos/pixelArea_brazil.nc"
 
  headerfile = "/home/fernando/Documents/WORKSPACE/pousa/arquivos/headerfile.txt"

  areapix%varname = "pixelArea"
  areapix%lonname = "lon"
  areapix%latname = "lat"

  call readgrid(pixpath, areapix)

  do k = 1990, 2012
    write(year, '(i4)') k
    write(*,*) k

    inputpath = "/home/fernando/Documents/WORKSPACE/pousa/bhalu/LUCULTSOJA"//year//".nc"
    outputpath = "/home/fernando/Documents/WORKSPACE/pousa/output/soja5p/LUCULTSOJA"//year//".nc"

    soja%varname = "landuse"
    soja%lonname = "lon"
    soja%latname = "lat"

    call readgrid(inputpath, soja)

    do i = 1, soja%nlons
      do j = 1, soja%nlats
        if(soja%ncdata(i,j).ne.soja%FillValue) then
          soja%ncdata(i,j) = soja%ncdata(i,j)/(areapix%ncdata(i,j)/0.01)
        end if
      end do
    end do
    
    do i = 1, soja%nlons
      do j = 1, soja%nlats
        if(soja%ncdata(i,j).ne.soja%FillValue.and.soja%ncdata(i,j).gt.0.05) then
          soja%ncdata(i,j) = soja%ncdata(i,j)*(areapix%ncdata(i,j)/0.01)
          else
            soja%ncdata(i,j) = soja%FillValue
        end if
      end do
    end do
    
    call writegrid(outputpath, soja, headerfile)
    
    deallocate(soja%ncdata, soja%longitudes, soja%latitudes)
  end do
 
end program fivep
