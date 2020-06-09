set nocompatible
filetype off
set rtp+=$GOROOT/misc/vim
call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible'
Plug 'git://github.com/will133/vim-dirdiff'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Database support
Plug 'joereynolds/SQHell.vim'

" Theme
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'

" Code complete
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer --tern-completer' }

" Programming Language support
Plug 'sheerun/vim-polyglot'
Plug 'skammer/vim-css-color'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for' : ['go', 'markdown'] }
Plug 'mxw/vim-jsx'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-syntastic/syntastic'
Plug 'flebel/vim-mypy', { 'for': 'python', 'branch': 'bugfix/fast_parser_is_default_and_only_parser' }

"Search or Find
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Fast search
Plug 'jremmen/vim-ripgrep'
call plug#end()

"------------------------------- INTERNAL CONFIG ----------------------------------------
filetype plugin indent on
syntax on
" disable stupid swap files and backup files
set nobackup
set nowritebackup
set noswapfile
set noerrorbells
set belloff=all

set undodir=~/.vim/undodir
set undofile

" spell checking
"set spell
"setglobal spell spelllang=en_us

" changed for CursorHold - updatetime (default: 4000 ms)
set updatetime=500

" autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 noexpandtab
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smartindent

set nowrap

let mapleader=" "

"Enable clipboard in vim
set clipboard=unnamed

set rnu
set nu
set nolist
set guifont=DejaVu\ Sans\ Mono\ 12
set shell=/bin/zsh

" Performance improvments
"set norelativenumber

"highlight the search
set hlsearch
set incsearch

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

let python_highlight_all = 1

if has('python') && isdirectory('./venv')
py << EOF
import sys
sys.path.insert(0, './venv/bin/python')
EOF
endif

"------------------------------- THEME CONFIG ----------------------------------------
"Setting Theme
let g:gruvbox_contrast_dark = 'hard'
autocmd vimenter * colorscheme gruvbox
set background=dark
"------------------------------- KEYMAPPING CONFIG----------------------------------------

"clear highlighted search
nnoremap <Esc> :let @/=""<CR>
"nnoremap <Esc><Esc> :nohls<CR>
noremap <silent><Leader>/ :nohls<CR>

" tab settings
" goto next tab - note - over writing refresh
nnoremap <leader>l gt
inoremap <leader>l <Esc>gt
vnoremap <leader>l gt
" goto prev tab
nnoremap <leader>h gT
inoremap <leader>h <Esc>gT
vnoremap <leader>h gT

" Navigate window
nnoremap <C-h> :wincmd h<CR>
inoremap <C-h> <Esc>:wincmd h<CR>
vnoremap <C-h> :wincmd h<CR>

nnoremap <C-j> :wincmd j<CR>
inoremap <C-j> <Esc>:wincmd j<CR>

nnoremap <C-k> :wincmd k<CR>
inoremap <C-k> <Esc>:wincmd k<CR>

nnoremap <C-l> :wincmd l<CR>
inoremap <C-l> <Esc>:wincmd l<CR>

" Size of window
nnoremap <leader><Up> :resize +5<CR>
inoremap <leader><Up> :resize +5<CR>
nnoremap <leader><Down> :resize -5<CR>
inoremap <leader><Down> :resize -5<CR>

nnoremap <leader><Left> :vertical resize -5<CR>
inoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Right> :vertical resize +5<CR>
inoremap <leader><Right> :vertical resize +5<CR>

" Toggle undo tree window
nnoremap <leader>u :UndotreeToggle<CR>

" Open File window 
nnoremap <leader>1 :Lex! <bar> :vertical resize 40<CR>

" Open copen window
nnoremap <leader>2 :copen<CR>

" easier moving of code blocks
vnoremap < <gv " better indentations
vnoremap > >gv " better indentations

"Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Enable folding
set foldmethod=indent
set foldlevel=99

"enable scrolling in vim 
set mouse=a
"fix character insert problem
nnoremap <esc>^[ <esc>^[


" fzf key mapping 
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>

" Search All files
nnoremap <Leader>f :Rg<CR>

" YouCompleteMe
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>
nnoremap <F10> :YcmCompleter GoToReferences<CR>

" Code Formatting
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>

"Undo tree shortcut 
nnoremap <F5> :UndotreeToggle<cr>


" Execute sql
autocmd FileType sql nnoremap <F9> :SQHExecute<CR>
autocmd FileType sql vnoremap <F9> :SQHExecute<CR>

"------------------------------- PLUGIN OTHER CONFIG ----------------------------------------

"Rg
if executable('rg')
    let g:rg_derive_root='true'
endif

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
" YouCompleteMe disable question to load ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0

" Go
let g:go_fmt_command = "goimports"

set wildignore+=*\\node_modules\\**

" Python
" Synstatic 
"let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checkers=['flake8', 'pylint',]
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>9 :SyntasticCheck<CR> 
nnoremap <leader>8 :Mypy<CR> 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_flake8_args="--ignore=W191,E501,E302"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:sqh_results_limit = 1000
let g:sqh_results_output = 'smart'
let g:sqh_provider = 'psql'

" Load json configuration for g:sqh_connections
source ~/.sqh_database.vim

"set statusline+=%{sqhell#Host()}

" Run mypy on python file save
"autocmd BufWritePost *.py :Mypy
"------------------------------- PERFORMANCE CONFIG ----------------------------------------

"to fix vim-airline performnce PROBLEM
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

