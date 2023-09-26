#!/bin/sh
#
# https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/index.html
#

# Condition on the 'interactive' flag
case $- in
	*i*) INTERACTIVE=TRUE;;
esac

ME=`basename "$0"`

CMD="interactive_mode command_substitution"

usage()
{
    echo "Usage: $ME feature [args]"
    echo "features: $CMD"
    exit 1
}

cut_sample()
{
    cut -d: -f4 | sort | uniq -c | sort -nr | head 2
}


command_substitution()
{
    list1=`ls -l`
    list2=$(ls -l)

    echo "list1: $list1"
    echo "list2: $list2"
}

interactive_mode()
{
    if [ ! -z $INTERACTIVE ]; then
	echo "interactive mode"
    else
	echo "non interactive mode"
    fi
}

main()
{
    if [ $# -lt 1 ]; then
	usage
    fi

    local cmd=$1

    shift

    echo "$CMD" | tr ' ' '\n' | while read item; do
        if [ $item != $cmd ]; then
	    continue;
	fi

        $item "$@"
    done

    exit $?
}
    echo "$-"
exit 0

main "$@"

