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

# link items in home so they're, y'know, actually used
for item in zshrc zsh-lib vim vimrc gvimrc gitconfig tmux.conf; do
	dest="$HOME/.$item"
	source="$DOTSTUFFDIR/$item"

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
done

# make bin dir
if [ ! -d "$HOME/bin" ]; then
    mkdir -p "$HOME/bin"
fi

# link items in bin to bin
for item in "$DOTSTUFFDIR/bin/*"; do
    bn=$(basename "$item")
    ln -s "$item" "$HOME/bin/$bn"
done

# if go is installed, install httpme utility
if [[ `which go > /dev/null; echo $?` == 0 ]]; then
	go build -o "$HOME/bin/httpme" "$DOTSTUFFDIR/gobin/httpme.go"
fi

# ignore updates to vim/autoload/plug.vim, because i don't care about tracking it in git
git update-index --assume-unchanged vim/autoload/plug.vim

# install vim plugins
vim +PlugUpgrade +PlugClean +PlugUpdate +PlugInstall +qall
