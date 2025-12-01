@echo off
setlocal

set "LINK=%USERPROFILE%\.wslconfig"
set "TARGET=%~dp0WSL\.wslconfig"

mklink "%LINK%" "%TARGET%"
