@echo off
setlocal

set "LINK1=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
set "TARGET1=%~dp0powershell\Microsoft.PowerShell_profile.ps1"

set "LINK2=%USERPROFILE%\Documents\PowerShell\Environment_Variables.ps1"
set "TARGET2=%~dp0powershell\Environment_Variables.ps1"

set "LINK3=%USERPROFILE%\Documents\PowerShell\Dev_Tools.ps1"
set "TARGET3=%~dp0powershell\Dev_Tools.ps1"

set "LINK4=%USERPROFILE%\Documents\PowerShell\Ffmpeg.ps1"
set "TARGET4=%~dp0powershell\Ffmpeg.ps1"

set "LINK5=%USERPROFILE%\Documents\PowerShell\Scoop.ps1"
set "TARGET5=%~dp0powershell\Scoop.ps1"

set "LINK6=%USERPROFILE%\Documents\PowerShell\Choco.ps1"
set "TARGET6=%~dp0powershell\Choco.ps1"

set "LINK7=%USERPROFILE%\Documents\PowerShell\Misc.ps1"
set "TARGET7=%~dp0powershell\Misc.ps1"

set "LINK8=%USERPROFILE%\Documents\PowerShell\Youtube.ps1"
set "TARGET8=%~dp0powershell\Youtube.ps1"

set "LINK9=%USERPROFILE%\Documents\PowerShell\Stow.ps1"
set "TARGET9=%~dp0powershell\Stow.ps1"

set "LINK10=%USERPROFILE%\Documents\PowerShell\Prompt.ps1"
set "TARGET10=%~dp0powershell\Prompt.ps1"

set "LINK11=%USERPROFILE%\Documents\PowerShell\General.ps1"
set "TARGET11=%~dp0powershell\General.ps1"

set "LINK12=%USERPROFILE%\Documents\PowerShell\powershell.config.json"
set "TARGET12=%~dp0powershell\powershell.config.json"

if exist "%LINK1%" del "%LINK1%"
mklink "%LINK1%" "%TARGET1%"
if exist "%LINK2%" del "%LINK2%"
mklink "%LINK2%" "%TARGET2%"
if exist "%LINK3%" del "%LINK3%"
mklink "%LINK3%" "%TARGET3%"
if exist "%LINK4%" del "%LINK4%"
mklink "%LINK4%" "%TARGET4%"
if exist "%LINK5%" del "%LINK5%"
mklink "%LINK5%" "%TARGET5%"
if exist "%LINK6%" del "%LINK6%"
mklink "%LINK6%" "%TARGET6%"
if exist "%LINK7%" del "%LINK7%"
mklink "%LINK7%" "%TARGET7%"
if exist "%LINK8%" del "%LINK8%"
mklink "%LINK8%" "%TARGET8%"
if exist "%LINK9%" del "%LINK9%"
mklink "%LINK9%" "%TARGET9%"
if exist "%LINK10%" del "%LINK10%"
mklink "%LINK10%" "%TARGET10%"
if exist "%LINK11%" del "%LINK11%"
mklink "%LINK11%" "%TARGET11%"
if exist "%LINK12%" del "%LINK12%"
mklink "%LINK12%" "%TARGET12%"
