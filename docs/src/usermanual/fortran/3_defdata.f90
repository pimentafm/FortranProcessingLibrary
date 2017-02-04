program main
  use fpl
  implicit none

  !Definition of dataset structures
  type(nc4d_float_llf_ti_li) :: grid4d
 
  !Grid 4d definitions
  grid4d%long_name = "My Grid  ~ 1 degree"
  
  grid4d%varname = "grid"
  grid4d%lonname = "lon"
  grid4d%latname = "lat"
  grid4d%timename = "time"
  grid4d%levelname = "level"

  grid4d%varunits = "dimensionless"
  grid4d%lonunits = "degrees_east"
  grid4d%latunits = "degrees_north"
  grid4d%timeunits = "hour"
  grid4d%levelunits = "m"

  grid4d%ntimes = 10
  grid4d%nlevels = 5

  grid4d%FillValue = -9999
  
  write(*,*) "Grid 4d info ================================="
  write(*,'(a13,a20)')   "varname:    ", grid4d%varname  
  write(*,'(a13,a20)')   "timename:   ", grid4d%timename
  write(*,'(a13,a20)')   "levelname:  ", grid4d%levelname
  write(*,'(a13,a20)')   "latname:    ", grid4d%latname
  write(*,'(a13,a20)')   "lonname:    ", grid4d%lonname
  write(*,'(a13,a20)')   "long_name:  ", grid4d%long_name
  write(*,'(a13,a20)')   "varunits:   ", grid4d%varunits 
  write(*,'(a13,a20)')   "timeunits:  ", grid4d%timeunits
  write(*,'(a13,a20)')   "levelunits: ", grid4d%levelunits
  write(*,'(a13,a20)')   "lonunits:   ", grid4d%lonunits
  write(*,'(a13,a20)')   "latunits:   ", grid4d%latunits
  write(*,'(a13,i4)')    "nlons:      ", grid4d%nlons
  write(*,'(a13,i4)')    "nlats:      ", grid4d%nlats
  write(*,'(a13,i4)')    "nlevels:    ", grid4d%nlevels
  write(*,'(a13,i4)')    "ntimes:     ", grid4d%ntimes
  write(*,'(a13,f10.4)') "FillValue:  ", grid4d%FillValue

end program main

