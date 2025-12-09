Import-Module -Name Terminal-Icons

# Import Env. Variables
. "$env:USERPROFILE\Documents\PowerShell\Environment_Variables.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Dev_Tools.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Ffmpeg.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Scoop.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Choco.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Misc.ps1"
. "$env:USERPROFILE\Documents\PowerShell\Youtube.ps1"

# ALIAS
Set-Alias c Clear-Host
Set-Alias stow "$PSScriptRoot\Stow.ps1"

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# PUT AT THE END
Invoke-Expression (&starship init powershell)
