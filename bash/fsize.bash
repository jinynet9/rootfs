#!/bin/sh
#
# nFileSize=$(bl_fsize FILE)
# for bash library
# 06-04-03
#

g_sMyName=`basename $0`

if [ -z "$1" ]; then
    echo "usage: $g_sMyName FILE"
    exit -1
fi

if [ ! -e "$1" ]; then
    echo "file \"$1\" not exist !!!"
    exit -1
fi

echo $(ls -l "$1" | tr -s " " | cut -f 5 -d " ")

exit 0
