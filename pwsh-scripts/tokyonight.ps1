<#
.SYNOPSIS
    Prints the Tokyo Night color palette as ANSI truecolor swatches.
#>

$colors = @(
    '#f7768e'
    '#ff9e64'
    '#e0af68'
    '#cfc9c2'
    '#9ece6a'
    '#73daca'
    '#b4f9f8'
    '#2ac3de'
    '#7dcfff'
    '#7aa2f7'
    '#bb9af7'
    '#c0caf5'
    '#a9b1d6'
    '#9aa5ce'
    '#565f89'
    '#414868'
    '#24283b'
    '#1a1b26'
)

$esc = [char]27

function ConvertTo-Rgb([string]$Hex) {
    $hexValue = $Hex.TrimStart('#')
    $r = [Convert]::ToInt32($hexValue.Substring(0, 2), 16)
    $g = [Convert]::ToInt32($hexValue.Substring(2, 2), 16)
    $b = [Convert]::ToInt32($hexValue.Substring(4, 2), 16)
    "$r;$g;$b"
}

foreach ($hex in $colors) {
    $rgb = ConvertTo-Rgb $hex
    Write-Host ("{0}[48;2;{1}m      {0}[0m {2}" -f $esc, $rgb, $hex)
}
