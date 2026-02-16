type :: FPL_TYPE
  sequence
  character(len=100) :: varname, timename, lonname, latname, long_name, &
                        varunits, lonunits, latunits, timeunits
  character(len=100), dimension(:), allocatable :: dimname, dimunits
  integer(kind=intgr) :: nlons, nlats, ntimes, ndims, vartype
  integer(kind=intgr), dimension(:), allocatable :: dimid, dimsize, varids
  integer(kind=intgr), dimension(3) :: dims
  FPL_FILL_DECL :: FillValue
  FPL_TIME_DECL, dimension(:), allocatable :: times
  real(kind=FPL_COORD_KIND), dimension(:), allocatable :: longitudes, latitudes
  FPL_FILL_DECL, dimension(:,:,:), allocatable :: ncdata
end type FPL_TYPE
