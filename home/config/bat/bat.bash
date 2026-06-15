#
# better cat
# bat.bash
#

# Exit early if grc is not installed
command -v batcat >/dev/null 2>&1 || return 0

export BAT_THEME="GitHub"

alias zbat='batcat '

