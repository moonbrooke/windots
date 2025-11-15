@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\alacritty"
set "TARGET=%~dp0alacritty"

:: Remove existing link or folder if it exists
if exist "%LINK%" (
    rmdir "%LINK%" 2>nul
)

:: Create directory symlink (/D switch is required for directories)
mklink /D "%LINK%" "%TARGET%"
