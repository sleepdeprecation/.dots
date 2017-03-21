alias reload-shell="source $HOME/.zshrc"
alias rezsh="source $HOME/.zshrc"

title() {
  echo -ne "\033]0;"$*"\007"
}
