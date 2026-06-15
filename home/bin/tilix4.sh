#!/bin/bash


# 필요한 패키지 설치 확인
if ! command -v xdotool &> /dev/null; then
    echo "xdotool이 설치되어 있지 않습니다. 설치 중..."
    sudo apt-get install -y xdotool
fi

# Tilix 실행
tilix --session=~/rootfs/home/.config/tilix/layout4.json &

# 잠시 기다려 Tilix가 완전히 로드되도록 함
sleep 2

# Tilix 창 찾기
TILIX_WINDOW=$(xdotool search --name "Tilix" | head -1)
if [ -z "$TILIX_WINDOW" ]; then
    echo "Tilix 창을 찾을 수 없습니다."
    exit 1
fi

# 창 활성화
xdotool windowactivate $TILIX_WINDOW

# 각 Tilix 창에 명령 입력
for WIN_ID in "${TILIX_WINDOWS[@]:0:4}"; do
    # Tilix 터미널 창 활성화
    xdotool windowfocus $WIN_ID
    sleep 0.5

    # 명령 실행
    xdotool type "ssh -X green"
    sleep 0.5

    # 명령 실행
    xdotool type "ssh -X green"
    xdotool key Return

    sleep 0.5
done



## 첫 번째 터미널에서 시작
#sleep 1
#
# 각 터미널에 명령 입력
#for i in {1..4}; do
#    # 명령 입력
#    xdotool type "ssh -X green"
#    xdotool key Return
#    
#    # 다음 터미널로 이동 (Alt+화살표 키 사용)
#    if [ $i -lt 4 ]; then
#        if [ $i -eq 1 ]; then
#            # 오른쪽으로 이동
#            xdotool key Alt_L+Right
#        elif [ $i -eq 2 ]; then
#            # 아래로 이동
#            xdotool key Alt_L+Down
#        elif [ $i -eq 3 ]; then
#            # 왼쪽으로 이동
#            xdotool key Alt_L+Left
#        fi
#        sleep 1
#    fi
#done

echo "모든 터미널에 명령을 전송했습니다."


#
## Tilix 실행
#tilix --session=~/rootfs/home/.config/tilix/layout4.json &
#
## 잠시 기다려 Tilix가 완전히 로드되도록 함
#sleep 1
#
## 필요한 패키지 설치 확인
#if ! command -v xdotool &> /dev/null; then
#    echo "xdotool이 설치되어 있지 않습니다. 설치 중..."
#    sudo apt-get install -y xdotool
#fi
#
## D-Bus 인터페이스를 사용하여 Tilix의 모든 터미널에 명령 보내기
#TILIX_PID=$(pgrep -f "tilix --session")
#if [ -z "$TILIX_PID" ]; then
#    echo "Tilix 프로세스를 찾을 수 없습니다."
#    exit 1
#fi
#
## gdbus를 사용하여 각 터미널에 명령 전송
#for i in {0..3}; do
#    # dbus 메시지 전송 (Tilix의 터미널 각각에 대해)
#    gdbus call --session --dest com.gexperts.Tilix \
#               --object-path /com/gexperts/Tilix/terminal$i \
#               --method com.gexperts.Tilix.Terminal.Feed \
#               "ssh -X green"$'\n' false
#done
#
#echo "모든 터미널에 명령을 전송했습니다."
