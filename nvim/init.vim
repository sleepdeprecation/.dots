" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

filetype off

call plug#begin(stdpath('data').'plugged')
call plug#end()
filetype plugin indent on
