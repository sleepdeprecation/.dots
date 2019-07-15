if [[ ${TERM} == 'dumb' ]]; then
    return 1
fi

# Use human-friendly identifiers.
zmodload -F zsh/terminfo +b:echoti +p:terminfo
typeset -gA key_info
key_info=(
  'Control'      '\C-'
  'ControlLeft'  '\e[1;5D \e[5D \e\e[D \eOd \eOD '
  'ControlRight' '\e[1;5C \e[5C \e\e[C \eOc \eOC '
  'Escape'       '\e'
  'Meta'         '\M-'
  'Backspace'    ${terminfo[kbs]}
  'BackTab'      ${terminfo[kcbt]}
  'Left'         ${terminfo[kcub1]}
  'Down'         ${terminfo[kcud1]}
  'Right'        ${terminfo[kcuf1]}
  'Up'           ${terminfo[kcuu1]}
  'Delete'       ${terminfo[kdch1]}
  'End'          ${terminfo[kend]}
  'F1'           ${terminfo[kf1]}
  'F2'           ${terminfo[kf2]}
  'F3'           ${terminfo[kf3]}
  'F4'           ${terminfo[kf4]}
  'F5'           ${terminfo[kf5]}
  'F6'           ${terminfo[kf6]}
  'F7'           ${terminfo[kf7]}
  'F8'           ${terminfo[kf8]}
  'F9'           ${terminfo[kf9]}
  'F10'          ${terminfo[kf10]}
  'F11'          ${terminfo[kf11]}
  'F12'          ${terminfo[kf12]}
  'Home'         ${terminfo[khome]}
  'Insert'       ${terminfo[kich1]}
  'PageDown'     ${terminfo[knp]}
  'PageUp'       ${terminfo[kpp]}
)

bindkey -e

# local key
# for key (${(s: :)key_info[ControlLeft]}) bindkey ${key} backward-word
# for key (${(s: :)key_info[ControlRight]}) bindkey ${key} forward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^r' history-incremental-search-backward

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey ' ' magic-space

bindkey '^[[3~' delete-char

bindkey '^[[4~' end-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
