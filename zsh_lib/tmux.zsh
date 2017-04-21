tmux-join() {
  tmux -S /tmp/$1 new-session -t $1
}
alias tmuxjoin='tmux-join'
alias tmj='tmux-join'

tmux-list() {
  ps ax -o ruser,command | grep '[n]ew-session -s' | ruby -ne '$_ =~ /^(\w+).*-s (\w+)/; puts "#{$1} started #{$2}"'
}
alias tmuxlist='tmux-list'
alias tml='tmux-list'

tmux-start() {
  local session_name
  if [[ ! -z $1 ]]; then
    session_name=$1
  else
    session_name=`basename $PWD | sed -e 's/\./_/g'`
  fi
  tmux -S /tmp/$session_name new-session -s $session_name -d
  chmod 777 /tmp/$session_name
  tmux -S /tmp/$session_name attach -t $session_name
}
alias tmuxstart='tmux-start'
alias tms='tmux-start'
