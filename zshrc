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
	if [ -f /usr/local/bin/brew ]; then
		export PATH=$(brew --prefix coreutils)/libexec:$PATH
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
	if [[ -x /usr/local/bin/gls ]]; then
		alias ls='gls -pFN --color=auto'
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

# tmux stuffs
tmux-join() {
  tmux -S /tmp/$1 new-session -t $1
}
alias tmuxjoin='tmux-join'
alias tmj='tmux-join'

tmux-list() {
  ps ax -o ruser,command | grep '[n]ew-session -s' | ruby -ne '$_ =~ /^(\w+).*-s (\w+)/; puts "#{$1} started #{$2}"'
}
alias tmuxlist='tmux-list'
alias tml='tmux-list'

tmux-start() {
  if [[ ! -z $1 ]]; then
		SESSION_NAME=$1
	else
		SESSION_NAME=`basename $PWD`
	fi
  tmux -S /tmp/$SESSION_NAME new-session -s $SESSION_NAME -d
  chmod 777 /tmp/$SESSION_NAME
  tmux -S /tmp/$SESSION_NAME attach -t $SESSION_NAME
}
alias tmuxstart='tmux-start'
alias tms='tmux-start'

if [ -f ~/.local_profile ]; then
	source ~/.local_profile
fi
