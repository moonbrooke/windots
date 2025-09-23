# YT-DLP
function Youtube-Mp3 {
    param (
        [Parameter(Mandatory)]
        [string]$Url
    )

    yt-dlp -f bestaudio `
           --extract-audio `
           --audio-format mp3 `
           -o "$HOME/Downloads/Music/%(title)s.%(ext)s" `
           $Url
}

function Youtube-Best {
    param (
        [Parameter(Mandatory)]
        [string]$Url
    )

    yt-dlp -o "$HOME/Downloads/Video/%(title)s-best.%(ext)s" $Url
}

function Youtube-1080p {
    param (
        [Parameter(Mandatory)]
        [string]$Url
    )

    yt-dlp -S "height:1080" `
           -o "$HOME/Downloads/Video/%(title)s-1080p.%(ext)s" `
           $Url
}

function Youtube-720p {
    param (
        [Parameter(Mandatory)]
        [string]$Url
    )

    yt-dlp -S "height:720" `
           -o "$HOME/Downloads/Video/%(title)s-720p.%(ext)s" `
           $Url
}

function Youtube-480p {
    param (
        [Parameter(Mandatory)]
        [string]$Url
    )

    yt-dlp -S "height:480" `
           -o "$HOME/Downloads/Video/%(title)s-480p.%(ext)s" `
           $Url
}

Set-Alias ytmp3 Youtube-Mp3
Set-Alias ytbest Youtube-Best
Set-Alias yt1080 Youtube-1080p
Set-Alias yt720 Youtube-720p
Set-Alias yt480 Youtube-480p
