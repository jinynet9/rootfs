#!/bin/sh
# timed-input.sh
 
TIMELIMIT=$1
MESSAGE=$2
ANSWER=$3
 
let "TIMELIMIT *= 10"
 
stty -icanon -echo min 0 time $TIMELIMIT
 
echo -n $MESSAGE
read INPUT
 
stty icanon echo min 1 time 0
 
if [ "$INPUT" == "$ANSWER" ]; then
    exit 0
fi
     
exit 9
     
     
     
     
     
     
     
F_TimerOn()
{
    sleep $TIMELIMIT && kill -s 14 $$ 2> /dev/null & 
    # 1초를 기다리고 알람 시그널(sigalarm)을 스크립트에 보냄.
}
 
F_Int14Vector()
{
    exit 14  
}
 
trap F_Int14Vector 14   # 타이머 인터럽트(14)는 우리 의도대로 타임아웃을 처리함.
 
F_TimerOn
 
read ANSWER
 
# 쉘 수행
if [ "$ANSWER" == "t" ]; then 
    exit 0
fi
        
exit 9
