@echo off
setlocal

set "LINK=%USERPROFILE%\.wslconfig"
set "TARGET=%~dp0WSL\.wslconfig"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
