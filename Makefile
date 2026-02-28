GFORTRAN_PATH = /usr/bin/gfortran

GFORTRAN_FLAGS = -Wall -Wextra -Waliasing -Warray-temporaries -Winteger-division -O3 -march=tigerlake -mavx512f -ffree-form -fall-intrinsics -ffree-line-length-none -fimplicit-none -std=f2023 -nocpp

TARGET = sum

SOURCE_EXTENSION = f90

build:
	$(GFORTRAN_PATH) $(TARGET).$(SOURCE_EXTENSION) $(GFORTRAN_FLAGS) -o $(TARGET).out

.PHONY: clean

clean:
	rm -f ./*.out
	rm -f ./*.o
	rm -f ./*.mod
