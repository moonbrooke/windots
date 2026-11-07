@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Roaming\winget-tui"
set "TARGET=%~dp0winget-tui"

:: Remove existing link or folder if it exists
if exist "%LINK%" (
    rmdir "%LINK%" 2>nul
)

:: Create directory symlink (/D switch is required for directories)
mklink /D "%LINK%" "%TARGET%"
