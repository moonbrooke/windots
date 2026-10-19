@echo off
setlocal

set "LINK=%USERPROFILE%\.config\starship.toml"
set "TARGET=%~dp0starship\starship.toml"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
