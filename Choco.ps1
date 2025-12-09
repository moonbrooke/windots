# scoop
function ccu {
    choco outdated
}

function ccf {
    param([string]$query)
    choco find $query
}

function cci {
    param([string]$query)
    choco install $query
}

function ccun {
    param([string]$query)
    choco uninstall $query
}

function ccup {
    param([string]$query)
    choco upgrade $query
}

function ccl {
    choco list
}

function ccin {
    param([string]$query)
    choco info $query
}

function cccl {
    choco cache list
}

function cccr {
    choco cache remove
}

function cccrx {
    choco cache remove --expired
}
