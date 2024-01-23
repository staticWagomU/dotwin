@echo off

for /f %%i in ('dir %cd% /b /A:D ^| peco') do (
	cd %%i
	break
)

