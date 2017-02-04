program main
  use fpl
  implicit none

  !Definition of dataset structure
  !Variable to be read is float type, with 4 dimensions (longitude (float), latitude (float), time(float) and level(float))
  type(nc4d_float_llf_tf_lf) :: tempC

  character(len=32) :: input, output

  input = "database/temp.mon.nc"
  output = "database/temp.mon.farenheit.nc"

  !Definition of attributes for reading the dataset
  tempC%varname = "temp"
  tempC%lonname = "longitude"
  tempC%latname = "latitude"
  tempC%timename = "time"
  tempC%levelname = "level"

  !Reads data from file
  call readgrid(input, tempC)

  !Convertion Celsius to Farenheit
 
   where(tempC%ncdata.ne.tempC%FillValue) tempC%ncdata = (tempC%ncdata*9/5)+32
   
   !Definition of new variable unit
   tempC%varunits = "degF"

  !Write the data on file
  call writegrid(output, tempC)

end program main
