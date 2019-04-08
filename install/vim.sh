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

# create nvim paths
if [ ! -d $HOME/.local/share ]; then
	mkdir -p $HOME/.local/share/
fi

if [ ! -d $HOME/.config ]; then
	mkdir -p $HOME/.config/
fi

# link nvim
dklink "$DOTSTUFFDIR/nvim/config" "$HOME/.config/nvim"
dklink "$DOTSTUFFDIR/nvim/share" "$HOME/.local/share/nvim"


# ignore updates to plug.vim, because i don't care about tracking it in git
git update-index --assume-unchanged vim/autoload/plug.vim
git update-index --assume-unchanged nvim/share/site/autoload/plug.vim

# install vim plugins
vim +PlugUpgrade +PlugClean +PlugUpdate +PlugInstall +qall
