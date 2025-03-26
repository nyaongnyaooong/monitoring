#!/bin/sh
set -e

# 종료 신호를 Node.js 프로세스에 전달하는 트랩 설정
trap 'kill -TERM $NODE_PID; wait $NODE_PID' TERM INT

# 메인 애플리케이션 시작
node exporter.js &
NODE_PID=$!

# 메인 프로세스가 종료될 때까지 대기
wait $NODE_PID