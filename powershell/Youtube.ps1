# YT-DLP
function Youtube-Download {
    param (
        [Parameter(Mandatory)]
        [string]$Url,

        [ValidateSet('mp3', 'best', '1080', '720', '480')]
        [string]$Quality = 'best'
    )

    $common = @('--cookies-from-browser', 'firefox', '--js-runtimes', 'node')

    switch ($Quality) {
        'mp3' {
            yt-dlp -f bestaudio --extract-audio --audio-format mp3 `
                   -o "$HOME/Downloads/Music/%(title)s.%(ext)s" `
                   @common $Url
        }
        'best' {
            yt-dlp -o "$HOME/Downloads/Video/%(title)s-best.%(ext)s" @common $Url
        }
        default {
            yt-dlp -S "height:$Quality" `
                   -o "$HOME/Downloads/Video/%(title)s-${Quality}p.%(ext)s" `
                   @common $Url
        }
    }
}

function Youtube-Mp3 {
    param([Parameter(Mandatory)][string]$Url)
    Youtube-Download -Url $Url -Quality mp3
}

function Youtube-Best {
    param([Parameter(Mandatory)][string]$Url)
    Youtube-Download -Url $Url -Quality best
}

function Youtube-1080p {
    param([Parameter(Mandatory)][string]$Url)
    Youtube-Download -Url $Url -Quality 1080
}

function Youtube-720p {
    param([Parameter(Mandatory)][string]$Url)
    Youtube-Download -Url $Url -Quality 720
}

function Youtube-480p {
    param([Parameter(Mandatory)][string]$Url)
    Youtube-Download -Url $Url -Quality 480
}

Set-Alias ytmp3 Youtube-Mp3
Set-Alias ytbest Youtube-Best
Set-Alias yt1080 Youtube-1080p
Set-Alias yt720 Youtube-720p
Set-Alias yt480 Youtube-480p
