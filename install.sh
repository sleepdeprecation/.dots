# grab oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

git clone https://github.com/VundleVim/Vundle.vim.git $PWD/vim/vim/bundle/Vundle.vim

ln -s -f $(pwd)/zsh/zshrc ~/.zshrc
ln -s -f $(pwd)/vim/vim ~/.vim
ln -s -f $(pwd)/vim/vimrc ~/.vimrc
ln -s -f $(pwd)/vim/gvimrc ~/.gvimrc
ln -s -f $(pwd)/bash/bash_colors ~/.bash_colors
ln -s -f $(pwd)/bash/bashrc ~/.bashrc
ln -s -f $(pwd)/git/gitconfig ~/.gitconfig
ln -s -f $(pwd)/tmux.conf ~/.tmux.conf

chsh -s `which zsh`
