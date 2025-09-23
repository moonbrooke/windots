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

function Ffmpeg-VideoToH265 {
    param (
        [Parameter(Mandatory)]
        [string]$InputFile,
        [string]$MinBitrate = "8000k",
        [string]$MaxBitrate = "12000k"
    )

    $BaseName = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
    $Directory = [System.IO.Path]::GetDirectoryName($InputFile)
    $OutputFile = Join-Path $Directory "$BaseName-ffmpeg.mp4"

    ffmpeg -i $InputFile `
           -c:v hevc_nvenc `
           -preset p5 `
           -pix_fmt yuv420p `
           -b:v $MinBitrate `
           -maxrate $MaxBitrate `
           -c:a aac `
           $OutputFile
}

function Ffmpeg-ExtractAudio {
    param (
        [Parameter(Mandatory)]
        [string]$InputFile
    )

    $BaseName = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
    $Directory = [System.IO.Path]::GetDirectoryName($InputFile)
    $OutputFile = Join-Path $Directory "$BaseName-ffmpeg.mp3"

    ffmpeg -i $InputFile -vn -acodec copy $OutputFile
}

Set-Alias convertmp3 Ffmpeg-AudioToMP3
Set-Alias convertmp4 Ffmpeg-VideoToH265
Set-Alias extractmp3 Ffmpeg-ExtractAudio
