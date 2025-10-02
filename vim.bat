@echo off
setlocal

set "LINK=%USERPROFILE%\_vimrc"
set "TARGET=C:\GitHub\windots\vim\_vimrc"

mklink "%LINK%" "%TARGET%"
