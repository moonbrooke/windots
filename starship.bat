@echo off
setlocal

set "LINK=%USERPROFILE%\.config\starship.toml"
set "TARGET=C:\GitHub\windots\starship\starship.toml"

mklink "%LINK%" "%TARGET%"
