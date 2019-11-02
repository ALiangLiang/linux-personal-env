set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
call vundle#end()
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

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-emoji'
Plug 'ervandew/supertab'
call plug#end()

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
