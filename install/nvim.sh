. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

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

# install plugins
nvim --headless "+Lazy! sync" +qa
