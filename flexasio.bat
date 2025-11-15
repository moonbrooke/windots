@echo off
setlocal

set "LINK=%USERPROFILE%\FlexASIO.toml"
set "TARGET=%~dp0FlexASIO\FlexASIO.toml"

mklink "%LINK%" "%TARGET%"
