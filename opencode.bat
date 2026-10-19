@echo off
setlocal

set "LINK=%USERPROFILE%\.config\opencode\opencode.jsonc"
set "TARGET=%~dp0opencode\opencode.jsonc"

set "LINK2=%USERPROFILE%\.config\opencode\cli.json"
set "TARGET2=%~dp0opencode\cli.json"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
if exist "%LINK2%" del "%LINK2%"
mklink "%LINK2%" "%TARGET2%"
