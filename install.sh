DOTSTUFFDIR=$PWD

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    cd ~/.oh-my-zsh
    git pull
    cd $DOTSTUFFDIR
fi

# overwrite anyways.
for item in zshrc vim vimrc gvimrc gitconfig tmux.conf; do
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
