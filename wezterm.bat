@echo off
setlocal

set "LINK=%USERPROFILE%\.wezterm.lua"
set "TARGET=%~dp0wezterm\.wezterm.lua"

if exist "%LINK%" del "%LINK%"
mklink "%LINK%" "%TARGET%"
