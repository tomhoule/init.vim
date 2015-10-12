" Directories {{{1
set runtimepath=~/.nvim/,$VIMRUNTIME
set backupdir=~/.nvim/backup/
set directory=~/.nvim/swap/
set undodir=~/.nvim/undo/

" }}}1
" Vundle {{{1
set runtimepath+=~/.nvim/bundle/Vundle.vim
filetype off
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'benekastah/neomake'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'VundleVim/Vundle.vim'

" Language-specific plugins
Plugin 'pangloss/vim-javascript'

Plugin 'jason0x43/vim-js-indent'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc'

Plugin 'ebfe/vim-racer'
Plugin 'wting/rust.vim'

call vundle#end()

" }}}1
" Configuration {{{1
set number
syntax enable
filetype plugin indent on
set history=1000
set ruler
set showcmd
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<
set list
set textwidth=72
set formatoptions=cqj    " Hard wrap only for comments
set wrap                 " Enable soft-wrapping
set linebreak            " Do not cut words in half when soft-wrapping
set showbreak="*"
set tabstop=8
set softtabstop=8
set shiftwidth=4
set expandtab
set ignorecase smartcase
set smarttab
set foldmethod=marker

" . applies to each line of visual selection
vnoremap . :norm.<CR>

let g:deoplete#enable_at_startup = 1

set background=dark
colorscheme solarized

" }}}1
" Keybindings {{{1
let mapleader="»"
let maplocalleader="«"

" aww yiss! ↴
nnoremap <Leader>w :w<CR>
nnoremap <Leader>tt :terminal<CR>
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>h :nohlsearch<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap é :

:digraph \v 8628 " ↴
:digraph L> 8627 " ↳
:digraph /^ 8599 " ↗
:digraph \> 8600 " ↘

" }}}1
" Language-specific options {{{1

" Typescript
autocmd FileType typescript nmap <buffer> <LocalLeader>t : <C-u>echo tsuquyomi#hint()<CR>
" .tsxもtypescriptとして扱う
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript
let g:syntastic_quiet_messages = { "file:p": [".tsx$", ".ts$"] }

" }}}1
