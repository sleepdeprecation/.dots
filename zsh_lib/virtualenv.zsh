function venv() {
  if [[ ! -z $1 ]]; then
    env_dir=$1
  else
    env_dir="env"
  fi

  if [[ ! -d "$PWD/env" ]]; then
    echo "Creating new virtualenv in \`env\`."
    echo -n "Which python should be used [python3]: "
    read use_py

    if [[ -z $use_py ]]; then
      use_py="python3"
    fi

    virtualenv -p $use_py $env_dir
  fi

  source $PWD/env/bin/activate
}
