OS=$(uname -s)

if [[ $OS == "Darwin" ]]; then
  REALPATH_BIN="arch -x86_64 $(dirname "${BASH_SOURCE[0]}")/bin/realpath"
else
  REALPATH_BIN=$(which realpath)
fi

DOTSTUFFDIR=$($REALPATH_BIN $(dirname $(dirname "$0")))

function createlink() {
  if [ "$#" -ne 2 ]; then
    echo "failed: createlink src dest"
    return
  fi

  source="$1"
  dest="$2"


  if [ -h "$dest" ]; then
    if [ ! `readlink "$dest"` -ef "$source" ]; then
      rm -f "$dest"
      ln -s -f "$source" "$dest"
    fi
  else
    if [ -d "$dest" ]; then
      rm -rf "$dest"
    else
      rm -f "$dest"
    fi
    ln -s -f "$source" "$dest"
  fi
}
