@echo off
setlocal

set "LINK=%USERPROFILE%\FlexASIO.toml"
set "TARGET=C:\GitHub\windots\FlexASIO\FlexASIO.toml"

mklink "%LINK%" "%TARGET%"
