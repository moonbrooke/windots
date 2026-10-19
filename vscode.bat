@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\Code\User\settings.json"
set "TARGET=%~dp0vscode\settings.json"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
