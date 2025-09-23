Import-Module -Name Terminal-Icons

# ALIAS
Set-Alias c Clear-Host

# go
function gocc {
    go clean -cache
}

function gocm {
    go clean -modcache
}

# scoop
function scu {
    param([string]$query = "")
    scoop update $query
}

function scs {
    param([string]$query)
    scoop search $query
}

function sci {
    param([string]$query)
    scoop install $query
}

function scun {
    param([string]$query)
    scoop uninstall $query
}

function scc {
    scoop cache
}

function sccr {
    scoop cache rm *
}

function scl {
    scoop list
}

function scst {
    scoop status
}

function scin {
    param([string]$query)
    scoop info $query
}

function sccu {
    param([string]$query)
    scoop cleanup $query
}

function scwh {
    param([string]$query)
    scoop which $query
}

function scd {
    param([string]$query)
    scoop depends $query
}

# git
function gs {
    git status
}

function gaa {
    git add *
}

function gp {
    git push
}

# Teldrive
function tdr {
    teldrive run -c C:\Users\farpras\.installer\bin\config.toml
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
      -Path "C:\Users\farpras\scoop\apps\musikcube\current\themes\catppuccin_mocha.json" `
      -Target "C:\Users\farpras\.config\musikcube\catppuccin_mocha.json"
}
Set-Alias mskt Link-MusikcubeTheme

function winutil {
    irm "https://christitus.com/win" | iex
}

# ffmpeg
function Ffmpeg-AudioToMP3 {
    param (
        [Parameter(Mandatory)]
        [string]$InputFile
    )

    $BaseName = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
    $Directory = [System.IO.Path]::GetDirectoryName($InputFile)
    $OutputFile = Join-Path $Directory "$BaseName-ffmpeg.mp3"

    ffmpeg -i $InputFile `
           -write_id3v1 1 `
           -id3v2_version 3 `
           -dither_method triangular `
           -out_sample_rate 48k `
           -b:a 320k `
           $OutputFile
}
Set-Alias convertmp3 Ffmpeg-AudioToMP3

function Ffmpeg-VideoToH265 {
    param (
        [Parameter(Mandatory)]
        [string]$InputFile
    )

    $BaseName = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
    $Directory = [System.IO.Path]::GetDirectoryName($InputFile)
    $OutputFile = Join-Path $Directory "$BaseName-ffmpeg.mp4"

    ffmpeg -i $InputFile `
           -c:v hevc_nvenc `
           -preset medium `
           -pix_fmt yuv420p `
           -c:a copy `
           $OutputFile
}
Set-Alias convertmp4 Ffmpeg-VideoToH265

# PUT AT THE END
Invoke-Expression (&starship init powershell)
