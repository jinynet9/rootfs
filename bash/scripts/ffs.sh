#!/bin/sh
#
# ffs CU_ERROR "*.[ch]"
#

. regex.src

ME=`basename "$0"`

usage ()
{
    echo "Usage: $ME PATTERN [FILES]"
    exit 1
}

PATTERN=$1

if [ $# -ge 2 ]; then
    shift 1
    FILES="$@"
else
    FILES="*"
fi


#
# grep option
# 
# -I 		equivalent to --binary-files=without-match
# -H		print the file name for each match
# -n		print line number with output lines
# -w		matches taht form whole words
# -i		ignore case
# -r		recursively
# -A NUM	print NUM lines of tailing context after matching lines
# -m NUM	stop reading a file after NUM matching lines
# -v		invert match
#
ffs ()
{
    OPT="-IHn"

    find ./ -name "$FILES" | xargs grep -I $PATTERN 2>/dev/null


#echo `find "$DIR" -name "$FILES" | xargs grep "$OPT" "$PATTERN"`

    #`find "$DIR" -name "$FILES" -exec grep "$OPT" "$PATTERN" {} \;`
}

main ()
{
    if [ $# -lt 1 ]; then
	usage
    fi

    ffs "$@"

    exit 0
}

main "$@"

