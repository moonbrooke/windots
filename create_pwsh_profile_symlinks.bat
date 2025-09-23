@echo off
setlocal

set "LINK1=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
set "TARGET1=C:\GitHub\windots\Microsoft.PowerShell_profile.ps1"

set "LINK2=%USERPROFILE%\Documents\PowerShell\Environment_Variables.ps1"
set "TARGET2=C:\GitHub\windots\Environment_Variables.ps1"

mklink "%LINK1%" "%TARGET1%"
mklink "%LINK2%" "%TARGET2%"
