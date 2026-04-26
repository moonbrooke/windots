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

function cdsteambooster {
    cd "$env:GITHUB/shb-fork"
}
Set-Alias cdsb cdsteambooster

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

function link {
    param (
        [Parameter(Mandatory=$true)]
        [string]$L,

        [Parameter(Mandatory=$true)]
        [string]$T
    )

    if (-Not (Test-Path -Path $T)) {
        Write-Warning "Target path '$T' does not exist."
        return
    }

    if (Test-Path -Path $L) {
        Write-Warning "The folder '$L' already exists! Please delete or rename it first."
        return
    }

    try {
        New-Item -ItemType SymbolicLink -Path $L -Target $T | Out-Null
        Write-Host "Success: Symlink created!" -ForegroundColor Green
        Write-Host "$L <<===>> $T" -ForegroundColor Cyan
    }
    catch {
        Write-Error "Failed to create symbolic link. Did you remember to run PowerShell as Administrator?"
    }
}
