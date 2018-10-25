function venv() {
  local opts create_env pyversion use_venv

  typeset -A opts
  opts=(
    "-d" "env"
    "-p" "python3"
  )

  zparseopts -K -E -A opts -- p: d: c=create_env

  pyversion=$opts[-p]
  env_dir=$opts[-d]

  if [[ ! -d "${opts[-d]}" ]]; then
    if [[ "$create_env" == "" ]]; then
      echo -n "venv doesn't exist, create it? [yN]: "
      read create_env
      create_env=$(echo $create_env | cut -c1)

      if [[ "$create_env" != "y" ]]; then
        echo "not creating env."
        return 1
      fi
    fi

    pyversion=$($opts[-p] --version 2>&1 | cut -c8-)

    use_venv=1

    # check major version
    if [[ $(echo "$pyversion" | cut -d'.' -f1) -ge 3 ]]; then
      # check minor version
      if [[ $(echo "$pyversion" | cut -d'.' -f2) -ge 3 ]]; then
        use_venv=0
      fi
    fi

    if [[ "$use_venv" -eq 0 ]]; then
      ${opts[-p]} -m venv "${opts[-d]}"
    else
      virtualenv -p "${opts[-p]}" "${opts[-d]}"
    fi
  fi

  source "$PWD/${opts[-d]}/bin/activate"
}
