@echo off
setlocal enabledelayedexpansion

REM dockerコマンドを実行できなければ終了
docker --version > nul
if %errorlevel% neq 0 (
  exit /b 1
)

(for /f "skip=2 delims=" %%a in ('docker ps') do (
    echo %%a
)) > temp.txt

type temp.txt | peco > selected.txt

set /p selected=<selected.txt

for /f "tokens=1" %%b in ("%selected%") do (
    set CONTAINER_ID=%%b
)

echo Selected CONTAINER ID: %CONTAINER_ID%

docker exec -it %CONTAINER_ID% bash

del temp.txt
del selected.txt

endlocal
