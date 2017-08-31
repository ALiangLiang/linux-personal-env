set mouse=
set completefunc=emoji#complete
set nocp
set bs=2
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-emoji'
Plug 'ervandew/supertab'

call plug#end()

