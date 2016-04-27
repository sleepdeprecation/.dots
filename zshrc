ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dkuntz"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

plugins=(git ruby sublime github gem pip python rake git-extras osx)
source $ZSH/oh-my-zsh.sh

# set some variables?
export EDITOR="vim"
export LESS="-R"
export GOPATH=~/go

OS=`uname -s`
if [[ $OS == "Darwin" ]]; then
	export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	export LANG=en_US.UTF-8
fi

export PATH=$HOME/bin:/usr/local/sbin:$PATH:$GOPATH/bin

# sudo aliases
alias _="sudo"
alias pacman='sudo pacman'
alias apt-get='sudo apt-get'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown'
alias systemctl='sudo systemctl'

alias susu='sudo su -'

# other aliases
alias more='less'
alias vba='VisualBoyAdvance'

alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"

alias be="bundle exec"


# color aliases
if [[ $OS == "Darwin" ]]; then
	if [ -x /usr/local/bin/gls ]; then
		alias ls='gls -pFN --color=auto'
	else
		alias ls='ls -pFG'
	fi
elif [[ $OS == "Linux" ]]; then
	alias ls='ls -pFN --color=auto';
fi

alias grep='grep --color=auto'

# ls stuff
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias httpme='python3 -m http.server'

# tmux stuffs
tmux-join() {
  tmux -S /tmp/$1 new-session -t $1
}
alias tmuxjoin='tmux-join'

tmux-list() {
  ps ax -o ruser,command | grep '[n]ew-session -s' | ruby -ne '$_ =~ /^(\w+).*-s (\w+)/; puts "#{$1} started #{$2}"'
}
alias tmuxlist='tmux-list'

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


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -f ~/.aliases ]; then
	source ~/.aliases
fi
