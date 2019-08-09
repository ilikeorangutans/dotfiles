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
Plug 'mdempsky/gocode', {'rtp': 'vim/'}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'janko/vim-test'
Plug 'https://tpope.io/vim/dispatch.git'
call plug#end()

if has('macunix')
  source ~/.vimrc.darwin
endif

filetype plugin indent on

colorscheme desertink
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

au User lsp_setup call lsp#register_server({
      \ 'name': 'solargraph',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
      \ 'initialization_options': {"diagnostics": "true"},
      \ 'whitelist': ['ruby'],
      \ })
if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
if executable('gopls')
  au User lsp_setup call lsp#register_server({
	\ 'name': 'gopls',
	\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
	\ 'whitelist': ['go'],
	\ })
endif

let $FZF_DEFAULT_COMMAND='fd --type f'

let g:deoplete#enable_at_startup = 1
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
