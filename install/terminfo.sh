. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

for item in $DOTSTUFFDIR/terminfo/*; do
    tic -o "$HOME/.terminfo" "$item"
done
