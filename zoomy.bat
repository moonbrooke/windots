@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\zoomy_mouse.ahk"
set "TARGET=%~dp0AHK\zoomy_mouse.ahk"

mklink "%LINK%" "%TARGET%"
