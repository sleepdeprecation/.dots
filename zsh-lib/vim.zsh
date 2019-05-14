nvim=`command -v nvim`
if [[ "${nvim}x" != "x" ]]; then
  local vim_path=`command -v vim`

  alias vim=nvim
  alias vi=nvim
  alias nvi=nvim

  #compdef nvim vim vi nvi
fi
