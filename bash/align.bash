#!/bin/sh
#
# BlockSize 단위로 FILE을 맞춘다
# for bash library
# 06-04-03
#

g_sMyName=`basename $0`

if [ 2 -ne $# ]; then
    echo "usage: $g_sMyName FILE BlockSize"
    exit -1
fi

if [ ! -e "$1" ]; then
    echo "file \"$1\" not exist !!!"
    exit -1
fi

g_sFile="$1"
g_nFileSize=$(bash_fsize "$g_sFile")

g_nBlockSize=$2

g_nBlockCnt=0       # align을 위해 필요한 block count

# block count 계산
F_BlockCount()
{
    let "g_nBlockCnt = $g_nFileSize / $g_nBlockSize"

    let "nRemainLength = $g_nFileSize % $g_nBlockSize"

    # 모듈값이 0이 아니면 1증가
    if [ 0 -ne $nRemainLength ]; then
        let "g_nBlockCnt = $g_nBlockCnt + 1"
    fi
}

F_BlockCount

dd if=/dev/zero of="$g_sFile" bs=$g_nBlockSize seek=$g_nBlockCnt count=0 > /dev/null 2>&1

exit 0
