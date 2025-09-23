@echo off
setlocal

set "LINK=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
set "TARGET=C:\GitHub\windots\Microsoft.PowerShell_profile.ps1"

mklink "%LINK%" "%TARGET%"
