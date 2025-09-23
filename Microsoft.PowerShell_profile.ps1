Import-Module -Name Terminal-Icons

# Import Env. Variables
. "$env:USERPROFILE\Documents\PowerShell\Environment_Variables.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Dev_Tools.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Ffmpeg.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Scoop.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Misc.ps1"

# ALIAS
Set-Alias c Clear-Host

# PUT AT THE END
Invoke-Expression (&starship init powershell)
