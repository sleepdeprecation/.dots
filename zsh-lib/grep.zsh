function dirgrep() {
    if [[ -z $1 ]]; then
        echo "$0 <grep pattern>"
        exit 1
    fi

    grep -r $@ . | grep -v -e .git -e .terraform -e tfstate
}
