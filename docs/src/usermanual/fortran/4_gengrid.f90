program generategrid
  use f90netcdf
  implicit none

  type(nc3d_int_llf_ti) :: grid3d
  
  integer(kind=intgr) :: i, j, k, s

  real(kind=4) :: Xmin, Ymin, Xmax, Ymax, res

  !Grid 3d
  grid3d%long_name = "My Grid ~ 1 degree"
  
  grid3d%varname = "id"
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

  Xmin = 80.0
  Ymin = 40.0
  Xmax = 180.0
  Ymax = 90.0
  res = 1.0

  call gengrid(grid3d, -74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965, 1.0 )

  do i = 1, grid3d%ntimes
    s = 0
    do j = 1, grid3d%nlons
      do k = 1, grid3d%nlats
        s = s + 1
        grid3d%ncdata(j,k,i) = s    
      end do
    end do
  end do
  
end program generategrid

