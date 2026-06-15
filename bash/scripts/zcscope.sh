#!/bin/bash

# 사용자 정의 설정 영역
INCLUDE_PATTERNS=('*.c' '*.h' '*.s' '*.S' '*.cpp')  # 기본 포함 패턴
EXCLUDE_PATTERNS=('*.bak' '*.tmp')                  # 기본 제외 패턴
EXCLUDE_DIRS=("build*" "*/test/*")                  # 제외할 디렉토리
MANUAL_ADD_FILES=()                                 # 추가할 파일 (절대 경로)
MANUAL_REMOVE_FILES=()                              # 제거할 파일 (절대 경로)

# cscope.files 생성 (절대 경로)
generate_cscope_files() {
    echo "Generating cscope.files..."

    # 1. find로 기본 파일 목록 생성 (절대 경로)
    local find_opts=()
    for pattern in "${INCLUDE_PATTERNS[@]}"; do
        find_opts+=(-name "$pattern" -o)
    done
    unset 'find_opts[${#find_opts[@]}-1]'

    for dir in "${EXCLUDE_DIRS[@]}"; do
        find_opts+=(-not -path "$dir")
    done
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        find_opts+=(-not -name "$pattern")
    done

    find "$PWD" -type f \( "${find_opts[@]}" \) > cscope.files.raw

    # 2. 수동 추가 파일 처리
    if [ ${#MANUAL_ADD_FILES[@]} -gt 0 ]; then
        printf "%s\n" "${MANUAL_ADD_FILES[@]}" >> cscope.files.raw
    fi

    # 3. 수동 제거 파일 처리
    if [ ${#MANUAL_REMOVE_FILES[@]} -gt 0 ]; then
        for file in "${MANUAL_REMOVE_FILES[@]}"; do
            sed -i "\|^$file\$|d" cscope.files.raw
        done
    fi

    # 4. 중복 제거 및 정렬
#    sort -u cscope.files.raw > cscope.files
#    rm cscope.files.raw
    mv cscope.files.raw cscope.files

    echo "Final cscope.files contains $(wc -l < cscope.files) files."
}

# ctags 생성
generate_ctags() {
    echo "Generating ctags..."
    ctags -L cscope.files --fields=+iaS --extra=+q -f tags
}

# cscope DB 생성
generate_cscope_db() {
    echo "Generating cscope database..."
#    cscope -b -q -k -i cscope.files
    cscope -b cscope.files
}

# 메인 실행
main() {
    generate_cscope_files
    generate_ctags
    generate_cscope_db
}

main
