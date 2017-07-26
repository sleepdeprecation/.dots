OS=`uname -s`
if [[ -d $HOME/.zsh_lib ]]; then
	for config_file ($HOME/.zsh_lib/*.zsh); do
		source $config_file
	done

	unset config_file
fi

export EDITOR="vim"
export LESS="-RFX"
export PAGER="less"
export GOPATH=~/go

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ $OS == "Darwin" ]]; then
	if [[ -d /usr/local/opt/coreutils ]]; then
		export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
	fi

	if [[ -d /Applications/Postgres.app/Contents/Versions/latest/bin ]]; then
		export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
	fi
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
	alias pyhttpme='python3 -m http.server'
elif [[ -x /usr/local/bin/python2 || -x /usr/bin/python2 ]]; then
	alias pyhttpme='python2 -m SimpleHTTPServer'
fi

if [[ -d ~/.cargo ]]; then
	# for rustup
	source ~/.cargo/env
fi

if [ -f ~/.local_profile ]; then
	source ~/.local_profile
fi
