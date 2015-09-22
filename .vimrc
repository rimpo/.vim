execute pathogen#infect()
syntax on
filetype on

set rnu
set nu
set nolist
set guifont=DejaVu\ Sans\ Mono\ 14

autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 noexpandtab

let mapleader=","


nnoremap <F12> :YcmCompleter GoToDeclaration<CR>

