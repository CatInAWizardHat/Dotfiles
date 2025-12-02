" DEFAULTS ---------------------------------------------------------- {{{
set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

set relativenumber

" set cursorline

" set cursorcolumn

set shiftwidth=4

set tabstop=4

set expandtab

set nobackup

set nowrap

set ignorecase

set showcmd

set showmode

set hlsearch

set wildmenu

" set wildmenu=list:longest

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

let mapleader = " "

" }}}

" PLUGINS ------------------------------------------------------------------ {{{

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'

    Plug 'preservim/nerdtree'



call plug#end()

" }}}

" MAPPINGS ------------------------------------------------------------------ {{{


" }}}

" VIMSCRIPT ------------------------------------------------------------------ {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" STATUS LINE ------------------------------------------------------------------ {{{


" }}}
