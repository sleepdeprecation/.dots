# make sure zsh is installed before continuing
zsh=`command -v zsh`
if [ "${zsh}x" = "x" ]; then
	echo "Install zsh before continuing"
	exit 1
fi

# set zsh to your shell
if [ "$SHELL" != "$zsh" ]; then
	# macos only allows you to change shells listed in /etc/shells
	if [[ `uname -s` == "Darwin" && ! `grep $zsh /etc/shells` ]]; then
		echo "Adding $zsh to /etc/shells"
		echo "\n$zsh" | sudo tee -a /etc/shells > /dev/null
	fi

    chsh -s "$zsh"
fi

DOTSTUFFDIR=$PWD

# remove oh-my-zsh if it's installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
fi

. install/relink.sh

# ignore updates to vim/autoload/plug.vim, because i don't care about tracking it in git
git update-index --assume-unchanged vim/autoload/plug.vim

# install vim plugins
vim +PlugUpgrade +PlugClean +PlugUpdate +PlugInstall +qall
