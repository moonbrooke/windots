# scoop
function scu {
    param([string]$query = "")
    scoop update $query
}

function scs {
    param([string]$query)
    scoop search $query
}

function sci {
    param([string]$query)
    scoop install $query
}

function scun {
    param([string]$query)
    scoop uninstall $query
}

function scc {
    scoop cache
}

function sccr {
    scoop cache rm *
}

function scl {
    scoop list
}

function scst {
    scoop status
}

function scin {
    param([string]$query)
    scoop info $query
}

function sccu {
    param([string]$query)
    scoop cleanup $query
}

function scwh {
    param([string]$query)
    scoop which $query
}

function scd {
    param([string]$query)
    scoop depends $query
}

