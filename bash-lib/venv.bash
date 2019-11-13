#!/bin/bash

function venv() {
  local opts create_env pyversion use_venv

  declare -A opts=([-d]="env" [-p]="python3")

  while getopts ":pdc" opt; do
    case  ${opt} in
      p )
        opts[-p]=$opt
        ;;
      d )
        opts[-d]=$opt
        ;;
      c )
        create_env="yes"
        ;;
      \? )
        echo "Usage: venv [-p python executable] [-d virtualenv directory] [-c]"
        exit 2
        ;;
    esac
  done

  pyversion=${opts[-p]}
  env_dir=${opts[-d]}

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

    pyversion=$(${opts[-p]} --version 2>&1 | cut -c8-)

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
