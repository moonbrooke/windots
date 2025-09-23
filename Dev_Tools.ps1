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

function gs {
    git status
}

function gaa {
    git add *
}

function gp {
    git push
}

