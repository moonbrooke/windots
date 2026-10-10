@echo off
setlocal

set "LINK=%USERPROFILE%\.config\opencode\opencode.jsonc"
set "TARGET=%~dp0opencode\opencode.jsonc"

mklink "%LINK%" "%TARGET%"
