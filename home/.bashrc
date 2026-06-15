#
# rootfs/home/.bashrc
#
# excuted by '~/.profile'
#   . ~/rootfs/home/.bashrc
#

# Condition on the 'interactive' flag
case $- in
	*i*) INTERACTIVE=TRUE;;
esac

#if [[ ! -z $INTERACTIVE ]]; then
#	echo "~/rootfs/home/.bashrc"
#fi


#
# alias
#
TMPFILE="$HOME/rootfs/home/.bashrc_alias"
[ -f "$TMPFILE" ] && source "$TMPFILE"

#
# CVSROOT
#
export CVSROOT=:pserver:jinynet9@cvs.dmcit.co.kr:/home/cvs

#
# PATH
#
TMPFILE="$HOME/rootfs/home/.bashrc_PATH"
[ -f "$TMPFILE" ] && source "$TMPFILE"

#
TMPFILE="$HOME/rootfs/home/.bashrc_PS1"
[ -f "$TMPFILE" ] && source "$TMPFILE"

#
TMPFILE="$HOME/rootfs/home/.bashrc_rsync"
[ -f "$TMPFILE" ] && source "$TMPFILE"

#
TMPFILE="$HOME/rootfs/home/.bashrc_shared"
[ -f "$TMPFILE" ] && source "$TMPFILE"

#
# If ENV_PROFILE is set, run the command once, then unset
# ssh -X -t green 'export ENV_PROFILE=pktvault; bash -i'
#
[ -n "$ENV_PROFILE" ] && {
    case "$ENV_PROFILE" in
      pktvault)
        pktvault
        ;;
      pktvault-verify)
        pktvault-verify
        ;;
      *)
        echo "unknown ENV_PROFILE: $ENV_PROFILE (in $BASH_SOURCE)"
        ;;
    esac

    unset ENV_PROFILE
}

#
# unset errexit
#
set +e
