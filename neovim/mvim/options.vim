
set nocompatible
set showmatch
set ignorecase
set mouse=a
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set scrolloff=5

set termguicolors

set number
set relativenumber

set wildmode=longest,list
set cc=100
filetype plugin indent on
filetype plugin on
syntax on

set ttyfast

set noswapfile

map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A
noremap <C-b> <Esc>B
inoremap <C-b> <Esc>Bi

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

syntax keyword cTodo TODO ODOT FIXME HACK XXX BUG NOTE
