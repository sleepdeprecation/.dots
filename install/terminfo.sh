DOTSTUFFDIR=$(realpath $(dirname $(dirname "$0")))

for item in $DOTSTUFFDIR/terminfo/*; do
    tic -o "$HOME/.terminfo" "$item"
done
