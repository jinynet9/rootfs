#
# rootfs/home/.profile
#
# excuted by '~/.profile'
#


# Condition on the 'interactive' flag
case $- in
	*i*) INTERACTIVE=TRUE;;
esac

if [[ ! -z $INTERACTIVE ]]; then
	echo "~/rootfs/home/.profile"
fi

guake &
#gnome-terminal &
#gnome-terminal &
#vivaldi &
#virtualbox &
#rootfs/home/bin/rdesktop_notebook.sh &

# not effected
#export PATH=$PATH:$HOME/rootfs/home/bin

