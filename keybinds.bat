@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\keybinds.ahk"
set "TARGET=%~dp0AHK\keybinds.ahk"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
