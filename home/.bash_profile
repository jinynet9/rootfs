#
# rootfs/home/.bash_profile
#
# excuted by '~/.profile'
#   . ~/rootfs/home/.bash_profile
#

# Condition on the 'interactive' flag
case $- in
	*i*) INTERACTIVE=TRUE;;
esac


#if [[ ! -z $INTERACTIVE ]]; then
#	echo "~/rootfs/home/.bash_profile"
#fi

# cvs
#export CVSROOT=:pserver:jinynet9@nox:/home/cvs/.cvsroot

# cscope
export CSCOPE_EDITOR='gvim'

#
# PATH
#
TMPFILE="$HOME/rootfs/home/.bashrc_PATH"
[ -f "$TMPFILE" ] && source "$TMPFILE"

#
#
#
if [ "$HOSTNAME" == "jinux" ]; then
	#
	# Excute a program at login
	#

	# uncheck 'Enable popup notifications on startup' of guake properties
#	guake&

#	terminator&
#	terminator&
#	terminator&
	:

else
	:
fi

#
# X 응용 프로그램 실행 지연 현상 workaground
#
dbus-update-activation-environment --systemd --all

