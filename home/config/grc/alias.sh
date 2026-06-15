#!/bin/sh
#

# create_cross_tool_aliases: generate grc aliases for cross-toolchain
# Usage: create_cross_tool_aliases <CROSS_PREFIX>
create_cross_tool_aliases() {
    local CROSS_PREFIX="$1"

#    if [ -z "$CROSS_PREFIX" ]; then
#        echo "Usage: create_cross_tool_aliases <CROSS_PREFIX>"
#        return 1
#    fi

    # List of common cross-toolchain tools
    local TOOLS="gcc g++ ld ar nm strip objcopy objdump readelf"

    # Generate aliases automatically
    for tool in $TOOLS; do
        ln -s "${tool}" "${CROSS_PREFIX}${tool}"
    done
}

#create_cross_tool_aliases "x86_64-openwrt-linux-gnu-"

