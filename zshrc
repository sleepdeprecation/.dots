OS=`uname -s`

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

PATH=""
eval `/usr/libexec/path_helper -s`

# Will make adjustments to PATH, do it first
if [[ -d ~/.cargo ]]; then
    source ~/.cargo/env
fi

if (( $+commands[python3] )); then
    local userbase=$(python3 -c 'import site; print(site.USER_BASE)')
    export PATH="$userbase/bin:$PATH"
fi

if [[ $OS == "Darwin" ]]; then
    # # add coreutils ahead of bin if installed with homebrew
    # if [[ -d /usr/local/opt/coreutils ]]; then
    #     export PATH="/usr/local/opt/coreutils/libexec/gnubin"
    # fi

    # add homebrew m1 bin path
    if [[ -d /opt/homebrew/bin ]]; then
        export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    fi

    # add brew-installed ruby to path, before base path
    if [[ -d /usr/local/opt/ruby ]]; then
        export PATH="/usr/local/opt/ruby/bin:$PATH"
    elif [[ -d /opt/homebrew/opt/ruby/bin ]]; then
      export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    fi

    if [[ -d /Applications/Postgres.app/Contents/Versions/latest/bin ]]; then
        export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
    fi
fi

# add GOPATH/bin to path, if it exists
if [[ "${GOPATH}x" != "x" ]]; then
  if [[ -d "${GOPATH}/bin" ]]; then
    export PATH="$PATH:$GOPATH/bin"
  fi
fi

# add rancher desktop to path
if [[ -d "$HOME/.rd/bin" ]]; then
  export PATH="$PATH:$HOME/.rd/bin"
fi

export PATH="$HOME/bin:$PATH"

if [[ -d $HOME/.zsh-lib ]]; then
    for config_file ($HOME/.zsh-lib/*.zsh); do
        source $config_file
    done

    unset config_file
fi

alias pacman='sudo pacman'
alias apt-get='sudo apt-get'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown'
alias systemctl='sudo systemctl'

alias be="bundle exec"


# color aliases
if [[ $OS == "Darwin" ]]; then
    local lsbin=$commands[ls]
    if [[ $lsbin == /usr/local/opt/coreutils/libexec/gnubin/ls ]]; then
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

if [ -f ~/.local_profile ]; then
    source ~/.local_profile
fi

# gcloud stuff
if [ -f "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc"; fi

# added by travis gem
if [ -f "$HOME/.travis/travis.sh" ]; then source "$HOME/.travis/travis.sh"; fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
