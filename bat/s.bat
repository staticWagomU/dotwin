@echo off

:: カウント用変数を初期化
set "count=0"

:: ディレクトリ一覧を取得しながらサブルーチンへ飛ぶ
for /d %%d in (*) do call :StoreDir "%%d"

:: ディレクトリ選択に戻るためのラベル
goto :SelectDir

::-----------------------------------------
:: サブルーチン: ディレクトリを表示し変数に保持する
:StoreDir
set /a count+=1
echo %count%: %~1
set "dir%count%=%~1"
goto :EOF
::-----------------------------------------

:SelectDir
set /p "selection=Enter the number: "
call set "target_dir=%%dir%selection%%%"

if not defined target_dir (
    echo Invalid entry. Please try again.
    goto :SelectDir
)

:: 選択したディレクトリへ移動
cd "%target_dir%"
