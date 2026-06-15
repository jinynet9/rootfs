#!/bin/bash
# Replace string under current directory

if [ $# -lt 2 ]; then
    echo "Usage: $0 <from> <to> [pattern1] [pattern2] ..."
    exit 1
fi

FROM="$1"
TO="$2"
shift 2

# Build find condition
if [ $# -eq 0 ]; then
    # All files
    find . -type f -exec sed -i "s/${FROM}/${TO}/g" {} +
else
    # Pattern limited
    expr=""
    for p in "$@"; do
        if [ -z "$expr" ]; then
            expr="-name \"$p\""
        else
            expr="$expr -o -name \"$p\""
        fi
    done

    eval "find . \( $expr \) -type f -exec sed -i \"s/${FROM}/${TO}/g\" {} +"
fi

