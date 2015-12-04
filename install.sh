DOTSTUFFDIR=$PWD

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    cd ~/.oh-my-zsh
    git pull
    cd $DOTSTUFFDIR
fi

if [ ! -d "$PWD/vim/vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $PWD/vim/vim/bundle/Vundle.vim
else
    cd $PWD/vim/vim/bundle/Vundle.vim
    git pull
    cd $DOTSTUFFDIR
fi

# overwrite anyways.
ln -s -f $(pwd)/zsh/zshrc ~/.zshrc
ln -s -f $(pwd)/vim/vim ~/.vim
ln -s -f $(pwd)/vim/vimrc ~/.vimrc
ln -s -f $(pwd)/vim/gvimrc ~/.gvimrc
ln -s -f $(pwd)/bash/bash_colors ~/.bash_colors
ln -s -f $(pwd)/bash/bashrc ~/.bashrc
ln -s -f $(pwd)/git/gitconfig ~/.gitconfig
ln -s -f $(pwd)/tmux.conf ~/.tmux.conf
ln -s -f $(pwd)/zsh/dkuntz.zsh-theme ~/.oh-my-zsh/themes/dkuntz.zsh-theme

# install vim plugins
vim +PluginClean +PluginInstall +qall

if [ $SHELL != `which zsh` ]; then
    echo "chsh"
    chsh -s `which zsh`
fi
