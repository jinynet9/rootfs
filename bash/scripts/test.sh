#!/bin/sh
#
#

. regex.src

if test "$CC" = "yes"; then
    echo "yes"
else
    echo "no"
fi

echo $samba_cv_HAVE_GETTIMEOFDAY_TZ
echo "${samba_cv_HAVE_GETTIMEOFDAY_TZ+set}"

if test "${samba_cv_HAVE_GETTIMEOFDAY_TZ+set}" = set; then
    echo "set"
else
    echo "not set"
fi
