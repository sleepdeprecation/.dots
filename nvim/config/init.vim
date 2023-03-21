"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

filetype off
call plug#begin(stdpath('data').'/plugged')
Plug 'tpope/vim-sensible'         " sensible defaults
Plug 'tpope/vim-sleuth'

" file/buffer navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'cloudhead/neovim-fuzzy'
" Plug 'scrooloose/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'tpope/vim-abolish' " better search/substitute
Plug 'tpope/vim-endwise' " auto insertion of `end` keyword in ruby
Plug 'tpope/vim-surround' " easy changing of 'wrapping' characters
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'

Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'hashivim/vim-terraform'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'itkq/fluentd-vim'

Plug 'tpope/vim-fugitive'

Plug 'sjl/badwolf'

call plug#end()
filetype plugin indent on

lua require('config')

" basic
colorscheme seti-dk

set number
syntax on
"set backspace=2
set history=50
"set ruler
"set colorcolumn=81
set autoread
set cursorline
set spell
set spelllang=en
set wrap
set linebreak

set splitbelow
set splitright

set hlsearch
set showmatch
set showmode
set ignorecase

set incsearch

set nobackup
set backupdir=/tmp//
set directory=/tmp//
"set copyindent

set expandtab
set textwidth=0
set tabstop=4
set shiftwidth=2
set softtabstop=2

set smartcase
set smarttab
set smartindent

set encoding=utf-8

set spell
set wrap
set linebreak
set list
set listchars=tab:>\ 


" syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby

" move up and down "graphical" lines
nmap j gj
nmap k gk
map <Down> gj
map <Up> gk
imap <Down> <C-o>gj
imap <Up> <C-o>gk

" sleuth
let g:sleuth_automatic = 0

" neovim fuzzy
"   NOTE: requires fzy and the_silver_searcher to be installed
nnoremap <C-p> :FuzzyOpen<CR>
nmap <leader>ff :FuzzyOpen<CR>

" chadtree
nmap <leader>nt :NvimTreeToggle<CR>
nmap <leader>nf :NvimTreeFocus<CR>

let NERDTreeIgnore = ['\.pyc$', '__pycache__/*$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" disable folding
set nofoldenable

" vim markdown
let g:vim_markdown_folding_diabled = 1
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_auto_indent_bullets = 0
autocmd FileType markdown setlocal conceallevel=0

" vim ruby
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_block_style = 'do'

" vim terraform
let g:terraform_fmt_on_save = 1
let g:terraform_commentstring = '#\ %s'
autocmd FileType terraform setlocal commentstring=#\ %s

" Commentary
map <localleader>cc :Commentary<CR>

" go
autocmd FileType go setlocal softtabstop=4 | setlocal shiftwidth=4 | setlocal tabstop=4 | setlocal noexpandtab
let g:go_gopls_enabled = 0 " turn off gopls
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_imports_mode = 'goimports'
