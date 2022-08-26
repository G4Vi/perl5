BEGIN { require 5.008_001 }
use ExtUtils::MakeMaker;

# this module only needed and implemented for cosmo right now
$^O eq 'cosmo' or die "OS unsupported";

WriteMakefile(
    VERSION_FROM => "lib/ErrnoRuntime.pm",
    NAME         => "ErrnoRuntime",
    OBJECT       => '$(O_FILES)',
    ABSTRACT     => 'Load Errno constants at runtime',
    AUTHOR       => 'Gavin Hayes <gahayes@cpan.org>',
    PREREQ_PM    => {
    },
);
