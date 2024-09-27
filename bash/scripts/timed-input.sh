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
    # 1�ʸ� ��ٸ��� �˶� �ñ׳�(sigalarm)�� ��ũ��Ʈ�� ����.
}
 
F_Int14Vector()
{
    exit 14  
}
 
trap F_Int14Vector 14   # Ÿ�̸� ���ͷ�Ʈ(14)�� �츮 �ǵ���� Ÿ�Ӿƿ��� ó����.
 
F_TimerOn
 
read ANSWER
 
# �� ����
if [ "$ANSWER" == "t" ]; then 
    exit 0
fi
        
exit 9
