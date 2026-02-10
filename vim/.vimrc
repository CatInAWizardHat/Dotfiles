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

    Plug 'ghifarit53/tokyonight-vim'

    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    Plug 'itchyny/lightline.vim'

    Plug 'yegappan/lsp'

call plug#end()

colorscheme tokyonight
" }}}

" MAPPINGS ------------------------------------------------------------------ {{{

" FZF keymaps (requires Plug 'junegunn/fzf.vim')

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fq :CList<CR>  " For quickfix list
nnoremap <leader>fh :Helptags<CR>

" Grep current string
nnoremap <leader>fs :Rg <C-r><C-w><CR>

" Grep input string (fzf prompt)
nnoremap <leader>fg :Rg<Space>

" Grep for current file name (without extension)
nnoremap <leader>fc :execute 'Rg ' . expand('%:t:r')<CR>

" Find files in your Vim config
nnoremap <leader>fi :Files ~/.vim<CR>

set keywordprg=man

nnoremap <leader>py :!python3 -m pydoc <cword><CR>



" }}}

" VIMSCRIPT ------------------------------------------------------------------ {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" STATUS LINE ------------------------------------------------------------------ {{{
set laststatus=2
let g:lightline = {
            \ 'colorscheme' : 'tokyonight',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead',
            \   'filename': 'LightlineFilename' 
            \ }
            \ }

function! LightlineFilename()
    return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" }}}

" LSP ---------------------------------------------------- {{{
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)
let lspServers = [
    \ #{
    \   name: 'ty',
    \   filetype: ['python'],
    \   path: 'ty',
    \   args: ['server']
    \ },
    \ #{
    \   name: 'clangd',
    \   filetype: ['c', 'cpp'],
    \   path: 'clangd',
    \   args: ['--background-index']
    \ },
    \ #{
    \   name: 'rust-analyzer',
    \   filetype: ['rust'],
    \   path: 'rust-analyzer',
    \   args: []
    \ },
    \ #{
    \   name: 'jdtls',
    \   filetype: ['java'],
    \   path: 'jdtls',
    \   args: []
    \ }
    \ ]

autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion
autocmd FileType python setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \  diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \})

" }}}
