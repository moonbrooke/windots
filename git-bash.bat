@echo off
setlocal

set "LINK1=%USERPROFILE%\.bashrc"
set "TARGET1=%~dp0git-bash\.bashrc"

set "LINK2=%USERPROFILE%\.inputrc"
set "TARGET2=%~dp0git-bash\.inputrc"

if exist "%LINK1%" del "%LINK1%"
mklink "%LINK1%" "%TARGET1%"
if exist "%LINK2%" del "%LINK2%"
mklink "%LINK2%" "%TARGET2%"
