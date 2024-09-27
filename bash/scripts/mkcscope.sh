#!/bin/sh

CSCOPE_FILES=cscope.files
rm -rf ${CSCOPE_FILES} ${CSCOPE_FILES}

find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' \) -print > ${CSCOPE_FILES}

cscope -i ${CSCOPE_FILES} -b

