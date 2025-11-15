@echo off
setlocal

set "LINK=%USERPROFILE%\.wezterm.lua"
set "TARGET=%~dp0wezterm\.wezterm.lua"

mklink "%LINK%" "%TARGET%"
