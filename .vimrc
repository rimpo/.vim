set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'git://github.com/tpope/vim-sensible.git'
Plugin 'fatih/vim-go'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'scrooloose/syntastic'
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

"Syntastic - python syntax checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


"Control P
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn|pyc)$'

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


"highlight the search
set hlsearch
"clear highlighted search
nnoremap <Esc> :let @/=""<CR>


let python_highlight_all = 1
