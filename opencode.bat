@echo off
setlocal

set "LINK=%USERPROFILE%\.config\opencode\opencode.jsonc"
set "TARGET=%~dp0opencode\opencode.jsonc"

set "LINK2=%USERPROFILE%\.config\opencode\cli.json"
set "TARGET2=%~dp0opencode\cli.json"

mklink "%LINK%" "%TARGET%"
mklink "%LINK2%" "%TARGET2%"
