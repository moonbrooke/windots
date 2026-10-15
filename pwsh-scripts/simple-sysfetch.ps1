# Simple System Info Fetch

# Enumerate display adapters straight from the registry. This is faster (~20 ms)
# and far more reliable than Win32_VideoController, whose WMI provider can take
# >1 s on some systems. VRAM comes from the driver's QWORD for discrete GPUs;
# integrated GPUs expose no dedicated value, so it is omitted.
function Get-GpuInfo {
    $classKey = 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}'

    Get-ChildItem $classKey -ErrorAction SilentlyContinue |
        Where-Object { $_.PSChildName -match '^\d{4}$' } |
        ForEach-Object {
            $entry = Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue
            if ($entry.DriverDesc) {
                [pscustomobject]@{
                    Name        = $entry.DriverDesc
                    MemoryBytes = [int64]$entry.'HardwareInformation.qwMemorySize'
                }
            }
        }
}

$os = Get-CimInstance Win32_OperatingSystem -Property Caption, OSArchitecture, LastBootUpTime, TotalVisibleMemorySize, FreePhysicalMemory
$user = $env:USERNAME
$hostname = $env:COMPUTERNAME
$uptime = ((Get-Date) - $os.LastBootUpTime).ToString("dd\.hh\:mm\:ss")

$cpu = Get-CimInstance Win32_Processor -Property Name
# Formatted perf data is ready immediately - no sampling interval needed
# (Get-Counter had to wait ~1 s between samples for an accurate value).
$cpuUsage = (Get-CimInstance Win32_PerfFormattedData_PerfOS_Processor -Filter "Name='_Total'").PercentProcessorTime

$totalRAM = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeRAM = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$usedRAM = [math]::Round($totalRAM - $freeRAM, 2)

Write-Host "`n===============================" -ForegroundColor Cyan
Write-Host "     💻 System Info Fetch      " -ForegroundColor Magenta
Write-Host "===============================" -ForegroundColor Cyan
Write-Host "👤 User:        $user"
Write-Host "🖥️ Hostname:    $hostname"
Write-Host "🪟 OS:          $($os.Caption) ($($os.OSArchitecture))"
Write-Host "🧠 CPU:         $($cpu.Name) ($cpuUsage%)"
Write-Host "🎮 GPU(s):"
foreach ($gpu in Get-GpuInfo) {
    if ($gpu.MemoryBytes) {
        $vram = [math]::Round($gpu.MemoryBytes / 1GB, 2)
        Write-Host "   - $($gpu.Name) ($vram GB)"
    } else {
        Write-Host "   - $($gpu.Name)"
    }
}
Write-Host "📦 RAM:         $usedRAM GB / $totalRAM GB"
Write-Host "⏱️ Uptime:      $uptime"
Write-Host "===============================" -ForegroundColor Cyan

