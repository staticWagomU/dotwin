@echo off
setlocal enabledelayedexpansion

mklink /D C:\Users\wagomu\AppData\Local\nvim C:\Users\wagomu\dotfiles\config\nvim
mklink /D C:\Users\wagomu\vimfiles C:\Users\wagomu\dotfiles\config\vim

mklink  %USERPROFILE%\init.cmd %USERPROFILE%\dotwin\init.cmd
mklink  %USERPROFILE%\init.macros %USERPROFILE%\dotwin\init.macros
