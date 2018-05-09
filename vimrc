set nocompatible " with vi
filetype off

" vim-plug
call plug#begin('~/.vim/plugged')

" vim-plug plugins
Plug 'tpope/vim-sensible'         " sensible defaults

" Plug 'scrooloose/syntastic'       " syntax checker
" Plug 'ciaranm/detectindent'       " indentation detection like sublime
Plug 'tpope/vim-sleuth'

" file/buffer navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'braintreeps/bufexplorer'
Plug 'scrooloose/nerdtree'        " file browser
Plug 'vimtaku/hl_matchit.vim'

" intra-buffer nav
Plug 'tpope/vim-endwise'          " auto insertion of `end` keyword in ruby
Plug 'tpope/vim-surround'         " easy changing of 'wrapping' characters
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'tmhedberg/matchit'

" languages
Plug 'fatih/vim-go'
Plug 'guns/vim-clojure-static'
Plug 'nono/jquery.vim'
Plug 'plasticboy/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'udalov/kotlin-vim'
Plug 'tfnico/vim-gradle'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rhysd/vim-crystal'
Plug 'voxpupuli/vim-puppet'
Plug 'hashivim/vim-terraform'

" git support
Plug 'tpope/vim-fugitive'

" Color schemes
Plug 'sjl/badwolf'
Plug 'dim13/smyck.vim'
" Plug 'trusktr/seti.vim'

call plug#end()

filetype plugin indent on

" color stuffs
colorscheme seti-dk
set t_Co=256

" basics
set number
syntax on
set bs=2
set history=50
set ruler
set autoread
set linespace=0
set cursorline

" highlight searches
set hlsearch

" show stuffs
set showmatch
set showmode

set autoindent
set incsearch
set nobackup
set copyindent
set ignorecase
set expandtab
set textwidth=0
set tabstop=4
set shiftwidth=4
set softtabstop=4

" smart stuffs
set smartcase
set smarttab

" powerlines stuffs
set laststatus=2
set encoding=utf-8

" Automatic tab detection
let g:sleuth_automatic = 0

" syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

" ruby, two spaces, because community convention
autocmd FileType ruby setlocal softtabstop=2 | setlocal shiftwidth=2 | setlocal tabstop=2

" new things from http://statico.github.com/vim.html
nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
nmap \q :nohlsearch<CR> " turn off search highlighting

" force hjkl navigation
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" move up and down "graphical" lines
nmap j gj
nmap k gk

map <Down> gj
map <Up> gk
imap <Down> <C-o>gj
imap <Up> <C-o>gk

" move between buffers
nmap <C-e> :e#<CR>
nmap \n :bnext<CR>
nmap \p :bprev<CR>


" ctrl-p stuffs
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -oc --exclude-standard', 'find %s -type f'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }

nmap <C-p> :CtrlPMixed<CR>

" NERDTree things
nmap \nt :NERDTreeToggle<CR>
nmap \nf :NERDTreeFocus<CR>
let NERDTreeMapOpenRecursively="+"
let NERDTreeMapCloseChildren="-"
let NERDTreeIgnore = ['\.pyc$']

" Commentary
map <localleader>cc :Commentary<CR>
" force terraform comments to be #
autocmd FileType terraform setlocal commentstring=#\ %s

" highlight matchit
map <localleader>h :HiMatchOn<CR>
map <localleader>hh :HiMatchOff<CR>

" where new splits open
set splitbelow
set splitright

set spell
set wrap
set linebreak
set list
set listchars=tab:>\ 

set colorcolumn=81 " 1 past 80...

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
    " autocmd vimenter * NERDTree
endif

" vimux stuff
"let g:VimuxUseNearestPane = 1

" rspec vimux mapping
" nmap \rf :call RunCurrentSpecFile()<CR>
" nmap \rs :call RunNearestSpec()<CR>
" nmap \rl :call RunLastSpec()<CR>
" map \ra :call RunAllSpecs()<CR>
