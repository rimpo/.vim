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
call vundle#end()

syntax on
filetype plugin indent on      " Automatically detect file types.

set rnu
set nu
set nolist
set guifont=DejaVu\ Sans\ Mono\ 14

autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 noexpandtab

let mapleader=","

"Ycm
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>

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

"highlight the search
set hlsearch
"clear highlighted search
nnoremap <leader>c :let @/=""<CR>


