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

let mapleader="»"
let maplocalleader="«"
let runtimepath="$HOME/.nvim/,$VIMRUNTIME"
let backupdir="$HOME/.nvim/backup/"
let swap="$HOME/.nvim/swap/"
let undodir="$HOME/.nvim/undo/"

nnoremap <Leader>d :NERDTree<CR>
