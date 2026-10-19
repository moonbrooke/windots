@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "TARGET=%~dp0terminal\settings.json"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
