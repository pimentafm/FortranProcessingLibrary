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

end program libtest
