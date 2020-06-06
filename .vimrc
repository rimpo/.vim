set nocompatible
filetype off
set rtp+=$GOROOT/misc/vim
call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible'
Plug 'git://github.com/will133/vim-dirdiff'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-fugitive'

" Theme
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'

" Code complete
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer --tern-completer' }

" Programming Language support
Plug 'skammer/vim-css-color'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for' : ['go', 'markdown'] }
Plug 'mxw/vim-jsx'
Plug 'elmcast/elm-vim'

" Search ACK using ag
Plug 'mileszs/ack.vim'

" Quick Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"------------------------------- INTERNAL CONFIG ----------------------------------------
filetype plugin indent on
syntax on
" disable stupid swap files and backup files
set nobackup
set nowritebackup
set noswapfile

" autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 noexpandtab
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let mapleader=","

"Enable clipboard in vim
set clipboard=unnamed

set rnu
set nu
set nolist
set guifont=DejaVu\ Sans\ Mono\ 11
set shell=/bin/zsh

" Performance improvments
"set norelativenumber

"highlight the search
set hlsearch

"------------------------------- THEME CONFIG ----------------------------------------
"Setting Theme
autocmd vimenter * colorscheme gruvbox

"------------------------------- KEYMAPPING CONFIG----------------------------------------

"clear highlighted search
nnoremap <Esc> :let @/=""<CR>
"nnoremap <Esc><Esc> :nohls<CR>
noremap <silent><Leader>/ :nohls<CR>

" tab settings
" goto next tab - note - over writing refresh
nnoremap <C-l> gt
inoremap <C-l> <Esc>gt
vnoremap <C-l> gt
" goto prev tab
nnoremap <C-h> gT
inoremap <C-h> <Esc>gT
vnoremap <C-h> gT

" save file shortcut
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> :w<CR>

" easier moving of code blocks
vnoremap < <gv " better indentations
vnoremap > >gv " better indentations

"Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"enable scrolling in vim 
set mouse=a
"fix character insert problem
nnoremap <esc>^[ <esc>^[


" fzf key mapping 
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" YouCompleteMe
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>

" Code Formatting
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>

"Sort python Import
autocmd FileType python nnoremap <leader>i :!isort %<CR><CR>
"------------------------------- PLUGIN OTHER CONFIG ----------------------------------------

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Python
let python_highlight_all = 1
let g:syntastic_python_flake8_args="--ignore=W191,E501,E302"

" Disable pylint
let g:pymode_lint_write = 0

" Go
let g:go_fmt_command = "goimports"

" Control P
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn|pyc)$'
set wildignore+=*.pyc
set wildignore+=*.tgz
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*\\node_modules\\**

"Bookmark setting
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
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

