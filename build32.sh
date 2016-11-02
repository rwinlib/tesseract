# Using patched imagemagick sources from msys2
# Link against dependency C libs from msys2
export CC="gcc -m32"
export CXX="g++ -m32 -std=c++0x"
export CPPFLAGS="-I/local/include" #for libtiff only
export LIBLEPT_HEADERSDIR="/c/msys2-i686/mingw32/include/leptonica"
export LDFLAGS="-m32 -L/c/msys2-i686/mingw32/lib"
  ../tesseract-3.04.01/configure \
    --disable-openmp \
    --enable-static \
    --disable-shared
