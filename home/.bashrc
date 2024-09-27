#
# rootfs/home/.bashrc
#
# excuted by '~/.bashrc'
#

# Condition on the 'interactive' flag
case $- in
	*i*) INTERACTIVE=TRUE;;
esac

#if [[ ! -z $INTERACTIVE ]]; then
#	echo "~/rootfs/home/.bashrc"
#fi

alias ls='ls -CF --color=auto --show-control-chars'
alias l='ls -l'
alias ll='ls -al'
alias dir='ll | less'
alias grep='grep --color -I --exclude=*.cmd --exclude=*.dep --exclude=tags --exclude=cscope* --exclude=*.out'

alias ff='ff.sh'
alias ffs='ffs.sh'

alias gr="find . -name '*.[chS]' | xargs grep -n --color=always --directories=skip --devices=skip "
alias grn="find . -name '*.[chS]' | xargs grep -n --directories=skip --devices=skip "
alias gra="find . -name '*' -and ! -name 'tags' -and ! -name '*.tags' -and ! -name 'tags.*' | xargs grep -n --color=always --directories=skip "


alias pdfer=evince

#
# CVSROOT
#
export CVSROOT=:pserver:jinynet9@cvs.dmcit.co.kr:/home/cvs

#
# PATH ; setted by .profile
#
PATH=$PATH:$HOME/rootfs/home/bin:$HOME/rootfs/bash/scripts

#
#
#
if [ "$HOSTNAME" == "jinux" ]; then
	if [[ ! -z $INTERACTIVE ]]; then
		:	
	fi

	:
else
	if [[ ! -z $INTERACTIVE ]]; then
	rsync -avz --delete --exclude "*.swp" -e ssh jinynet9@172.17.1.21:/home/jinynet9/rootfs /home/jinynet9
	fi

	if [ -f ~/control-project/tools/prj_alias ]; then
		. ~/control-project/tools/prj_alias
	fi
fi

if [ ! -z "$PRJROOT" ]; then
	if [[ "$PRJROOT" == *"control"* ]]; then
	    source ~/control-project/tools/prj_prompt_green
	else
	    source ~/control-project/tools/prj_prompt_red
	fi
fi

