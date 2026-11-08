function .. {
    cd ..
}

# EZA
# NOTE: the profile's coreutils hook rewrites interactive `ls` to coreutils
# ls.cmd before alias resolution, so this alias is shadowed at the prompt.
# `ll` (below) is not a coreutils name and always resolves to eza.
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
# function which {
#     param (
#         [Parameter(Mandatory = $true)]
#         [string]$Bin
#     )
#     where.exe "$Bin"
# }

function ff {
    fastfetch
}

function fhg {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    Get-FileHash $Path
}

function fhc {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [Parameter(Mandatory=$true)]
        [string]$HashToCompare
    )
    $ActualHash = (Get-FileHash $Path).Hash.ToLower()
    $HashToCompare = $HashToCompare.Trim().ToLower()
    if ($ActualHash -ieq $HashToCompare) {
        Write-Host "👌 Hash match!" -ForegroundColor Green
        Write-Host "Hash: " -NoNewline
        Write-Host "$HashToCompare" -ForegroundColor Green -NoNewline
    } else {
        Write-Host "💀 Hash mismatch!" -ForegroundColor Red
        Write-Host "Actual:   " -NoNewline
        Write-Host "$ActualHash" -ForegroundColor Green
        Write-Host "Expected: " -NoNewline
        Write-Host "$HashToCompare" -ForegroundColor Red
    }
}
