function .. {
    cd ..
}

# EZA
# NOTE: the profile's coreutils hook rewrites interactive `ls` to coreutils
# ls.cmd before alias resolution, so this alias is shadowed at the prompt.
# `ll` (below) is not a coreutils name and always resolves to eza.
function ezadf {
    eza --group-directories-first
}
Set-Alias ls ezadf

function ezalldf {
    eza -la --group-directories-first
}
Set-Alias ll ezalldf

# Delete directory
function Remove-FolderForce {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    Remove-Item $Path -Recurse -Force
}
Set-Alias rmdir Remove-FolderForce

# Which command
# function which {
#     param (
#         [Parameter(Mandatory = $true)]
#         [string]$Bin
#     )
#     where.exe "$Bin"
# }

function ff {
    fastfetch
}

