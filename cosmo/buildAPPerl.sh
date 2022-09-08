#!/bin/sh
#
# cosmo/buildAPPerl.sh - Builds Actually Portable Perl from a
# cosmopolitan build of perl
#
# Run this from the root of the perl repo, see README.cosmo

set -eux

# check environment
COSMO_PLATFORM_DIR=$(realpath ./cosmo)
if [ ! -d "$COSMO_PLATFORM_DIR" ]; then
    echo "<<<buildAPPerl>>> cosmo platform dir not found"
    exit 1
fi
#   perl.com should exist after make
#   (THIS MUST BE UNRUN AS IT CURRENTLY IS SELF MODIFYING)
PERL_APE=$(realpath ./perl.com)
if [ ! -f "$PERL_APE" ]; then
    echo "<<<buildAPPerl>>> perl ape not found"
    exit 1
fi

# setup output directories
OUTPUTDIR="$COSMO_PLATFORM_DIR/o"
if [ -d "$OUTPUTDIR" ]; then
    rm -rf "$OUTPUTDIR"
fi
mkdir -p "$OUTPUTDIR"
TEMPDIR="$OUTPUTDIR/tmp"
mkdir -p "$TEMPDIR"

# build the folder structure
make "DESTDIR=$TEMPDIR" install

# remove not actually portable perl
rm $TEMPDIR/zip/usr/local/bin/perl5*

# copy in perl.com
# (THIS MUST BE UNRUN AS IT CURRENTLY IS SELF MODIFYING)
APPNAME=$(basename "$PERL_APE")
APPPATH="$TEMPDIR/$APPNAME"
cp "$PERL_APE" "$APPPATH"
APPNAME=$(basename "$PERL_APE")
APPPATH="$TEMPDIR/$APPNAME"
cp "$PERL_APE" "$APPPATH"

# finally add the files to zip
THIS_DIR=$(realpath .)
ZIP_ROOT="$TEMPDIR/zip"
cd "$ZIP_ROOT"
zip -r "$APPPATH" usr/local/lib usr/local/bin
cd "$THIS_DIR"

# success, move perl.com out of temp
mv $APPPATH "$OUTPUTDIR/perl.com"
