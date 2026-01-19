#!/bin/bash

echo "1. 프로젝트 폴더로 이동"
cd ~/workspace/todo-repository

echo "2. 최신 코드 pull"
git pull origin main

echo "3. 기존 uvicorn 프로세스 종료"
# uvicorn 실행 중이면 PID 찾아서 종료
pkill -f "uvicorn main:app" || true

echo "4. 서버 백그라운드 실행"
nohup uv run uvicorn main:app \
  --host 0.0.0.0 \
  --port 8000 \
  > uvicorn.log 2>&1 < /dev/null &
