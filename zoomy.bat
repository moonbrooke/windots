@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\zoomy_mouse.ahk"
set "TARGET=C:\GitHub\windots\AHK\zoomy_mouse.ahk"

mklink "%LINK%" "%TARGET%"
