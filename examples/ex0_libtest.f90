program libtest
  use fpl
  implicit none


  write(*,*) fpl_libversion()

  !OpenMP -------------------------------------------------------------
  call omp_set_num_threads(3)

  write(*,*) "Num procs  : ", omp_get_num_procs()
  write(*,*) "Max threads: ", omp_get_max_threads()
  write(*,*) "Num threads (serial region): ", omp_get_num_threads()

 !$omp parallel
   write(*,*) "Num threads (parallel region): ", omp_get_num_threads()
 !$omp end parallel
 !---------------------------------------------------------------------

  write(*,'(a8,i2)') "   BYTE: ", byte
  write(*,'(a8,i2)') "  SHORT: ", short
  write(*,'(a8,i2)') "INTEGER: ", intgr
  write(*,'(a8,i2)') "  FLOAT: ", float
  write(*,'(a8,i2)') " DOUBLE: ", double, char(10) !char(10) skip a line
  
  write(*,*) "FPL parameters and constants"
  write(*,*) "=================================="
  write(*,'(a39,f12.9)') "                                  pi: ", pi
  write(*,'(a39,f12.6)') "        Average radius of earth (km): ", earth_radius
  write(*,'(a39,f10.7)') "     Acceleration of gravity (m/s^2): ", acc_gravity
  write(*,'(a39,f12.1)') "            Speed of the light (m/s): ", speed_of_light
  write(*,'(a39,es13.6e2)') " Stefan-Boltzmann constant (W/m^2K^4): ", stefan_boltzmann
  write(*,'(a39,es15.8e2)') "          Boltzmann constant (JK^-1): ", boltzmann
  write(*,'(a39,es16.9e2)') "           Atomic mass constant (kg): ", atomic_mass
  write(*,'(a39,es16.9e2)') "          Avogadro constant (mol^-1): ", avogadro
end program libtest
