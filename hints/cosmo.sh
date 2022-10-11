#! /bin/sh
# cosmo.sh - hints for building perl using the Cosmopolitan Libc
#

test -d "$COSMO_REPO" || exit 1;
COSMO_APE_LOADER=${COSMO_APE_LOADER:="ape-no-modify-self.o"}

usedl='undef'
usenm='false'
so='none'
osname='cosmo'
osvers=''
libpth='none'
#incpth=
#incpath=
#usrinc=
d_procselfexe='undef'
locincpth=''
usrinc="$COSMO_REPO/libc/isystem"
cc="$COSMO_REPO/o/third_party/gcc/bin/x86_64-linux-musl-gcc"
ccflags="-static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone -fno-omit-frame-pointer -fno-stack-protector -pg -mnop-mcount -mno-tls-direct-seg-refs -I $COSMO_REPO -include $COSMO_REPO/libc/integral/normalize.inc -isystem $COSMO_REPO/libc/isystem"
ldflags="-static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone -fno-omit-frame-pointer -fno-stack-protector -pg -mnop-mcount -mno-tls-direct-seg-refs -Wl,--gc-sections -fuse-ld=bfd -Wl,-T,$COSMO_REPO/o/$COSMO_MODE/ape/public/ape.lds $COSMO_REPO/o/$COSMO_MODE/libc/crt/crt.o $COSMO_REPO/o/$COSMO_MODE/ape/$COSMO_APE_LOADER"
libs="$COSMO_REPO/o/$COSMO_MODE/cosmopolitan.a"
#noextensions=''
unset COSMO_REPO
unset COSMO_MODE
unset COSMO_APE_LOADER
