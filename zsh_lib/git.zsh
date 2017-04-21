function gignore() {
  if [ $# = 0 ]; then
    echo "gignore <file/glob>"
    echo "    add files/glob to a .gitignore file"
    return 1
  fi

  git_root=$(git rev-parse --show-toplevel 2> /dev/null)
  if [ "${git_root}x" = "x" ]; then
    echo "must be run in a git repo"
    return 1
  fi

  for pattern in $@; do
    echo $pattern >> ${git_root}/.gitignore
  done
}

function gigedit() {
  git_root=$(git rev-parse --show-toplevel 2> /dev/null)
  if [ "${git_root}x" = "x" ]; then
    echo "must be run in a git repo"
    return 1
  fi

  $EDITOR ${git_root}/.gitignore
}
