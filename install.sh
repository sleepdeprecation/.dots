DOTSTUFFDIR=$PWD

if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf $HOME/.oh-my-zsh
fi

# overwrite anyways.
for item in zshrc zsh_lib vim vimrc gvimrc gitconfig tmux.conf; do
	ln -s -f $DOTSTUFFDIR/$item ~/.$item
done

# install vim plugins
vim +PlugUpgrade +PlugClean +PlugUpgrade +PlugInstall +qall

if [ $SHELL != `which zsh` ]; then
    echo "chsh"
    chsh -s `which zsh`
fi

if [ -f ~/.aliases ]; then
	mv ~/.aliases ~/.local_profile
fi
