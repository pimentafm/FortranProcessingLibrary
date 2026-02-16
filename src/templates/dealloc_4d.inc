subroutine FPL_SUBR(idata)
  type(FPL_TYPE), intent(inout) :: idata
  integer :: alloc_stat
  deallocate(idata%longitudes, idata%latitudes, idata%ncdata, idata%times, idata%levels, stat=alloc_stat)
  deallocate(idata%dimid, idata%dimsize, idata%dimname, idata%dimunits, idata%varids, stat=alloc_stat)
end subroutine FPL_SUBR
