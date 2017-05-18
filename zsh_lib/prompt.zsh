autoload -U colors && colors
setopt prompt_subst

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function _prompt_git_ref() {
	local ref
	ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
		ref=$(command git rev-pase --short HEAD 2> /dev/null) || return 0

	echo "%{$fg[blue]%}:: %{$fg[yellow]%}(${ref#refs/heads/}$(_prompt_git_dirty))%{$reset_color%} "
}

function _prompt_git_dirty() {
	if [[ -n $(command git status --porcelain 2> /dev/null | tail -n1) ]]; then
		echo "%{$fg[red]%}*%{$fg[yellow]%}"
	fi
}

local bright_yellow=$'\e[93m'
local short_host=`echo $HOST | cut -d. -f1`
local me=`whoami`

PROMPT='%{$fg[blue]%}$me%{$fg[cyan]%}@$short_host%{$reset_color%} | %{$bright_yellow%}%~ $(_prompt_git_ref)%{$fg[red]%}%(!.#.»)%{$reset_color%} '
# RPS1='%{$fg[blue]%}%~ %{$reset_color%} ${return_code}'
