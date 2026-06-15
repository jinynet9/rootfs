#!/bin/bash

############################################################
# HELP BLOCK START
# memwatch.sh - Show or monitor memory usage of a specific process
# Usage:
#   memwatch.sh <process_name> [options]
#
# Examples:
#   memwatch.sh pktstored
#   memwatch.sh pktstored -w 1
#
# Options:
#   -w [sec]    Watch mode, refresh every <sec> seconds (default: 1)
#   -m          Show system memory information (Total, Free, Available)
#   -h, --help  Show this help message
#
# Description:
#   This script finds the PID of a given process name and displays
#   memory information from /proc/<pid>/status.
#   If -w is specified, it continuously monitors memory usage with watch.
############################################################
# HELP BLOCK END

#
#  /^# HELP BLOCK START$/,/^# HELP BLOCK END$/ → select the help block range
#  /^# HELP BLOCK START$/d → remove the start line
#  /^# HELP BLOCK END$/d → remove the end line
#  s/^# // → remove leading comment symbol
#  /^[[:space:]]*#.*$/d → remove any remaining lines that start with #
#  p → print the processed lines
#
help() {
    sed -n '/^# HELP BLOCK START$/,/^# HELP BLOCK END$/{
        /^# HELP BLOCK START$/d
        /^# HELP BLOCK END$/d
        s/^# //; 
	/^[[:space:]]*#.*$/d 
        p
    }' "$0"
    exit 0
}

get_pid() {
    local pname="$1"
    local pid

    # 1) exact match
    pid=$(pgrep -x "$pname" | head -n 1)
    if [[ -n "$pid" ]]; then
        echo "$pid"
        return
    fi

    # 2) loose match if exact not found
    pid=$(pgrep -f "$pname" | head -n 1)
    echo "$pid"
}

show_meminfo() {
    local pid="$1"
    local pname="$2"
    echo "=== Memory info for PID: $pid ($pname) ==="
    grep -E 'VmSize|VmRSS|VmData|VmSwap' /proc/$pid/status
}

watch_meminfo() {
    local pid="$1"
    local pname="$2"
    local interval="$3"
    echo "Watching memory usage of '$pname' (PID $pid) every ${interval}s..."
    watch -n "$interval" "grep -E 'VmSize|VmRSS|VmData|VmSwap' /proc/$pid/status"
}

show_sys_meminfo() {
    local memtotal memfree memavail

    memtotal=$(awk '/^MemTotal:/ {print $2}' /proc/meminfo)
    memfree=$(awk '/^MemFree:/ {print $2}' /proc/meminfo)
    memavail=$(awk '/^MemAvailable:/ {print $2}' /proc/meminfo)

    echo "=== System Memory Info ==="

    for name in "Total:$memtotal" "Free:$memfree" "Available:$memavail"; do
        val_kb=${name#*:}
        label=${name%%:*}

        if (( val_kb >= 1024*1024 )); then
            # GB
            val=$(awk "BEGIN{printf \"%.2f\", $val_kb/1024/1024}")
            unit="GB"
        elif (( val_kb >= 1024 )); then
            # MB
            val=$(awk "BEGIN{printf \"%.2f\", $val_kb/1024}")
            unit="MB"
        else
            # KB
            val="$val_kb"
            unit="KB"
        fi

        printf "%-10s: %s %s (%s kB)\n" "$label" "$val" "$unit" "$val_kb"
    done
}

main() {
    if [[ $# -lt 1 ]]; then
        help
    fi

    local PROC_NAME=""
    local WATCH_MODE=0
    local INTERVAL=1
    local SHOW_SYS_MEM=0

    # parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                help
                ;;
            -w)
                WATCH_MODE=1
                if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
                    INTERVAL="$2"
                    shift
                fi
                ;;
            -m)
                SHOW_SYS_MEM=1
                ;;
            *)
                PROC_NAME="$1"
                ;;
        esac
        shift
    done

    # display system memory info if requested
    if [[ $SHOW_SYS_MEM -eq 1 ]]; then
        show_sys_meminfo
        exit 0
    fi

    # require process name if -m was not used
    if [[ -z "$PROC_NAME" ]]; then
        echo "Error: process name required"
        help
    fi

    local PID
    PID=$(get_pid "$PROC_NAME")
    if [[ -z "$PID" ]]; then
        echo "Process '$PROC_NAME' not found."
        exit 1
    fi

    if [[ $WATCH_MODE -eq 1 ]]; then
        watch_meminfo "$PID" "$PROC_NAME" "$INTERVAL"
    else
        show_meminfo "$PID" "$PROC_NAME"
    fi
}

main "$@"

