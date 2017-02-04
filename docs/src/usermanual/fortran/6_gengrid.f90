program main
  use fpl
  implicit none

  !Definition of dataset structures
  type(nc3d_int_llf_ti) :: grid3d
 
  !Auxiliary variables
  integer(kind=intgr) :: i, j, k, l

  character(200) :: opath3d

  !Output files
  opath3d = "database/grid3d.nc"


  !Grid 3d definitions
  grid3d%long_name = "My Grid 1 degree"
  
  grid3d%varname = "grid"
  grid3d%lonname = "lon"
  grid3d%latname = "lat"
  grid3d%timename = "time"

  grid3d%varunits = "dimensionless"
  grid3d%lonunits = "degrees_east"
  grid3d%latunits = "degrees_north"
  grid3d%timeunits = "hour"

  grid3d%ntimes = 10

  grid3d%FillValue = -9999

  !   Latitude|                                  Xmin: westernmost longitude   
  !           |                                  Ymin: southernmost latitude
  !           |       Ymax                       Xmax: easternmost longitude
  !           |_________________                 Ymax: northernmost latitude
  !           |__|__|__|__|__|__|                i, j: initial position of the matrix on the x-axis and y-axis (i=0,j=0).
  !           |__|__|__|__|__|__|                
  !      Xmin |__|__|__|__|__|__| Xmax           
  !           |__|__|__|__|__|__|
  !          j|__|__|__|__|__|__|_____________ 
  !           i                      Longitude 
  !                   Ymin

  !Generates a 3d grid
  call gengrid(grid3d, -74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965, 1.0)

  !Fills the array data
  do i = 1, grid3d%ntimes
    do j = 1, grid3d%nlons
      do k = 1, grid3d%nlats
        grid3d%ncdata(j,k,i) = int(i*(cos(real(j))*grid3d%longitudes(j) + k*grid3d%latitudes(k)))
      end do
    end do
  end do

  !Write 3d data on file
  call writegrid(opath3d, grid3d)

end program main

