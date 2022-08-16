#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <errno.h>
#include "libc/fmt/magnumstrs.internal.h"

MODULE = Errno::Runtime		PACKAGE = Errno::Runtime

IV
strtoerrno(name)
        const char *name
        CODE:
            unsigned i;
            RETVAL = 0;
            for (i = 0; kErrnoNames[i].x != MAGNUM_TERMINATOR; ++i)
            {
                if(strcmp(name, MAGNUM_STRING(kErrnoNames, i)) == 0)
                {
                    RETVAL = MAGNUM_NUMBER(kErrnoNames, i);
                    break;
                }
            }
            // EWOULDBLOCK isn't in the table as it's the same as EAGAIN
            if(strcmp(name, "EWOULDBLOCK") == 0)
            {
                RETVAL = EWOULDBLOCK;
            }
            else if(kErrnoNames[i].x == MAGNUM_TERMINATOR)
            {
                croak("Unknown Errno constant %s", name);
            }
        OUTPUT:
            RETVAL