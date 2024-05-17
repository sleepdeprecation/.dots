. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

# ignore updates to plug.vim, because i don't care about tracking it in git
git update-index --assume-unchanged vim/autoload/plug.vim

# install vim plugins
vim +PlugUpgrade +PlugClean +PlugUpdate +PlugInstall +qall
