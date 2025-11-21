@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\keybinds.ahk"
set "TARGET=%~dp0AHK\keybinds.ahk"

mklink "%LINK%" "%TARGET%"
