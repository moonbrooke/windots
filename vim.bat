@echo off
setlocal

set "LINK=%USERPROFILE%\_vimrc"
set "TARGET=%~dp0vim\_vimrc"

mklink "%LINK%" "%TARGET%"
