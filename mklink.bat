@echo off
setlocal enabledelayedexpansion

mklink  %USERPROFILE%\init.cmd %USERPROFILE%\dotwin\init.cmd
mklink  %USERPROFILE%\init.macros %USERPROFILE%\dotwin\init.macros
mklink  %USERPROFILE%\.wslconfig %USERPROFILE%\dotwin\.wslconfig
