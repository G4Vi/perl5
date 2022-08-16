# This -*- perl -*- script makes the Makefile

BEGIN { require 5.008_001 }
use ExtUtils::MakeMaker;
use Config qw(%Config);

#--- Generate the errno function

open(my $errnofile, '<', "../../../cosmopolitan/libc/errno.h") or die("Failed to open cosmo errno.h");
my $pat = '^\s*#\s*define\s+(E\w+)\s+';
my @errconsts;
while(<$errnofile>) {
    push @errconsts, $1 if /$pat/;
}
close($errnofile);

my $incbuf = "static const char *names[] = {\n";
foreach my $econst (@errconsts) {
    $incbuf .= '    "'.$econst.'",'."\n";
}
chop $incbuf;
chop $incbuf;
$incbuf .= "\n};\n\n";
$incbuf .= "static const errno_t *values[] = {\n";
foreach my $econst (@errconsts) {
    $incbuf .= '    &'.$econst.",\n";
}
chop $incbuf;
chop $incbuf;
$incbuf .= "\n};\n";

open(my $outhfile, '>', 'errno-runtime-generated.inc') or die("Failed to open errno-runtime-generated.inc");
print $outhfile $incbuf;
close($outhfile);

#--- Write the Makefile

WriteMakefile(
    VERSION_FROM => "lib/Errno/Runtime.pm",
    NAME         => "Errno::Runtime",
    OBJECT       => '$(O_FILES)',
    ABSTRACT     => 'Load Errno constants at runtime',
    AUTHOR       => 'Gavin Hayes <gahayes@cpan.org>',
    PREREQ_PM    => {
    },
    clean => { FILES => 'errno-runtime-generated.inc' },
);


