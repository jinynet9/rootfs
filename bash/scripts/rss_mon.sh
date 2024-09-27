#!/bin/sh
#
# ffs CU_ERROR "*.[ch]"
#

. regex.src

ME=`basename "$0"`

usage ()
{
    echo "Usage: $ME PROCESS"
    exit 1
}

PROCESS=$1

mon ()
{
    while [ 1 ]; do
	PID=$(ps aux | grep $PROCESS | grep -v grep | grep -v $ME | awk '{print $2}')

	cat "/proc/${PID}/status" | grep VmRSS

	sleep 2
    done
}

main ()
{
    if [ $# -lt 1 ]; then
	usage
    fi

    mon "$@"

    exit 0
}

main "$@"

