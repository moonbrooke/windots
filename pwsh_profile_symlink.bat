@echo off
setlocal

set "LINK=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.p1"
set "TARGET=C:\GitHub\windots\Microsoft.PowerShell_profile.p1"

mklink "%LINK%" "%TARGET%"
