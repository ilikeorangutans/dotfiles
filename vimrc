set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-rails'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tpope/vim-surround'
Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()            " required
filetype plugin indent on    " required

set backspace=indent,eol,start

syntax on
set number
set ruler
set hidden
set hlsearch
set ignorecase
set smartcase
set incsearch
set wildmenu

set autoindent
set nostartofline
set laststatus=2
set confirm
set mouse=a
set cmdheight=3
set pastetoggle=<F11>

set shiftwidth=2
set tabstop=2
set expandtab
set grepprg=ag\ --nogroup\ --nocolor
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set cursorline
set relativenumber
set history=10000

let mapleader=","

let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_max_files = 100000
let g:ctrlp_max_height = 30
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_extensions = ['tag']

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

colorscheme corporation

set shell=/bin/bash

nmap <c-s> <esc>:w<CR>
nnoremap K :Ag '<C-R><C-W>'<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>

autocmd BufWritePre * :%s/\s\+$//e

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


nnoremap <silent> [b :bprevious
nnoremap <silent> ]b :bnext

augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal iskeyword+=:
augroup END
