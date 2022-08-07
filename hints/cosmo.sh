#! /bin/sh
# cosmo.sh - hints for building perl using the Cosmopolitan Libc
#

test -d "$COSMO_REPO" || exit 1;

COSMO_DUMMYDIR=$(realpath "cosmo/dummy_isystem")

userelocatableinc='define'
usedl='undef'
usenm='false'
so='none'
usethreads='undef'
usemultiplicity='undef'
osname='cosmo'
osvers=''
libpth='none'
#incpth=
#incpath=
#usrinc=
d_nl_langinfo='undef'
locincpth=''
usrinc="$COSMO_DUMMYDIR"
cc="$COSMO_REPO/o/third_party/gcc/bin/x86_64-linux-musl-gcc"
ccflags="-static -nostdlib -nostdinc -fno-pie -no-pie -fno-omit-frame-pointer -pg -mnop-mcount -mno-tls-direct-seg-refs -include $COSMO_REPO/o/cosmopolitan.h -I $COSMO_DUMMYDIR"
ldflags="-static -nostdlib -nostdinc -fno-pie -no-pie -fno-pie -no-pie -fno-omit-frame-pointer -pg -mnop-mcount -mno-tls-direct-seg-refs -Wl,--gc-sections -fuse-ld=bfd -Wl,-T,$COSMO_REPO/o//ape/ape.lds $COSMO_REPO/o//libc/crt/crt.o $COSMO_REPO/o//ape/ape.o"
libs="$COSMO_REPO/o//cosmopolitan.a"
requiredlibs="$COSMO_REPO/o//cosmopolitan.a"
static_ext='none'
unset COSMO_DUMMYDIR
unset COSMO_REPO
