#!/bin/bash
set -e  # 명령어가 실패할 경우 스크립트를 즉시 종료
set -x  # 스크립트가 실행되는 명령어를 출력

echo "#### Before git config ####"
# 색상 출력 함수 정의
echo_info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

echo_error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1" >&2
}

get_os() {
  OS="$(uname -s)"
  case "$OS" in
      Linux*)
        echo "Linux"
        ;;
      Darwin*)
        echo "macOS"
        ;;
      CYGWIN*|MINGW*)
        echo "Windows"  # Git Bash, Cygwin, MinGW 환경일 때 Windows로 처리
        ;;
      *)
        echo "Unknown OS: $OS"
        exit 1
        ;;
  esac
}

get_os

# Git 설치 여부 확인
if ! command -v git &> /dev/null
then
    echo_error "Git이 설치되어 있지 않습니다. Git을 먼저 설치해 주세요."
    exit 1
fi

echo_info "Git 전역 설정을 적용 중입니다..."
git config --global merge.conflictstyle zdiff3
git config --global pull.rebase true
git config --global branch.sort -committerdate
git config --global branch.diff.algorithm histogram
git config --global init.defaultBranch main
git config --global rebase.autostash true

if [ $? -ne 0 ]; then
    echo_error "설정 실패"
    exit 1
fi

echo_info "Git 전역 설정이 성공적으로 적용되었습니다."
git config --global --list | grep -E 'merge.conflictstyle|pull.rebase|branch.sort|branch.diff.algorithm|init.defaultBranch|rebase.autostash'
echo_info "Git 전역 설정이 성공적으로 적용되었습니다."
