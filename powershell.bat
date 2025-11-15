@echo off
setlocal

set "LINK1=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
set "TARGET1=%~dp0Microsoft.PowerShell_profile.ps1"

set "LINK2=%USERPROFILE%\Documents\PowerShell\Environment_Variables.ps1"
set "TARGET2=%~dp0Environment_Variables.ps1"

set "LINK3=%USERPROFILE%\Documents\PowerShell\Dev_Tools.ps1"
set "TARGET3=%~dp0Dev_Tools.ps1"

set "LINK4=%USERPROFILE%\Documents\PowerShell\Ffmpeg.ps1"
set "TARGET4=%~dp0Ffmpeg.ps1"

set "LINK5=%USERPROFILE%\Documents\PowerShell\Scoop.ps1"
set "TARGET5=%~dp0Scoop.ps1"

set "LINK6=%USERPROFILE%\Documents\PowerShell\Misc.ps1"
set "TARGET6=%~dp0Misc.ps1"

set "LINK7=%USERPROFILE%\Documents\PowerShell\Youtube.ps1"
set "TARGET7=%~dp0Youtube.ps1"

set "LINK8=%USERPROFILE%\Documents\PowerShell\Stow.ps1"
set "TARGET8=%~dp0Stow.ps1"

mklink "%LINK1%" "%TARGET1%"
mklink "%LINK2%" "%TARGET2%"
mklink "%LINK3%" "%TARGET3%"
mklink "%LINK4%" "%TARGET4%"
mklink "%LINK5%" "%TARGET5%"
mklink "%LINK6%" "%TARGET6%"
mklink "%LINK7%" "%TARGET7%"
mklink "%LINK8%" "%TARGET8%"
