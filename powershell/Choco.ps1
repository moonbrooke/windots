# choco
function ccu {
    choco outdated
}

function ccf {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    choco find $query
}

function ccs {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    choco search $query
}

function cci {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    choco install $query
}

function ccun {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    choco uninstall $query
}

function ccup {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
    choco upgrade $query
}

function ccl {
    choco list
}

function ccin {
    param([Parameter(ValueFromRemainingArguments)][string[]]$query = @())
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
