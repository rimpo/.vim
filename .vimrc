set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'Rename'
Plugin 'git://github.com/will133/vim-dirdiff'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'itchyny/lightline.vim'
Plugin 'skammer/vim-css-color'
Plugin 'scrooloose/nerdtree'
call vundle#end()

syntax on
filetype plugin indent on      " Automatically detect file types.

set rnu
set nu
set nolist
set guifont=DejaVu\ Sans\ Mono\ 11
set shell=/bin/bash
autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 noexpandtab

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
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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

let python_highlight_all = 1

"Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']


" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

" NerdTree settings
nmap <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '\.png$']

