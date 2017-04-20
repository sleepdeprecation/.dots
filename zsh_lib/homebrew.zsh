os=`uname -s`
if [[ $os == "Darwin" ]]; then
  HOMEBREW_NO_AUTO_UPDATE=`/usr/bin/true`
fi
