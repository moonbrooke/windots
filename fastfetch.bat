@echo off
setlocal

set "LINK=%USERPROFILE%\.config\fastfetch\config.jsonc"
set "TARGET=%~dp0fastfetch\config.jsonc"

mklink "%LINK%" "%TARGET%"
