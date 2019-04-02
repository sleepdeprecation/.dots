DOTSTUFFDIR=$(realpath $(dirname $(dirname "$0")))

function dklink() {
    if [ "$#" -ne 2 ]; then
        echo "failed: dklink src dest"
        return
    fi

    source="$1"
    dest="$2"


    if [ -h "$dest" ]; then
        if [ ! `readlink "$dest"` -ef "$source" ]; then
            rm -f "$dest"
            ln -s -f "$source" "$dest"
        fi
    else
        if [ -d "$dest" ]; then
            rm -rf "$dest"
        else
            rm -f "$dest"
        fi
        ln -s -f "$source" "$dest"
    fi
}

# link items in home so they're, y'know, actually used
for item in zshrc zsh-lib vim vimrc gvimrc gitconfig tmux.conf; do
    dest="$HOME/.$item"
    source="$DOTSTUFFDIR/$item"
    dklink "$source" "$dest"
done

# make bin dir
if [ ! -d "$HOME/bin" ]; then
    mkdir -p "$HOME/bin"
fi

# link items in bin to bin
for item in $DOTSTUFFDIR/bin/*; do
    bn=$(basename "$item")
    dest="$HOME/bin/$bn"
    dklink "$item" "$dest"
done

# if go is installed, install httpme utility
if [[ `which go > /dev/null; echo $?` == 0 ]]; then
    go build -o "$HOME/bin/httpme" "$DOTSTUFFDIR/gobin/httpme.go"
fi
