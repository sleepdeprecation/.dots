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

PROMPT='%{$fg[cyan]%}$USER@$HOST%{$reset_color%} | %{$fg[green]%}%~ $(_prompt_git_ref)%{$fg[red]%}%(!.#.»)%{$reset_color%} '
# RPS1='%{$fg[blue]%}%~ %{$reset_color%} ${return_code}'
