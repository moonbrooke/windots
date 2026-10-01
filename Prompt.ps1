function prompt {
    $cwd = (Get-Location).Path

    $homePath = $HOME.TrimEnd([char[]]"\/")
    if ($cwd -eq $HOME) {
        $display = "~"
    } elseif ($cwd.StartsWith($homePath + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        $display = "~" + $cwd.Substring($homePath.Length)
    } else {
        $display = $cwd
    }

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

    Write-Host "󰉋" $display -ForegroundColor Cyan -NoNewline
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
    
    $esc = [char]27
    
    return "$esc]9;9;`"$display`"$esc\ "
}
