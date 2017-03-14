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
  if [[ ! -z $1 ]]; then
		SESSION_NAME=$1
	else
		SESSION_NAME=`basename $PWD | sed -e 's/\./_/g'`
	fi
  tmux -S /tmp/$SESSION_NAME new-session -s $SESSION_NAME -d
  chmod 777 /tmp/$SESSION_NAME
  tmux -S /tmp/$SESSION_NAME attach -t $SESSION_NAME
}
alias tmuxstart='tmux-start'
alias tms='tmux-start'
