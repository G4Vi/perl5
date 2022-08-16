#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <errno.h>

#include "errno-runtime-generated.inc"

MODULE = Errno::Runtime		PACKAGE = Errno::Runtime

IV
strtoerrno(name)
        const char *name
        CODE:
            const unsigned errnolen = sizeof(names) / sizeof(names[0]);
            unsigned i;
            for(i = 0; i < errnolen; i++)
            {
                if(strcmp(name, names[i]) == 0)
                {
                    RETVAL = *(values[i]);
                    break;
                }
            }
            if(i == errnolen)
            {
                croak("Unknown Errno constant %s", name);
            }
        OUTPUT:
            RETVAL