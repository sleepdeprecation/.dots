if [[ -d $HOME/.zsh_lib ]]; then
	for config_file ($HOME/.zsh_lib/*.zsh); do
		source $config_file
	done
fi

export EDITOR="vim"
export LESS="-RFX"
export PAGER="less"
export GOPATH=~/go

OS=`uname -s`
if [[ $OS == "Darwin" ]]; then
	if [[ -d /usr/local/opt/coreutils ]]; then
		export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
	fi
	export LANG=en_US.UTF-8
fi

if [[ -d /usr/local/heroku ]]; then
	export PATH="/usr/local/heroku/bin:$PATH"
fi

export PATH=$HOME/bin:/usr/local/sbin:$PATH:$GOPATH/bin

alias pacman='sudo pacman'
alias apt-get='sudo apt-get'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown'
alias systemctl='sudo systemctl'

alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"

alias be="bundle exec"


# color aliases
if [[ $OS == "Darwin" ]]; then
	if [[ -x /usr/local/opt/coreutils/libexec/gnubin/ls ]]; then
		alias ls='ls -pFN --color=auto'
	else
		alias ls='ls -pFG'
	fi
elif [[ $OS == "Linux" ]]; then
	alias ls='ls -pFN --color=auto';
fi

alias grep='grep --color=auto --exclude-dir=.git --exclude-dir=.hg'

if [[ -x /usr/local/bin/python3 || -x /usr/bin/python3 ]]; then
	alias httpme='python3 -m http.server'
elif [[ -x /usr/local/bin/python2 || -x /usr/bin/python2 ]]; then
	alias httpme='python2 -m SimpleHTTPServer'
fi

if [[ -d ~/.cargo ]]; then
	# for rustup
	source ~/.cargo/env
fi

if [ -f ~/.local_profile ]; then
	source ~/.local_profile
fi
