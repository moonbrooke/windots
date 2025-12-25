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
# Invoke-Expression (&starship init powershell)

# Custom PowerShell Prompt 
function prompt {
    $cwd = (Get-Location).Path

    $gitInfo = ""
    try {
        $gitDir = git rev-parse --show-toplevel 2>$null
        if ($gitDir) {
            $repoName = Split-Path $gitDir -Leaf
            $branch   = git rev-parse --abbrev-ref HEAD 2>$null
            if ($branch) {
                $gitInfo = "  $branch"
            } else {
                $gitInfo = " 󰊢 $repoName"
            }
        }
    } catch {}

    Write-Host $cwd -ForegroundColor Cyan -NoNewline
    if ($gitInfo) {
        Write-Host $gitInfo -ForegroundColor Magenta
    } else {
        Write-Host ""
    }

    Write-Host "$" -ForegroundColor Green -NoNewline
    return " "
}
