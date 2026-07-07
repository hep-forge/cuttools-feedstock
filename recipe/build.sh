#! /usr/bin/bash
set -e

cd source

# Enable extended-source with '-ffixed-line-length-none' for long lines
make PRECISION=QP FC="${FC}" FFLAGS="${FFLAGS} -std=legacy -fno-automatic -O2 -funroll-all-loops -ffixed-line-length-none -I${PREFIX}/include/mpfun90 -I${PREFIX}/include/oneloop"

# Avoid vendoring FF headers
rm -f includects/ffs.h includects/ff.h includects/aa.h

mv includects/libcts.a "${PREFIX}/lib/"
mkdir -p "${PREFIX}/include/cts"
mv includects/*.h "${PREFIX}/include/cts/"
mv includects/*.mod "${PREFIX}/include/cts/"

make clean
