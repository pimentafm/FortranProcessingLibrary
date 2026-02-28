program test_constants
  use fpl
  implicit none

  integer :: failures
  failures = 0

  write(*,*) "=== Test: Constants ==="

  ! Test type kind parameters
  if (byte < 1) then
    write(*,*) "FAIL: byte kind invalid"
    failures = failures + 1
  else
    write(*,*) "PASS: byte kind =", byte
  end if

  if (short < 1) then
    write(*,*) "FAIL: short kind invalid"
    failures = failures + 1
  else
    write(*,*) "PASS: short kind =", short
  end if

  if (intgr < 1) then
    write(*,*) "FAIL: intgr kind invalid"
    failures = failures + 1
  else
    write(*,*) "PASS: intgr kind =", intgr
  end if

  if (float < 1) then
    write(*,*) "FAIL: float kind invalid"
    failures = failures + 1
  else
    write(*,*) "PASS: float kind =", float
  end if

  if (double < 1) then
    write(*,*) "FAIL: double kind invalid"
    failures = failures + 1
  else
    write(*,*) "PASS: double kind =", double
  end if

  ! Test physical constants with relative tolerance
  if (abs(pi - 3.14159265358979d0) > 1.0d-6) then
    write(*,*) "FAIL: pi =", pi
    failures = failures + 1
  else
    write(*,*) "PASS: pi =", pi
  end if

  if (abs(earth_radius - 6371.0d0) > 1.0d-3) then
    write(*,*) "FAIL: earth_radius =", earth_radius
    failures = failures + 1
  else
    write(*,*) "PASS: earth_radius =", earth_radius
  end if

  if (abs(acc_gravity - 9.80616d0) > 1.0d-4) then
    write(*,*) "FAIL: acc_gravity =", acc_gravity
    failures = failures + 1
  else
    write(*,*) "PASS: acc_gravity =", acc_gravity
  end if

  ! Note: the constant is defined with a single-precision literal (299792458.0)
  ! which loses precision when promoted to double (~299792448.0)
  if (abs(speed_of_light - 299792458.0d0) / 299792458.0d0 > 1.0d-5) then
    write(*,*) "FAIL: speed_of_light =", speed_of_light
    failures = failures + 1
  else
    write(*,*) "PASS: speed_of_light =", speed_of_light
  end if

  if (abs(stefan_boltzmann - 5.670373d-8) / 5.670373d-8 > 1.0d-5) then
    write(*,*) "FAIL: stefan_boltzmann =", stefan_boltzmann
    failures = failures + 1
  else
    write(*,*) "PASS: stefan_boltzmann =", stefan_boltzmann
  end if

  if (abs(boltzmann - 1.38064852d-23) / 1.38064852d-23 > 1.0d-5) then
    write(*,*) "FAIL: boltzmann =", boltzmann
    failures = failures + 1
  else
    write(*,*) "PASS: boltzmann =", boltzmann
  end if

  if (abs(atomic_mass - 1.660539040d-27) / 1.660539040d-27 > 1.0d-5) then
    write(*,*) "FAIL: atomic_mass =", atomic_mass
    failures = failures + 1
  else
    write(*,*) "PASS: atomic_mass =", atomic_mass
  end if

  if (abs(avogadro - 6.022140857d23) / 6.022140857d23 > 1.0d-5) then
    write(*,*) "FAIL: avogadro =", avogadro
    failures = failures + 1
  else
    write(*,*) "PASS: avogadro =", avogadro
  end if

  ! Test library version string
  if (len_trim(FPL_libversion()) == 0) then
    write(*,*) "FAIL: FPL_libversion() returned empty string"
    failures = failures + 1
  else
    write(*,*) "PASS: FPL_libversion() =", trim(FPL_libversion())
  end if

  ! Summary
  write(*,*) ""
  if (failures > 0) then
    write(*,*) "FAILED:", failures, "test(s)"
    call exit(1)
  else
    write(*,*) "All constants tests passed."
  end if

end program test_constants
