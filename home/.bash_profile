#
# rootfs/home/.bash_profile
#
# excuted by '~/.bash_profile' or '~/.profile'
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

# git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
LIME_YELLOW=$(tput setaf 190)
YELLOW=$(tput setaf 3)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# \[	start non-printing
# \]	end non-printing
# \u	username
# \h	hostname
# \w	working directory
# \t	current time, 24 hour base
# \\$	#/$, UID base (0:#)
# 033	ESC	start color
# m	end color
# 0;31	red
# 0;32	green
# 0;34	blue
# 0;35	purple
# 0;36	cyan
# 0;37	gray
PS1="\[\033[0;32m\]\u@\h\[\033[0;37m\] \t \[\033[0;35m\w\033[0m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n\\$ "
# [0m  : 모든 색과 스타일 초기화
# [1m  : 굵게(bold) / 밝게
# [3m  : 이탤릭체(italic)
# [4m  : 밑줄(underline)
# [7m  : 반전(글자색/배경색을 거꾸로)
# [9m  : 가로줄 치기
# [22m : 굵게(bold) 제거
# [23m : 이탤릭체(italic)제거
# [24m : 밑줄(underline)제거
# [27m : 반전 제거
# [29m : 가로줄 제거
# [30m : 글자색:검정
# [31m : 글자색:빨강
# [32m : 글자색:초록
# [33m : 글자색:노랑
# [34m : 글자색:파랑
# [35m : 글자색:마젠트(분홍)
# [36m : 글자색:시안(청록)
# [37m : 글자색:백색
# [39m : 글자색으로 기본값으로
# [40m : 바탕색:흑색
# [41m : 바탕색:적색
# [42m : 바탕색:녹색
# [43m : 바탕색:황색
# [44m : 바탕색:청색
# [45m : 바탕색:분홍색
# [46m : 바탕색:청록색
# [47m : 바탕색:흰색
# [49m :바탕색을 기본값으로

# cscope
export CSCOPE_EDITOR='gvim'

#
# PATH
#
if [ -d ~/rootfs/home/bin ]; then
	PATH=$PATH:~/rootfs/home/bin
fi

if [ -d ~/rootfs/bash/scripts ]; then
	PATH=$PATH:~/rootfs/bash/scripts
fi

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

# xbindkeys
xbindkeys &

