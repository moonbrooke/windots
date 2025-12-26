function prompt {
    $cwd = (Get-Location).Path

    $gitInfo = ""
    $dirty = $false
    $unpushed = $false
    try {
        $gitDir = git rev-parse --show-toplevel 2>$null
        if ($gitDir) {
            $repoName = Split-Path $gitDir -Leaf
            $branch   = git rev-parse --abbrev-ref HEAD 2>$null

            $status = git status --porcelain 2>$null
            if ($status) { $dirty = $true }

            try {
                $ahead = git rev-list "@{u}..HEAD" 2>$null
                if ($ahead) { $unpushed = $true }
            } catch {}

            if ($branch) {
                $gitInfo = "  $branch"
            } else {
                $gitInfo = " 󰊢 $repoName"
            }
        }
    } catch {}

    Write-Host "󰉋" $cwd -ForegroundColor Cyan -NoNewline
    if ($gitInfo) {
        Write-Host $gitInfo -ForegroundColor Magenta -NoNewline
        if ($dirty) {
            Write-Host " [*]" -ForegroundColor Red -NoNewline
        }
        if ($unpushed) {
            Write-Host " [󰁝]" -ForegroundColor Green -NoNewline
        }
        Write-Host ""
    } else {
        Write-Host ""
    }

    Write-Host "$" -ForegroundColor Cyan -NoNewline
    return " "
}
