@echo off
setlocal

set "LINK1=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
set "TARGET1=C:\GitHub\windots\Microsoft.PowerShell_profile.ps1"

set "LINK2=%USERPROFILE%\Documents\PowerShell\Environment_Variables.ps1"
set "TARGET2=C:\GitHub\windots\Environment_Variables.ps1"

set "LINK3=%USERPROFILE%\Documents\PowerShell\Dev_Tools.ps1"
set "TARGET3=C:\GitHub\windots\Dev_Tools.ps1"

set "LINK4=%USERPROFILE%\Documents\PowerShell\Ffmpeg.ps1"
set "TARGET4=C:\GitHub\windots\Ffmpeg.ps1"

set "LINK5=%USERPROFILE%\Documents\PowerShell\Scoop.ps1"
set "TARGET5=C:\GitHub\windots\Scoop.ps1"

set "LINK6=%USERPROFILE%\Documents\PowerShell\Misc.ps1"
set "TARGET6=C:\GitHub\windots\Misc.ps1"

set "LINK7=%USERPROFILE%\Documents\PowerShell\Youtube.ps1"
set "TARGET7=C:\GitHub\windots\Youtube.ps1"

set "LINK8=%USERPROFILE%\Documents\PowerShell\Stow.ps1"
set "TARGET8=C:\GitHub\windots\Stow.ps1"

mklink "%LINK1%" "%TARGET1%"
mklink "%LINK2%" "%TARGET2%"
mklink "%LINK3%" "%TARGET3%"
mklink "%LINK4%" "%TARGET4%"
mklink "%LINK5%" "%TARGET5%"
mklink "%LINK6%" "%TARGET6%"
mklink "%LINK7%" "%TARGET7%"
mklink "%LINK8%" "%TARGET8%"
