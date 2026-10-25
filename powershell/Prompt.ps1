function prompt {
    $loc = Get-Location
    $cwd = $loc.Path

    $homePath = $HOME.TrimEnd([char[]]"\/")
    if ($cwd -eq $HOME) {
        $display = "~"
    } elseif ($cwd.StartsWith($homePath + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        $display = "~" + $cwd.Substring($homePath.Length)
    } else {
        $display = $cwd
    }

    $gitInfo = ""
    $staged = $false
    $unstaged = $false
    $unpushed = $false
    try {
        # A single `git status --porcelain=v2 --branch` replaces the previous
        # four `git` calls (rev-parse, rev-parse, status, rev-list).
        $status = git status --porcelain=v2 --branch 2>$null
        if ($status) {
            $branch = ""
            foreach ($line in $status) {
                if ($line.StartsWith('# branch.head ')) {
                    $branch = $line.Substring('# branch.head '.Length).Trim()
                } elseif ($line.StartsWith('# branch.ab ')) {
                    if ($line -notmatch '\+0\b') { $unpushed = $true }
                } elseif ($line.StartsWith('?')) {
                    # Untracked files count as unstaged work.
                    $unstaged = $true
                } elseif ($line -match '^[12u] (.)(.)') {
                    # Porcelain v2: X is the staged state, Y the worktree state.
                    if ($Matches[1] -ne '.') { $staged = $true }
                    if ($Matches[2] -ne '.') { $unstaged = $true }
                }
            }
            # `rev-parse --abbrev-ref` reports "HEAD" when detached; keep that
            # wording rather than porcelain's "(detached)" token.
            if ($branch -eq '(detached)') { $branch = 'HEAD' }
            if ($branch) {
                $gitInfo = "  $branch"
            }
        }
    } catch {}

    Write-Host "󰉋" $display -ForegroundColor Cyan -NoNewline
    if ($gitInfo) {
        Write-Host $gitInfo -ForegroundColor Magenta -NoNewline
        if (!$unstaged -and !$staged -and !$unpushed) {
            Write-Host " 󰄬" -ForegroundColor Green -NoNewline
        }
        if ($unstaged) {
            Write-Host " [*]" -ForegroundColor Red -NoNewline
        }
        if ($staged) {
            Write-Host " [*]" -ForegroundColor Yellow -NoNewline
        }
        if ($unpushed) {
            Write-Host " [󰁝]" -ForegroundColor Green -NoNewline
        }
    }
    Write-Host ""

    Write-Host "$" -ForegroundColor Cyan -NoNewline

    $esc = [char]27

    # OSC 9;9 tells Windows Terminal the current directory (used for
    # duplicate tab/pane). It must be an absolute path - never the
    # "~"-abbreviated $display, otherwise Terminal tries to open a
    # literal "~\.config" directory and fails with 0x8007010b.
    if ($loc.Provider.Name -eq 'FileSystem') {
        $oscPath = $loc.ProviderPath
        return "$esc]9;9;`"$oscPath`"$esc\ "
    }
    return " "
}
