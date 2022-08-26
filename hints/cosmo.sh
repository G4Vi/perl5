#! /bin/sh
# cosmo.sh - hints for building perl using the Cosmopolitan Libc
#

test -d "$COSMO_REPO" || exit 1;

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
#d_nl_langinfo='undef'
d_msgctl='undef'
d_msgget='undef'
d_msgrcv='undef'
d_msgsnd='undef'
gidformat='"d"'
gidsign='-1'
gidsize='4'
gidtype='int'
uidformat='"d"'
uidsign='-1'
uidsize='4'
uidtype='int'
socksizetype='socklen_t'
d_getgrps='undef'
d_procselfexe='undef'
locincpth=''
usrinc="$COSMO_REPO/libc/isystem"
cc="$COSMO_REPO/o/third_party/gcc/bin/x86_64-linux-musl-gcc"
ccflags="-static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone -fno-omit-frame-pointer -fno-stack-protector -pg -mnop-mcount -mno-tls-direct-seg-refs -I $COSMO_REPO -include $COSMO_REPO/libc/integral/normalize.inc -isystem $COSMO_REPO/libc/isystem"
ldflags="-static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone -fno-omit-frame-pointer -fno-stack-protector -pg -mnop-mcount -mno-tls-direct-seg-refs -Wl,--gc-sections -fuse-ld=bfd -Wl,-T,$COSMO_REPO/o/$COSMO_MODE/ape/ape.lds $COSMO_REPO/o/$COSMO_MODE/libc/crt/crt.o $COSMO_REPO/o/$COSMO_MODE/ape/ape.o"
libs="$COSMO_REPO/o/$COSMO_MODE/cosmopolitan.a"
requiredlibs="$COSMO_REPO/o/$COSMO_MODE/cosmopolitan.a"
noextensions='Fcntl IO POSIX Socket Time/HiRes'
unset COSMO_REPO
unset COSMO_MODE
