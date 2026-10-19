@echo off
setlocal

set "LINK=%USERPROFILE%\FlexASIO.toml"
set "TARGET=%~dp0FlexASIO\FlexASIO.toml"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
