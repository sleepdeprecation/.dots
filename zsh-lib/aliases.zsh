autoload -U compaudit compinit
compinit

alias reload-shell="source $HOME/.zshrc"
alias rezsh="source $HOME/.zshrc"

nvim=`command -v nvim`
if [[ "${nvim}x" != "x" ]]; then
  local vim_path=`command -v vim`

  alias vim=nvim
  alias vi=nvim
  alias nvi=nvim

  compdef nvim vim vi nvi
fi

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

amis() {
  if [[ ! -z $AWS_PROFILE ]]; then
    profile="$AWS_PROFILE"
  else
    profile="prod-admin"
  fi



  if [[ ! -z "$1" ]]; then
    name="$1"
  else
    name="*"
  fi

  output=$(env AWS_PROFILE="$profile" aws ec2 describe-images --owners self --filters Name=tag:ami_name,Values=$name)

  echo "$output" | jq -S '.Images | [.[] | (.Tags | .[] | select(.Key == "ami_name") | .Value) as $name | (.Tags | .[] | select(.Key == "ami_version") | .Value) as $version | .ImageId as $id | {($name): {($version): $id}}] | reduce .[] as $n ({}; . * $n)'
}
