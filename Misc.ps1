# EZA
function ezadf {
    eza --group-directories-first
}
Set-Alias ls ezadf

function ezalldf {
    eza -la --group-directories-first
}
Set-Alias ll ezalldf

# Delete directory
function Remove-FolderForce {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    Remove-Item $Path -Recurse -Force
}
Set-Alias rmdir Remove-FolderForce

# Which command
function which {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Bin
    )
    where.exe "$Bin"
}


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

function Dictionary {
    param([string]$Word)
    $url = "https://api.dictionaryapi.dev/api/v2/entries/en/$Word"
    $response = Invoke-RestMethod -Uri $url -Method Get
    $response[0].meanings[0].definitions[0].definition
}
Set-Alias dict Dictionary

function adlc {
    cd $env:USERPROFILE/AppData/Local
}

function adrm {
    cd $env:USERPROFILE/AppData/Roaming
}
