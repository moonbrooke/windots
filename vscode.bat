@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\Code\User\settings.json"
set "TARGET=C:\GitHub\windots\vscode\settings.json"

mklink "%LINK%" "%TARGET%"
