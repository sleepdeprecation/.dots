function venv() {
  if [[ ! -z $1 ]]; then
    env_dir=$1
  else
    if [[ ! -d "$PWD/env" ]]; then
      echo "No virtualenv directory specified / \`env\` not found."
      exit 1
    fi
    env_dir="env"
  fi

  source $PWD/env/bin/activate
}
