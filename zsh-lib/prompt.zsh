autoload -U colors && colors
autoload -U add-zsh-hook
setopt PROMPT_SUBST

local light="242"
local sep="%F{$light}•%f"

# terraform variables
local _prompt_has_terraform=false # change based on dir

local _prompt_terraform_command="terraform"
if command -v tf-12 >/dev/null; then
    _prompt_terraform_command="tf-12"
fi

# git variabless
local _prompt_has_git=false

function _prompt_uses_git() {
   if  [ -d .git ] || command git rev-parse --git-dir > /dev/null 2>&1; then
       _prompt_has_git=true
   else
       _prompt_has_git=false
   fi
}

function _prompt_git() {

    if [[ $_prompt_has_git == false ]]; then
        return 0
    fi

    local ref
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(command git rev-pase --short HEAD 2> /dev/null) || return 0

    echo "%F{246}$(_prompt_git_remote)${ref#refs/heads/}%f $sep $(_prompt_git_status)"
}

function _prompt_git_status() {
    if [[ -n $(command git status --porcelain 2> /dev/null | tail -n1) ]]; then
        echo "%F{124}⬡ %f"
    else
        echo "%F{70}⬢ %f"
    fi
}

function _prompt_git_remote() {
    local_commit="$(git rev-parse "@" 2> /dev/null)"
    remote_commit="$(git rev-parse "@{u}" 2> /dev/null)"

    if [[ $local_commit == "@" || $local_commit == $remote_commit ]]; then
        echo -n ""
        return
    fi

    common_base="$(git merge-base "@" "@{u}" 2> /dev/null)"
    if [[ $common_base == $remote_commit ]]; then
        echo -n "⇡ "
    elif [[ $common_base == $local_commit ]]; then
        echo -n "⇣ "
    else
        echo -n "⇡⇣ "
    fi
}

function _prompt_virtualenv() {
    if [[ "${VIRTUAL_ENV}x" == "x" ]]; then
        echo -n ""
        return
    fi

    local actual_base base
    actual_base=$(basename "$VIRTUAL_ENV")
    if [[ "$actual_base" == "env" || "$actual_base" == "venv" ]]; then
        base=$(basename $(dirname "$VIRTUAL_ENV"))
    else
        base="$actual_base"
    fi

    echo -n "%F{$light}py:%F{114}${base}"
}

function _prompt_uses_terraform() {
    if [[ ! -d .terraform ]]; then
        _prompt_has_terraform=false
    else
        _prompt_has_terraform=true
    fi
}

function _prompt_terraform_workspace() {
    if [[ ! $_prompt_has_terraform == true ]]; then
        echo -n ""
        return 0
    fi

    local workspace

    if ! command -v $_prompt_terraform_command >/dev/null; then
        return 0
    fi
    workspace=$($_prompt_terraform_command workspace show)

    echo -n "%F{$light}tf:%F{068}$workspace"
}

function _prompt_status() {
    local git_prompt venv_prompt tf_prompt
    git_prompt=$(_prompt_git)
    venv_prompt=$(_prompt_virtualenv)
    tf_prompt=$(_prompt_terraform_workspace)

    if [[ $venv_prompt != "" ]]; then
        echo -n "${venv_prompt}"
        if [[ $git_prompt != "" || $tf_prompt != "" ]]; then
            echo -n " $sep "
        fi
    fi

    if [[ $tf_prompt != "" ]]; then
        echo -n "${tf_prompt}"
        if [[ $git_prompt != "" ]]; then
            echo -n " $sep "
        fi
    fi

    if [[ $git_prompt != "" ]]; then
        echo -n "${git_prompt}"
    fi
}

function _prompt_chdir() {
    _prompt_uses_terraform
    _prompt_uses_git
}

function _prompt() {
    local prompt_prefix
    prompt_prefix="%(?.%F{green}▲%f.%F{red}△%f)"
    echo -n "\n $prompt_prefix %F{blue}$me%F{cyan}@$short_host%f"
    local status_prompt
    status_prompt="$(_prompt_status)"
    if [[ "$status_prompt" != "" ]]; then
        echo -n " $sep $status_prompt"
    fi
    echo -n "\n"

    echo -n "   %F{11}%~ %F{red}%(!.#.»)%f "
}

short_host=`hostname`
me=`whoami`
function _prompt_render() {
    PROMPT="$(_prompt)"
}

# run on start in case new zsh session is in special directory
_prompt_chdir

add-zsh-hook precmd _prompt_render
add-zsh-hook chpwd _prompt_chdir
PROMPT2=" ◇ "
