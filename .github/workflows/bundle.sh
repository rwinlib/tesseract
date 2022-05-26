#/bin/sh
set -e
PACKAGE=tesseract-ocr

# Update
pacman -Syy --noconfirm
OUTPUT=$(mktemp -d)

# Download files (-dd skips dependencies)
pkgs=$(echo mingw-w64-{i686,x86_64,ucrt-x86_64}-${PACKAGE})
deps=$(pacman -Si $pkgs | grep 'Depends On' | grep -o 'mingw-w64-[_.a-z0-9-]*')
URLS=$(pacman -Sp $pkgs $deps --cache=$OUTPUT)
VERSION=$(pacman -Si mingw-w64-x86_64-${PACKAGE} | awk '/^Version/{print $3}')

# Set version for next step
echo "::set-output name=VERSION::${VERSION}"
echo "::set-output name=PACKAGE::${PACKAGE}"
echo "Bundling $PACKAGE-$VERSION"
echo "# $PACKAGE $VERSION" > README.md
echo "" >> README.md

for URL in $URLS; do
  curl -OLs $URL
  FILE=$(basename $URL)
  echo "Extracting: $URL"
  echo " - $FILE" >> README.md
  tar xf $FILE -C ${OUTPUT}
  rm -f $FILE
done

# Remove stuff we don't need
rm -Rf ${OUTPUT}/*/lib/{gettext,pkgconfig,cmake}
#rm -fv ${OUTPUT}/*/lib/lib{asprintf,charset,iconv,intl,gettext*,gnurx,hogweed,ssl,tre,systre}.a

# Put into dir structure
rm -Rf lib lib-8.3.0 include share
mkdir -p lib lib-8.3.0 include share
cp -Rf ${OUTPUT}/mingw64/include/{tesseract,leptonica} include/
cp -Rf ${OUTPUT}/mingw64/share/tessdata share/
cp -Rf ${OUTPUT}/mingw64/lib lib-8.3.0/x64
cp -Rf ${OUTPUT}/mingw32/lib lib-8.3.0/i386
cp -Rf ${OUTPUT}/ucrt64/lib lib/x64
ls -ltrRh .

# Cleanup
rm -Rf ${OUTPUT}