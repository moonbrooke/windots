@echo off
setlocal

set "LINK=%USERPROFILE%\_vimrc"
set "TARGET=%~dp0vim\_vimrc"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
