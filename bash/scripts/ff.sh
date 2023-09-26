#!/bin/sh
#
# ffs CU_ERROR "*.[ch]"
#

. regex.src

ME=`basename "$0"`

usage ()
{
    echo "Usage: $ME [DIR] FILES"
    exit 1
}

DIR=$1

if [ -d $DIR ]; then
    shift 1
else
    DIR="./"
fi

FILES="$@"

#
# find option
# 
# -name NAME	
# -iname NAME		ignore case
# -type f		file
# -type d		directory
# -type l		symbolic link
# -mtime +5d		last modified 5day ago
# -size +5M 	
# -perm 644
# -exec CMD {} \;
# -exec rm -f {} \;
# | xargs CMD
# | xargs grep -n "PATTERN"
#
ff ()
{
    OPT="-"

    echo "find $DIR -name $FILES"

    find "$DIR" -name $FILES

}

main ()
{
    if [ $# -lt 1 ]; then
	usage
    fi

    ff "$@"

    exit 0
}

main "$@"

