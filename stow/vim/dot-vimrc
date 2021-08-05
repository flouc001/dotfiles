set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')
Plug 'elzr/vim-json'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier'
Plug 'editorconfig/editorconfig-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Preferences
syntax on
colorscheme dracula
set tabstop=2 shiftwidth=2 expandtab
set ignorecase
set smartcase
set number

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

