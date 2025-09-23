# Simple System Info Fetch
$os = Get-CimInstance Win32_OperatingSystem
$user = $env:USERNAME
$hostname = $env:COMPUTERNAME
$uptime = ((Get-Date) - $os.LastBootUpTime).ToString("dd\.hh\:mm\:ss")

$cpu = Get-CimInstance Win32_Processor
$cpuUsage = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
$cpuUsage = [math]::Round($cpuUsage, 2)
$gpus = Get-CimInstance Win32_VideoController

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
foreach ($gpu in $gpus) {
    $name = $gpu.Name
    $vram = [math]::Round($gpu.AdapterRAM / 1GB, 2)
    Write-Host "   - $name ($vram GB)"
}
Write-Host "📦 RAM:         $usedRAM GB / $totalRAM GB"
Write-Host "⏱️ Uptime:      $uptime"
Write-Host "===============================" -ForegroundColor Cyan

