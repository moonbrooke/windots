# scoop
function scu {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    scoop update $query
}

function scs {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    scoop search $query
}

function sci {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    scoop install $query
}

function scun {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
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
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    scoop info $query
}

function sccu {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    scoop cleanup $query
}

function scwh {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    scoop which $query
}

function scd {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    scoop depends $query
}

