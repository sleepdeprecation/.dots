autoload -U compaudit compinit
compinit

# menu_complete - auto insert first option on tab
# auto_menu     - leave blank on first tab
# setopt menu_complete
setopt auto_menu

setopt complete_in_word
setopt always_to_end
setopt complete_aliases

# keep slash at end of autocomplete directory name
setopt auto_param_slash

setopt list_packed
setopt list_rows_first

# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

fpath=(/usr/local/share/zsh-completions $fpath)
