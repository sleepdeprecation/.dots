set nocompatible " with vi
filetype off

" vim-plug
call plug#begin('~/.vim/plugged')

" vim-plug plugins
Plug 'gmarik/Vundle.vim'          " plugin manager
Plug 'tpope/vim-sensible'         " sensible defaults

Plug 'scrooloose/syntastic'       " syntax checker

Plug 'bkad/CamelCaseMotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ciaranm/detectindent'       " indentation detection like sublime
Plug 'fatih/vim-go'
Plug 'guns/vim-clojure-static'
Plug 'braintreeps/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nono/jquery.vim'
Plug 'plasticboy/vim-markdown'
Plug 'Raimondi/delimitMate'       " auto closing of quotes/parens/etc
Plug 'scrooloose/nerdcommenter'   " easy commenting
Plug 'scrooloose/nerdtree'        " file browser
Plug 'thoughtbot/vim-rspec'       " rspec helper
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-endwise'          " auto insertion of `end` keyword in ruby
Plug 'tpope/vim-fugitive'         " git support
Plug 'tpope/vim-rails'            " rails stuffs
Plug 'tpope/vim-surround'         " easy changing of 'wrapping' characters
Plug 'vim-ruby/vim-ruby'
Plug 'tomtom/tcomment_vim'
Plug 'udalov/kotlin-vim'
Plug 'tfnico/vim-gradle'
Plug 'kchmck/vim-coffee-script'   " Coffee script syntax highlighting and such
Plug 'othree/html5.vim'
Plug 'dart-lang/dart-vim-plugin'

" Vimux
Plug 'benmills/vimux'
Plug 'drewolson/vimux-maven-test'
Plug 'drewolson/vimux-elixir-test'
Plug 'pitluga/vimux-nose-test'
Plug 'pgr0ss/vimux-ruby-test'

" Color schemes
Plug 'altercation/vim-colors-solarized'   " solarized
Plug 'sjl/badwolf'                        " badwolf

call plug#end()

filetype plugin indent on

" color stuffs
colorscheme badwolf
set background=dark
set t_Co=256

    " bad wolf settings
    let g:badwolf_darkgutter=1

" basics
set number
syntax on
set bs=2
set history=50
set ruler
set autoread
set linespace=0

" highlight searches
set hlsearch

" show stuffs
set showmatch
set showmode

"  stuffs
set autoindent
set smartindent
set incsearch
set nobackup
set copyindent
set ignorecase

" tab things
set expandtab
set textwidth=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set sw=2

"autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
"autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
"autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
"autocmd FileType c setlocal tabstop=4 shiftwidth=4 softtabstop=4

" smart stuffs
set smartcase
set smarttab  " tabbing

" powerlines stuffs
set laststatus=2
set encoding=utf-8

" syntax highlighting?
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

" new things from http://statico.github.com/vim.html
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>
:nmap \q :nohlsearch<CR> " turn off search highlighting

" force hjkl navigation
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" move up and down "graphical" lines
:nmap j gj
:nmap k gk

:map <Down> gj
:map <Up> gk
:imap <Down> <C-o>gj
:imap <Up> <C-o>gk

" move between buffers
:nmap <C-e> :e#<CR>
:nmap \n :bnext<CR>
:nmap \p :bprev<CR>

" Automatic tab detection
autocmd BufReadPost * :DetectIndent
:let g:detectindent_preferred_expandtab = 1
:let g:detectindent_preferred_indent = 2

" ctrl-p stuffs
:let g:ctrlp_map = '<leader>ff'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0
:let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Why should I have to type :CtrlP?
:nmap <C-p> :CtrlPMixed<CR>

" NERDTree things
:nmap \nt :NERDTreeToggle<CR>
:nmap \nf :NERDTreeFocus<CR>

" make split screens nicer
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


set spell
"set tw=80
set wrap
set linebreak
set nolist

set colorcolumn=81 " 1 past 80...

" markin-downs, gitcommit, hgcommit
autocmd BufNewFile,BufRead *.md,*.markdown set tw=80

" jquery plugin
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" rspec mapping
nmap \rf :call RunCurrentSpecFile()<CR>
nmap \rs :call RunNearestSpec()<CR>
nmap \rl :call RunLastSpec()<CR>
map \ra :call RunAllSpecs()<CR>

set nofoldenable
let g:vim_markdown_folding_disabled=1

" fuck swp files
set backupdir=/tmp//
set directory=/tmp//

" gui stuff
if has('gui_running')
    set guifont=Fira\ Mono:h10
    set lines=30
    set columns=120
    autocmd vimenter * NERDTree
endif

" nerdtree stuffs
let NERDTreeMapOpenRecursively="+"
let NERDTreeMapCloseChildren="-"

" vimux stuff
"let g:VimuxUseNearestPane = 1

