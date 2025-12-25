@echo off
setlocal

set "LINK1=%USERPROFILE%\AppData\Local\clink\clink_settings"
set "TARGET1=%~dp0clink\clink_settings"

set "LINK2=%USERPROFILE%\AppData\Local\clink\starship.lua"
set "TARGET2=%~dp0clink\starship.lua"

mklink "%LINK1%" "%TARGET1%"
mklink "%LINK2%" "%TARGET2%"
