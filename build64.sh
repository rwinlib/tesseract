# Using patched imagemagick sources from msys2
# Link against dependency C libs from msys2
export CC="gcc -m64"
export CXX="g++ -m64 -std=c++0x"
export CPPFLAGS="-I/local/include" #for libtiff only
export LIBLEPT_HEADERSDIR="/c/msys2-x64/mingw64/include/leptonica"
export LDFLAGS="-m64 -L/c/msys2-x64/mingw64/lib"
  ../tesseract-3.04.01/configure \
    --disable-openmp \
    --enable-static \
    --disable-shared

make
