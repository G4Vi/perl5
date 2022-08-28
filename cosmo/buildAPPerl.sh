#!/bin/sh
# Builds Actually Portable Perl from a cosmopolitan build of perl, see ../README.cosmo
set -eux

# setup output directories
OUTPUTDIR="./o"
if [ -d "$OUTPUTDIR" ]; then
    rm -rf "$OUTPUTDIR"
fi
mkdir -p "$OUTPUTDIR"
OUTPUTDIR=$(realpath "$OUTPUTDIR")
TEMPDIR="$OUTPUTDIR/tmp"
mkdir -p "$TEMPDIR"

# copy in perl.com (THIS MUST BE UNRUN AS IT CURRENTLY IS SELF MODIFYING)
PERL_APE=$(realpath ../perl.com)
APPNAME=$(basename "$PERL_APE")
APPPATH="$TEMPDIR/$APPNAME"
cp "$PERL_APE" "$APPPATH"

# build the folder structure
make -C ../ "DESTDIR=$TEMPDIR" install

# remove not actually portable perl
rm $TEMPDIR/zip/usr/local/bin/perl5*

# finally add the files to zip
THIS_DIR=$(realpath .)
ZIP_ROOT="$TEMPDIR/zip"
cd "$ZIP_ROOT"
zip -r "$APPPATH" usr/local/lib usr/local/bin
cd "$THIS_DIR"

# success, move perl.com out of temp
mv $APPPATH "$OUTPUTDIR/perl.com"
