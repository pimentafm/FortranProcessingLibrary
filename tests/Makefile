#:=============================================================================
# Test suite for FPL (Fortran Processing Library)
#:=============================================================================

# Root of the FPL source tree (one level up from tests/)
FPL_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)

# System detection
OS := $(shell . /etc/os-release 2>/dev/null && echo $$ID || lsb_release -si 2>/dev/null | tr 'A-Z' 'a-z')

# Check if FPL is installed system-wide; if not, use the local build
ifeq ($(wildcard $(FPL_ROOT)/libFPL.so),$(FPL_ROOT)/libFPL.so)
  # Local build available — link directly
  FPL_module ?= -I$(FPL_ROOT)
  FPL_lib    ?= -L$(FPL_ROOT) -lFPL -Wl,-rpath,$(FPL_ROOT)
else
  # Installed system-wide
  ifneq (,$(filter $(OS),fedora korora rhel centos rocky alma))
    FPL_module ?= -I/usr/lib64/gfortran/modules/
  else ifneq (,$(filter $(OS),debian ubuntu linuxmint pop))
    FPL_module ?= -I/usr/include/
  else
    FPL_module ?= -I/usr/local/include/
  endif
  FPL_lib ?= -lFPL
endif

FC       := gfortran
FLAGS    := -Wall -O2
OMP      := -fopenmp

TESTS := test_constants test_fileutils test_gengrid test_writegrid \
         test_readgrid test_griddims test_setfillvalue test_zonalstats

TESTDATA_DIR := testdata

.PHONY: all clean test $(TESTS)

all: $(TESTDATA_DIR) $(TESTS)

$(TESTDATA_DIR):
	mkdir -p $(TESTDATA_DIR)
	cp ../examples/database/data.txt $(TESTDATA_DIR)/
	cp ../examples/database/gridHeader.txt $(TESTDATA_DIR)/
	cp ../examples/database/diasetal_headerfile.txt $(TESTDATA_DIR)/

test_constants:
	$(FC) $(FLAGS) $(OMP) -o test_constants.out test_constants.f90 $(FPL_module) $(FPL_lib)

test_fileutils:
	$(FC) $(FLAGS) -o test_fileutils.out test_fileutils.f90 $(FPL_module) $(FPL_lib)

test_gengrid:
	$(FC) $(FLAGS) -o test_gengrid.out test_gengrid.f90 $(FPL_module) $(FPL_lib)

test_writegrid:
	$(FC) $(FLAGS) -o test_writegrid.out test_writegrid.f90 $(FPL_module) $(FPL_lib)

test_readgrid:
	$(FC) $(FLAGS) -o test_readgrid.out test_readgrid.f90 $(FPL_module) $(FPL_lib)

test_griddims:
	$(FC) $(FLAGS) -o test_griddims.out test_griddims.f90 $(FPL_module) $(FPL_lib)

test_setfillvalue:
	$(FC) $(FLAGS) $(OMP) -o test_setfillvalue.out test_setfillvalue.f90 $(FPL_module) $(FPL_lib)

test_zonalstats:
	$(FC) $(FLAGS) $(OMP) -o test_zonalstats.out test_zonalstats.f90 $(FPL_module) $(FPL_lib)

test: all
	@passed=0; failed=0; total=0; \
	for t in $(TESTS); do \
		total=$$((total + 1)); \
		echo ""; \
		echo "--- Running $$t ---"; \
		if ./$$t.out; then \
			passed=$$((passed + 1)); \
		else \
			failed=$$((failed + 1)); \
			echo "*** $$t FAILED ***"; \
		fi; \
	done; \
	echo ""; \
	echo "========================================"; \
	echo "Results: $$passed/$$total passed, $$failed failed"; \
	echo "========================================"; \
	if [ $$failed -gt 0 ]; then exit 1; fi

clean:
	rm -f *.out *.nc
	rm -rf $(TESTDATA_DIR)
