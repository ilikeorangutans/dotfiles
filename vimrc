if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'editorconfig/editorconfig-vim'
Plug 'janko/vim-test'
Plug 'https://tpope.io/vim/dispatch.git'
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-corvine'
Plug 'cespare/vim-toml'
Plug 'lifepillar/vim-mucomplete'
"Plug 'elmcast/elm-vim'
Plug 'dhruvasagar/vim-table-mode'
"Plug 'davidhalter/jedi-vim'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()

let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_warnings = 1
let g:pymode_options = 1


if has('macunix')
  source ~/.vimrc.darwin
endif

filetype plugin indent on

"colorscheme desertink
let g:rehash256 = 1

set background=dark
colorscheme gruvbox

syntax on

set autoindent
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup//
set cmdheight=3
set confirm
set cursorline
set directory=~/.vim/swap//
set expandtab
set grepprg=ag\ --nogroup\ --nocolor
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nostartofline
set number
set pastetoggle=<F11>
set relativenumber
set ruler
set shiftwidth=2
set smartcase
set softtabstop=2
set tabstop=8
set undodir=~/.vim/undo//
set wildmenu

let mapleader=","
let g:netrw_liststyle = 3
let g:netrw_banner = 0

let mapleader=","

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

autocmd FileType ruby setlocal nocursorline

autocmd BufWritePre * :%s/\s\+$//e

let test#strategy = "dispatch"

au FileType go nmap <leader>t <Plug>:TestNearest<CR>

let $FZF_DEFAULT_COMMAND='fd --type f'

let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

set completeopt+=menuone
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

au FileType rust nmap <leader>r :RustRun<CR>
au FileType rust nmap <leader>f :RustFmt<CR>

let g:rustfmt_autosave = 1

