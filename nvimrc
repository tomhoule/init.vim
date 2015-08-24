" --- Directories ---
set runtimepath=~/.nvim/,$VIMRUNTIME
set backupdir=~/.nvim/backup/
set directory=~/.nvim/swap/
set undodir=~/.nvim/undo/

" --- Vundle ---
set runtimepath+=~/.nvim/bundle/Vundle.vim
filetype off
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()

" --- Configuration ---
set number
syntax enable
filetype plugin indent on
set history=1000
set ruler
set showcmd
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<
set list
set formatoptions=cjvw   " Hard wrap only for comments
set wrap                 " Enable soft-wrapping
set linebreak            " Do not cut words in half when soft-wrapping
set showbreak="*"

" --- Keybindings ---
let mapleader="»"
let maplocalleader="«"

nnoremap <Leader>d :NERDTree<CR>
nmap <F8> :TagbarToggle<CR>

