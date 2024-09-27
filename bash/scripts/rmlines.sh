#!/bin/sh
#
# remove "drivers/serial.c" from cscope.files
# ./rmline.sh "drivers\/serial\.c" cscope.files
#

if test $# -ne 2; then
    echo "Usage: $0 STRING FILE"
    exit 1
fi

PATTERN=$1
MARK="+*?-#+=^"
FILE=$2

TMPFILE="$2-$$"


# pattern can be include '/' for directory
method_2 () {
    sed "s%$PATTERN/%$MARK%" $FILE > $TMPFILE

    sed "/$MARK/d" $TMPFILE > $FILE
}

method_1 () {
    sed -e "/$PATTERN/d" $FILE > $TMPFILE

    mv $TMPFILE $FILE
}

# remove unwanted files (obj)
#awk '$0 !~/obj/ {printf("%s\n", $0)}' ${CSCOPE_FILES} > ${CSCOPE_FILES_TMP}
#mv ${CSCOPE_FILES_TMP} ${CSCOPE_FILES}

method_1 "$@"

