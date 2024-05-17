set -e

# make sure zsh is installed before continuing
zsh=`command -v zsh`
if [[ "${zsh}x" == "x" ]]; then
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
. install/terminfo.sh
. install/nvim.sh
