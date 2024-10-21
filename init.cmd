@echo off

prompt [$T]$S[31m%USERNAME%@%COMPUTERNAME%$S[32m$P[0m$_$$$S
doskey /macrofile=%USERPROFILE%\init.macros
set PATH=C:\Users\wagomu\dotwin\bat;%PATH%;%LOCALAPPDATA%\aquaproj-aqua\bat;%LOCALAPPDATA%\aquaproj-aqua\bin;%PATH%
if "%CMD_INIT_SCRIPT_LOADED%" neq "" goto :eof
set CMD_INIT_SCRIPT_LOADED=1
set WEZTERM_CONFIG_FILE=%USERPROFILE%\wezterm.lua
set AQUA_GLOBAL_CONFIG=%USERPROFILE%\aqua.yaml
set LANG=ja_JP.UTF-8

REM proto
set PROTO_HOME=%USERPROFILE%\.proto
set PATH=%USERPROFILE%\.proto\shims;%PATH%
set PATH=%USERPROFILE%\.proto\bin;%PATH%

set PATH=C:\Program Files\Vim\vim91;%USERPROFILE%\dotwin\bat;%PATH%

cls
