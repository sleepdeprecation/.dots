OS=$(uname -s)

if [[ $OS == "Darwin" ]]; then
    REALPATH_BIN="$(dirname "${BASH_SOURCE[0]}")/bin/realpath"
else
    REALPATH_BIN=$(which realpath)
fi

DOTSTUFFDIR=$($REALPATH_BIN $(dirname $(dirname "$0")))
