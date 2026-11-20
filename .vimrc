set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins (managed by vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'wakatime/vim-wakatime'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'ervandew/supertab'
call plug#end()

filetype plugin indent on

set mouse=a
set clipboard=unnamed
set completefunc=emoji#complete
set nocp
set bs=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set cursorline
set number
set wildmenu
set wildmode=longest:full,full
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" custom shortcut
nnoremap <F5> :! ./%<CR>

autocmd FileType make setlocal noexpandtab

:map <C-Left> b
:map <C-Right> w

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
