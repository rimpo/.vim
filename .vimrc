execute pathogen#infect()
syntax on
filetype on

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

"ag
set runtimepath^=~/.vim/bundle/ag


"-- tab settings -- 
"goto next tab
nnoremap <F8> gt
inoremap <F8> <Esc>gti
vnoremap <F8> gt
"goto prev tab
nnoremap <F9> gT
inoremap <F9> <Esc>gTi
vnoremap <F9> gT
