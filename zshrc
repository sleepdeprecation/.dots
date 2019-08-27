OS=`uname -s`
if [[ -d $HOME/.zsh-lib ]]; then
    for config_file ($HOME/.zsh-lib/*.zsh); do
        source $config_file
    done

    unset config_file
fi

nvim=`command -v nvim`
if [[ "${nvim}x" != "x" ]]; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi
export LESS="-RFX"
export PAGER="less"
export GOPATH=~/go

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Will make adjustments to PATH, do it first
if [[ -d ~/.cargo ]]; then
# for rustup
    source ~/.cargo/env
fi

if (( $+commands[python3] )); then
    local userbase=$(python3 -c 'import site; print(site.USER_BASE)')
    export PATH="$userbase/bin:$PATH"
fi

if [[ $OS == "Darwin" ]]; then
    # add coreutils ahead of bin if installed with homebrew
    if [[ -d /usr/local/opt/coreutils ]]; then
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    fi

    # add brew-installed ruby to path
    if [[ -d /usr/local/opt/ruby ]]; then
        export PATH="/usr/local/opt/ruby/bin:$PATH"
    fi

    if [[ -d /Applications/Postgres.app/Contents/Versions/latest/bin ]]; then
        export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
    fi
fi

export PATH="$HOME/bin:/usr/local/sbin:$PATH"

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

# enable kubectl completion
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

if [ -f ~/.local_profile ]; then
    source ~/.local_profile
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc"; fi

# added by travis gem
[ -f /Users/dkuntz/.travis/travis.sh ] && source /Users/dkuntz/.travis/travis.sh

#export GPG_TTY=$(tty)
