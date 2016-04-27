DOTSTUFFDIR=$PWD

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    cd ~/.oh-my-zsh
    git pull
    cd $DOTSTUFFDIR
fi

# overwrite anyways.
ln -s -f $(pwd)/zshrc ~/.zshrc
ln -s -f $(pwd)/vim ~/.vim
ln -s -f $(pwd)/vimrc ~/.vimrc
ln -s -f $(pwd)/gvimrc ~/.gvimrc
ln -s -f $(pwd)/gitconfig ~/.gitconfig
ln -s -f $(pwd)/tmux.conf ~/.tmux.conf
ln -s -f $(pwd)/dkuntz.zsh-theme ~/.oh-my-zsh/themes/dkuntz.zsh-theme

# install vim plugins
vim +PlugClean +PlugInstall +qall

if [ $SHELL != `which zsh` ]; then
    echo "chsh"
    chsh -s `which zsh`
fi
