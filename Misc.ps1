# Teldrive
function tdr {
    teldrive run -c "$env:USERPROFILE\.installer\bin\config.toml"
}

# Warp CLI
function wcc {
    warp-cli connect
}

function wcd {
    warp-cli disconnect
}

# Others
Set-Alias msk musikcube

function Link-MusikcubeTheme {
    New-Item -ItemType SymbolicLink `
      -Path "$env:USERPROFILE\scoop\apps\musikcube\current\themes\catppuccin_mocha.json" `
      -Target "$env:USERPROFILE\.config\musikcube\catppuccin_mocha.json"
}
Set-Alias mskt Link-MusikcubeTheme

function winutil {
    irm "https://christitus.com/win" | iex
}

# function Link-PwshProfile {
#     $linkPath = Join-Path $env:USERPROFILE "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
#     $targetPath = "C:\GitHub\windots\Microsoft.PowerShell_profile.ps1"
#
#     New-Item -ItemType SymbolicLink `
#              -Path $linkPath `
#              -Target $targetPath
# }
# Set-Alias pwshlink Link-PwshProfile

