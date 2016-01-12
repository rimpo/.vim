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
Plugin 'Rename'
Plugin 'git://github.com/will133/vim-dirdiff'
call vundle#end()

syntax on
filetype plugin indent on      " Automatically detect file types.

set rnu
set nu
set nolist
set guifont=DejaVu\ Sans\ Mono\ 12

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

"Control P
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn|pyc)$'
set wildignore+=*.pyc
set wildignore+=*.tgz

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
