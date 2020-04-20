function reload --description "Reload fish shell"
    if contains -- -f $argv
      set -e __initialized
    end
    source ~/.config/fish/config.fish
end

function fcd --description "Fuzzy change directory"  
    if set -q argv[1]
        set searchdir $argv[1]
    else
        # set searchdir $HOME
        set searchdir .
    end

    # https://github.com/fish-shell/fish-shell/issues/1362
    set -l tmpfile (mktemp)
    find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf > $tmpfile
    set -l destdir (cat $tmpfile)
    rm -f $tmpfile

    if test -z "$destdir"
        return 1
    end

    cd $destdir
end
