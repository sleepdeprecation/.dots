tmp() {
    if [[ -z "$TMP_DIR" ]]; then
        TMP_DIR="$HOME/tmp"
    fi

    if [[ ! -d "$TMP_DIR" ]]; then
        mkdir -p "$TMP_DIR"
    fi

    local src dest
    if [[ ! -z "$1" ]]; then
        src="$1"

        if [[ ! -z "$2" ]]; then
            dest="$2"
        else
            dest=$(basename "$1")
        fi

        cp "$src" "$TMP_DIR/$dest"
    else
        cd "$TMP_DIR"
    fi
}
