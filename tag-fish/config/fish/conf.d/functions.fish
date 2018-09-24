# Create a new directory and enter it
function mkd
    mkdir -p "$argv"; and cd "$argv"
end

# find shorthand
function f
    find . -name "$1" 2>&1 | grep -v 'Permission denied'
end

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v
    if test (count $argv) -eq 0
        vim .
    else
        vim $argv
    end;
end

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first.
function tre
    tree -aC -I '.git' --dirsfirst "$argv" | less -RNX
end

# Create useful .gitignore files for your project
function gi
    curl -L -s https://www.gitignore.io/api/$argv
end

# CSV Viewer
function csv
    column -s, -t < $argv | less -#2 -N -S
end
