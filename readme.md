Tesseract OCR stack for Windows:

 - Tesseract 4.1.1 --without-openmp
 - Leptonica 1.79.0

Tesseract was built with [rtools-backports](https://github.com/r-windows/rtools-backports/blob/master/mingw-w64-tesseract-ocr/PKGBUILD), the other libs with rtools-pakages.

Note that OpenMP is disabled because it has poor performance.
