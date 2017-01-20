program main
  use fpl
  implicit none

  type(nc3d_double_lld_ti) :: lu3
  type(nc2d_double_lld) :: lu2, lu
  
  integer(kind=4) :: i
  character(200) :: inputpath, outputpath
  character(len=4) :: ano

  inputpath = "database/LUCULTSOJA2012.nc"

  lu%varname = "landuse"
  lu%lonname = "lon"
  lu%latname = "lat"
  
  call readgrid(inputpath, lu)

  lu3%varname    =   lu%varname   
  lu3%lonname    =   lu%lonname
  lu3%latname    =   lu%latname
  lu3%timename   =   "time"
  lu3%long_name  =   lu%long_name
  lu3%varunits   =   lu%varunits
  lu3%lonunits   =   lu%lonunits
  lu3%latunits   =   lu%latunits
  lu3%timeunits  =   "year"
  lu3%nlons      =   lu%nlons
  lu3%nlats      =   lu%nlats
  lu3%ntimes     =   15
  lu3%vartype    =   lu%vartype
  lu3%FillValue  =   lu%FillValue

  allocate(lu3%longitudes(lu3%nlons))
  allocate(lu3%latitudes(lu3%nlats))
  allocate(lu3%times(lu3%ntimes))
  allocate(lu3%ncdata(lu3%nlons,lu3%nlats,lu3%ntimes)) 

  lu3%longitudes = lu%longitudes
  lu3%latitudes = lu%latitudes

  do i = 1, 15
    write(ano,'(i4)') 1999+i
    write(*,'(i4)') 1999+i

    inputpath = "database/LUCULTSOJA"//ano//".nc"

  
    lu2%varname = "landuse"
    lu2%lonname = "lon"
    lu2%latname = "lat"
  
    call readgrid(inputpath, lu2)
  
    lu3%times(i) = 1999+i
 
    lu3%ncdata(:,:,i) = lu2%ncdata
    
    call dealloc(lu2)
  end do

  outputpath = "database/LUSOYBEAN19902014.nc"
  call writegrid(outputpath, lu3, "database/diasetal_headerfile.txt")

end program main
