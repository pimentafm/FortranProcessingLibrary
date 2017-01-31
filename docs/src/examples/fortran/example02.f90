! FPL - Example 01
!
! Purpose:       Create 2d, 3d and 4d datasets
! FPL datatypes: nc4d_float_llf_ti_li, nc3d_int_llf_ti, nc2d_double_llf
! FPL tools:     gengrid, writegrid 

program main
  use fpl
  implicit none

  type(nc2d_double_llf) :: grid2d
  type(nc3d_int_llf_ti) :: grid3d
  type(nc4d_float_llf_ti_li) :: grid4d
 
  integer(kind=intgr) :: i, j, k, l

  real(kind=4) :: Xmin, Ymin, Xmax, Ymax, res

  character(200) :: opath2d, opath3d, opath4d

  !Output files
  opath2d = "database/grid2d.nc"
  opath3d = "database/grid3d.nc"
  opath4d = "database/grid4d.nc"


  !Grid 2d
  grid2d%long_name = "My Grid ~ 1 degree"
  
  grid2d%varname = "id"
  grid2d%lonname = "lon"
  grid2d%latname = "lat"

  grid2d%varunits = "dimensionless"
  grid2d%lonunits = "degrees_east"
  grid2d%latunits = "degrees_north"

  grid2d%FillValue = -9999

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

  !Grid 4d
  grid4d%long_name = "My Grid ~ 1 degree"
  
  grid4d%varname = "id"
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

  Xmin = -74.7371
  Ymin = -34.3437
  Xmax = -34.7371
  Ymax = 5.6562
  res = 0.00833333

  call gengrid(grid2d, Xmin, Ymin, Xmax, Ymax, res)

  do i = 1, grid2d%nlons
    do j = 1, grid2d%nlats
      grid2d%ncdata(i,j) = cos(grid2d%longitudes(i)) + grid2d%latitudes(j)
    end do
  end do
  
  call writegrid(opath2d, grid2d)

  call gengrid(grid3d, -74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965, 1.0 )

  do i = 1, grid3d%ntimes
    do j = 1, grid3d%nlons
      do k = 1, grid3d%nlats
        grid3d%ncdata(j,k,i) = int(i*(cos(real(j))*grid3d%longitudes(j) + k*grid3d%latitudes(k)))
      end do
    end do
  end do
  
  call writegrid(opath3d, grid3d)

  call gengrid(grid4d, -74.73715442059999, -34.343706397220295, -34.73715458059378, 5.6562934427799965, 1.0 )

  do l = 1, grid4d%nlevels
    do i = 1, grid4d%ntimes
      do j = 1, grid4d%nlons
        do k = 1, grid4d%nlats
          grid4d%ncdata(j,k,i,l) = int((l**3)/i*(cos(real(j))*grid4d%longitudes(j) + k*grid4d%latitudes(k)))   
        end do
      end do
    end do
  end do

  call writegrid(opath4d, grid4d, "database/gridHeader.txt")

end program main

