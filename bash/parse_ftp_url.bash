#!/bin/sh
#
# tftp://HOSTNAME/FILENAME
# ftp://ID:PASSWD@HOSTNAME/PATH/FILENAME
#

g_sMyName=`basename $0`

g_sUrl=$1   # URL


C_ProtoTftp=1
C_ProtoFtp=2
C_ProtoNone=3
g_nProto=$C_ProtoNone

g_sHost="Unknown"
g_sFile="Unknown"

g_sId="Unknown"
g_sPasswd="Unknown"

g_sPath=

#------------------------------------------------------------------------------
#
function F_ShowUsage()
{
    echo "usage: $g_sMyName URL"
    echo "   ex) $g_sMyName tftp://HOSTNAME/FILENAME"
    echo "       $g_sMyName ftp://ID:PASSWD@HOSTNAME/PATH/FILENAME"
}

#------------------------------------------------------------------------------
#
function F_CheckArgs()
{
    if [[ "$#" != "1" ]]; then
        F_ShowUsage
        exit -1
    fi
}

#------------------------------------------------------------------------------
#
function F_ParseProto()
{
    nProtoLen=`expr match "$g_sUrl" "ftp"`      # 매칭되는 substring의 길이
    if [[ "$nProtoLen" == "3" ]]; then
        g_nProto=$C_ProtoFtp
        g_sUrl=${g_sUrl#ftp://}                   # 문자열 삭제
    fi

    nProtoLen=`expr match "$g_sUrl" "tftp"`
    if [[ "$nProtoLen" == "4" ]]; then
        g_nProto=$C_ProtoTftp
        g_sUrl=${g_sUrl#tftp://}                  # 문자열 삭제
    fi

    if [[ "$g_nProto" == "$C_ProtoNone" ]]; then
        echo "Unknown protocol name"
        F_ShowUsage
        exit -1
    fi
}

#------------------------------------------------------------------------------
#
function F_ParseHost()
{
    nHostLen=`expr match "$g_sUrl" "[.a-zA-Z0-9]*"`

    g_sHost=${g_sUrl:0:$nHostLen}

    g_sUrl=${g_sUrl#$g_sHost/}                  # 문자열 삭제
}

#------------------------------------------------------------------------------
#
function F_ParseFile()
{
    g_sFile=$g_sUrl
}

#------------------------------------------------------------------------------
#
function F_ParseId()
{
#    echo ""; echo "F_ParseId()"
#    echo $g_sUrl

    nIdLen=`expr match "$g_sUrl" "[.a-zA-Z0-9]*"`

    g_sId=${g_sUrl:0:$nIdLen}

    g_sUrl=${g_sUrl#$g_sId:}                  # 문자열 삭제
}

#------------------------------------------------------------------------------
#
function F_ParsePasswd()
{
#    echo ""; echo "F_ParsePasswd()"
#    echo $g_sUrl

    nIdLen=`expr match "$g_sUrl" "[.,~'\"a-zA-Z0-9]*"`

    g_sPasswd=${g_sUrl:0:$nIdLen}

    g_sUrl=${g_sUrl#$g_sPasswd@}                  # 문자열 삭제
}

#------------------------------------------------------------------------------
#
function F_ParsePath()
{
#    echo ""; echo "F_ParsePath(()"
#    echo $g_sUrl

    nPathLen=`expr match "$g_sUrl" "[-_/a-zA-Z0-9]*/"`

    let "nPathLen -= 1"                         # 맨 뒤의 '/'는 제외

    g_sPath=${g_sUrl:0:$nPathLen}

    g_sUrl=${g_sUrl#$g_sPath/}                  # 문자열 삭제
}

#------------------------------------------------------------------------------
#
function F_ShowArgs()
{
    if [[ "$g_nProto" == "$C_ProtoFtp"  ]]; then
        echo "ftp"
    fi
    if [[ "$g_nProto" == "$C_ProtoTftp" ]]; then
        echo "tftp"
    fi

    echo "$g_sHost"
    echo "$g_sFile"

    echo "$g_sId"
    echo "$g_sPasswd"
    echo "$g_sPath"
}

#------------------------------------------------------------------------------
#
function F_Parse()
{

    F_ParseProto

    if [[ "$g_nProto" == "$C_ProtoFtp"  ]]; then
        F_ParseId
        F_ParsePasswd
    fi

    F_ParseHost

    if [[ "$g_nProto" == "$C_ProtoFtp"  ]]; then
        F_ParsePath
    fi

    F_ParseFile
}

#------------------------------------------------------------------------------
#
function F_Main()
{
    F_CheckArgs $*

    F_Parse

    F_ShowArgs;    echo ""; echo ""
}

F_Main $*

exit 0
