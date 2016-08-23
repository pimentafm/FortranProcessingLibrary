type :: nc2d_<dataset typ>_llf
    sequence
    character(len=100) :: varname, lonname, latname, long_name, varunits, &
                          lonunits, latunits
    integer(kind=intgr) :: nlons, nlats, vartype
    integer(kind=byte) :: FillValue
    real(kind=float), dimension(:), allocatable :: longitudes, latitudes
    integer(kind=byte), dimension(:,:), allocatable :: ncdata
  end type nc2d_byte_llf
