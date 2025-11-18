@echo off
setlocal

set "LINK1=%USERPROFILE%\.bashrc"
set "TARGET1=%~dp0git-bash\.bashrc"

set "LINK2=%USERPROFILE%\.inputrc"
set "TARGET2=%~dp0git-bash\.inputrc"

mklink "%LINK1%" "%TARGET1%"
mklink "%LINK2%" "%TARGET2%"
