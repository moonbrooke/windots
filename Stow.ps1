param (
    [Parameter(Mandatory = $true)]
    [string]$Name
)

# Define the folder where your .bat files live
$batFolder = Get-Location
$batFile = Join-Path $batFolder "$Name.bat"

# Check if exists and run
if (Test-Path $batFile) {
    Write-Host "🔗 Linking via $Name.bat..." -ForegroundColor Cyan
    & $batFile
} else {
    Write-Host "🚫 No such bat file: $Name.bat" -ForegroundColor Red
}
