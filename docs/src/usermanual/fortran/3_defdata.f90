program main
  use fpl
  implicit none

  !Definition of double 4-dimensional dataset (lon, lat, time, level)
  !Array of coordinastes in float type
  !Array of times in integer type
  !Array o levels in integer type
  type(nc4d_double_llf_ti_li) :: grid4d

  !Set initial data fields
  grid4d%varname = "landuse" !Variable name to read from NetCDF file.
  grid4d%timename = "time" !Name of time dimension   
  grid4d%levelname = "Pressure" !Name of level dimension
  grid4d%lonname = "lon" !Name of longitude dimension
  grid4d%latname = "lat" !Name of latitude dimension
  grid4d%long_name = "Land Use of Brazil (1940-2012)" !NetCDF title [optional]

  grid4d%varunits = "ha" !Variable unit
  grid4d%timeunits = "hour" !Time unit
  grid4d%levelunits = "hPa" !Level unit
  grid4d%lonunits = "degrees_east" !longitude unit
  grid4d%latunits = "degrees_north" !Latitude unit
  grid4d%nlons = 40 !Total number of longitudes
  grid4d%nlats = 57 !Total number of latitudes
  grid4d%ntimes = 10 !Total number of times
  grid4d%nlevels = 3 !Total number of levels

  write(*,*) grid4d%varname    
  write(*,*) grid4d%timename   
  write(*,*) grid4d%levelname  
  write(*,*) grid4d%lonname    
  write(*,*) grid4d%latname    
  write(*,*) grid4d%long_name  

  write(*,*) grid4d%varunits   
  write(*,*) grid4d%timeunits  
  write(*,*) grid4d%levelunits 
  write(*,*) grid4d%lonunits   
  write(*,*) grid4d%latunits   
  write(*,*) grid4d%nlons      
  write(*,*) grid4d%nlats      
  write(*,*) grid4d%ntimes     
  write(*,*) grid4d%nlevels   
 
end program main
