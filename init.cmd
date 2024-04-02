@echo off

prompt $T$B$S$P$_$$$S
doskey /macrofile=%USERPROFILE%\init.macros
set PATH=C:\Users\wagomu\dotwin\bat;%PATH%;%LOCALAPPDATA%\aquaproj-aqua\bat;%LOCALAPPDATA%\aquaproj-aqua\bin;%PATH%
if "%CMD_INIT_SCRIPT_LOADED%" neq "" goto :eof
set CMD_INIT_SCRIPT_LOADED=1
set WEZTERM_CONFIG_FILE=%USERPROFILE%\wezterm.lua
set AQUA_GLOBAL_CONFIG=%USERPROFILE%\aqua.yaml
set LANG=ja_JP.UTF-8

cls

REM proto
set PROTO_HOME=%USERPROFILE%\.proto
set PATH=%PROTO_HOME%\shims;%PROTO_HOME%\bin;%PATH%
