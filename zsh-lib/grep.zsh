function dirgrep() {
    if [[ -z $1 ]]; then
        echo "$0 <grep pattern>"
        exit 1
    fi

    if (( $+commands[ag] )); then
        ag $@ --ignore-dir .git --ignore-dir .terraform --ignore-dir env
    else
        grep -r $@ . | grep -v -e .git -e .terraform -e tfstate
    fi
}
