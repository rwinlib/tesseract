Tesseract OCR stack for Windows:

 - Tesseract 3.05.01
 - Leptonica 1.74.4

Tesseract was compiled with Rtools gcc and g++.
Leptonica was built with:

    CC="gcc -DOPJ_STATIC"

Other libs were taken from msys2.

Note that this does not include the training data files required
to run tesseract.
