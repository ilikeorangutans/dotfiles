" not needed in a .vimrc " set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tpope/vim-surround'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'editorconfig/editorconfig-vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'Shougo/deoplete.nvim'
Plugin 'deoplete-plugins/deoplete-go'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
call vundle#end()            " required
filetype plugin indent on    " required

if has('macunix')
  source ~/.vimrc.darwin
endif

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
set softtabstop=2
set tabstop=8
set expandtab
set grepprg=ag\ --nogroup\ --nocolor
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set cursorline
set relativenumber
set history=10000

let g:netrw_liststyle = 3
let g:netrw_banner = 0

let mapleader=","

nnoremap <c-p> :Files <CR>
nnoremap <c-t> :Tags <CR>

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
au FileType go setlocal tabstop=4

let g:go_code_completion_enabled = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"colorscheme tender
colorscheme desertink

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

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:LanguageClient_serverCommands = {
  \ 'ruby': ['tcp://localhost:7658'],
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  \ }
let g:LanguageClient_autoStop = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"au FileType ruby setlocal omnifunc=LanguageClient#complete

let g:deoplete#enable_at_startup = 1

autocmd FileType ruby setlocal nocursorline
