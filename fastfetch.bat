@echo off
setlocal

set "LINK=%USERPROFILE%\.config\fastfetch\config.jsonc"
set "TARGET=%~dp0fastfetch\config.jsonc"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
