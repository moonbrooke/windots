@echo off
setlocal

set "LINK=%USERPROFILE%\.config\starship.toml"
set "TARGET=%~dp0starship\starship.toml"

mklink "%LINK%" "%TARGET%"
