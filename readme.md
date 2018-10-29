Tesseract OCR stack for Windows:

 - Tesseract 4.0.0 --without-openmp
 - Leptonica 1.76

Note that OpenMP has been disabled because it leads to 
massive performance regression. Hopefully this will be
fixed upstream.
 
Everything in /lib was built RTOOLS4: GCC 8.2.0. 
For the 4.9.3 I used the attached PKGBUILD (uncomment the 
lines that set CC, CXX, etc)


