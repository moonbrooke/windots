# go
function gocc {
    go clean -cache
}

function gocm {
    go clean -modcache
}

# git
function cdgit {
    cd "$env:GITHUB"
}

function windots {
    cd "$env:WINDOTS"
}

function cdnvim {
    cd "$env:LOCALAPPDATA/nvim"
}

function gs {
    git status
}

function ga {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    git add "$Path"
}

function gaa {
    git add *
}

function gpsh {
    git push
}

function gcms {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message
    )
    git commit -m "$Message"
}

function gsmu {
    git pull --recurse-submodules
    git submodule update --remote --merge
}

# Other dev tools
Set-Alias cat bat
