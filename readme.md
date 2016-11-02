Tesseract OCR stack for Windows.

- Tesseract 3.04.01 was compiled with Rtools toolchains,
  linking only aganst leptonica and libtiff from msys2.
- Leptonica 1.73 was rebuilt with msys2 to add `-DOPJ_STATIC`
  to `CPPFLAGS`.
- Remaining C libraries taken from msys2/rwinlib.

Note that this does not include the training data files required
to run tesseract.
