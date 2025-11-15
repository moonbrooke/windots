@echo off
setlocal

set "LINK=%USERPROFILE%\.wezterm.lua"
set "TARGET=C:\GitHub\windots\wezterm\.wezterm.lua"

mklink "%LINK%" "%TARGET%"
