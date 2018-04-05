alias reload-shell="source $HOME/.zshrc"
alias rezsh="source $HOME/.zshrc"

title() {
  echo -ne "\033]0;"$*"\007"
}

ecr-login() {
  if [[ ! -z $1 ]]; then
    profile="$1"
  elif [[ ! -z $AWS_PROFILE ]]; then
    profile="$AWS_PROFILE"
  else
    profile=""
  fi

  $(env AWS_PROFILE="$profile" aws ecr get-login --no-include-email --region us-east-1)
}
