set nocompatible
filetype off
set rtp+=$GOROOT/misc/vim
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-sensible'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer --tern-completer' }
Plug 'git://github.com/will133/vim-dirdiff'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-fugitive'
Plug 'mxw/vim-jsx'
Plug 'skammer/vim-css-color'
Plug 'bling/vim-airline'
"Theme
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'elmcast/elm-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"ACK uses AG
Plug 'mileszs/ack.vim'

Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for' : ['go', 'markdown'] }
call plug#end()

filetype plugin indent on
syntax on
let python_highlight_all = 1

set rnu
set nu
set nolist
set guifont=DejaVu\ Sans\ Mono\ 11
set shell=/bin/bash

" autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 noexpandtab
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let mapleader=","

"Ycm
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

"Syntastic - python syntax checker
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
let g:syntastic_python_flake8_args="--ignore=W191,E501,E302"

"Disable pylint
let g:pymode_lint_write = 0

"Control P
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn|pyc)$'
set wildignore+=*.pyc
set wildignore+=*.tgz
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*\\node_modules\\**
" let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](node_modules)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links'
"  \ }

"ESLint 
let g:syntastic_javascript_checkers = ['eslint']

"-- tab settings -- 
"goto next tab - note - over writing refresh
nnoremap <C-l> gt
inoremap <C-l> <Esc>gt
vnoremap <C-l> gt
"goto prev tab
nnoremap <C-h> gT
inoremap <C-h> <Esc>gT
vnoremap <C-h> gT

"save file shortcut
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> :w<CR>
"syntastic check on save
autocmd FileType python nnoremap <C-s> :w<CR>:SyntasticCheck<CR>
autocmd FileType python inoremap <C-s> <Esc>:w<CR>:SyntasticCheck<CR>
autocmd FileType python vnoremap <C-s> :w<CR>:SyntasticCheck<CR>
autocmd FileType javascript setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab

" easier moving of code blocks
vnoremap < <gv " better indentations
vnoremap > >gv " better indentations


" disable stupid swap files and backup files
set nobackup
set nowritebackup
set noswapfile


"highlight the search
set hlsearch
"clear highlighted search
nnoremap <Esc> :let @/=""<CR>
"nnoremap <Esc><Esc> :nohls<CR>
noremap <silent><Leader>/ :nohls<CR>

"Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


"Code Formatting
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"Setting Theme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"Enable clipboard in vim
set clipboard=unnamed

"Sort python Import
autocmd FileType python nnoremap <leader>i :!isort %<CR><CR>

"TO FIX vim-airline PERFORMANCE PROBLEM 
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"enable scrolling in vim 
set mouse=a
"fix character insert problem
nnoremap <esc>^[ <esc>^[


" fzf key mapping 
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" Performance improvments
set norelativenumber


