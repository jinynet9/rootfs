#
# grc.bash
#
# Enable colorized output for many common commands using GRC (Generic Colouriser)
#
# file="~/.grc/grc.bash"
# [ -f $file ] && source $file
# if [ -f $file ]; then
#     source $file
# fi
#

# Exit early if grc is not installed
command -v grc >/dev/null 2>&1 || return 0

GRC_CONF_DIR="/usr/share/grc"

# Helper function to safely register colorized aliases
grc_alias() {
    local cmd="$1"
    local conf="$GRC_CONF_DIR/conf.$cmd"
#    command -v "$cmd" >/dev/null 2>&1 && alias "$cmd"="grc -c $conf $cmd"
    command -v "$cmd" >/dev/null 2>&1 && alias "$cmd"="grc --colour=auto $cmd"
}

#
# Automatically register aliases for all commands that have conf.* definitions
#
register_aliases() {
    for conf_file in $GRC_CONF_DIR/conf.*; do
        cmd=$(basename "$conf_file" | sed 's/^conf\.//')
        grc_alias "$cmd"
    done
}

#
#
#
define_build_commands() {

    # Define target commands
    BUILD_HOST_CMDS="make"
    BUILD_CROSS_CMDS="gcc g++ ld ar strip objcopy objdump"
    
    zgrc() { { "$@"; } 2>&1 | grcat ~/.grc/conf.common; }

    #make() { { command make "$@"; } 2>&1 | grcat ~/.grc/conf.build; }
    make() {
	local arg
	local is_config=0
	
	for arg in "$@"; do
	    case "$arg" in
		config|*config)
		    is_config=1
		    break
		    ;;
	    esac
	done
	
	if [ $is_config -eq 1 ]; then
	    command make "$@"
	    return $?
	else
	    { command make "$@"; } 2>&1 | grcat ~/.grc/conf.build
	    return ${PIPESTATUS[0]}
	fi
    }

    #cc()   { { command cc   "$@"; } 2>&1 | grcat ~/.grc/conf.build; }
    #gcc()  { { command gcc  "$@"; } 2>&1 | grcat ~/.grc/conf.build; }
    #g++()  { { command g++  "$@"; } 2>&1 | grcat ~/.grc/conf.build; }
    #ar()   { { command ar   "$@"; } 2>&1 | grcat ~/.grc/conf.build; }
    #ld()   { { command ld   "$@"; } 2>&1 | grcat ~/.grc/conf.build; }
}

#
# main
#
register_aliases
define_build_commands

return 0





# Additional useful commands (if not already covered)
for extra in gcc make ping ping2 df du free ps netstat ss mount umount \
             lsof tcpdump traceroute ifconfig ip iproute docker systemctl \
	     journalctl;
do
    grc_alias "$extra"
done

