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
Plugin 'tpope/vim-characterize'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'jamessan/vim-gnupg'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-vinegar'

Plugin 'pangloss/vim-javascript'

Plugin 'Shougo/vimproc'
Plugin 'Quramy/tsuquyomi'
Plugin 'jason0x43/vim-js-indent'
Plugin 'leafgarland/typescript-vim'

Plugin 'ebfe/vim-racer'
Plugin 'wting/rust.vim'

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
set textwidth=72
set formatoptions=cqj    " Hard wrap only for comments
set wrap                 " Enable soft-wrapping
set linebreak            " Do not cut words in half when soft-wrapping
set showbreak="*"
set tabstop=8
set shiftwidth=4
set expandtab
set ignorecase smartcase
set smarttab

" --- Keybindings ---
let mapleader="»"
let maplocalleader="«"

nnoremap <Leader>d :NERDTree<CR>
nnoremap <Leader>t :terminal<CR>
" aww yiss! ↴
nnoremap <Leader>w :w<CR>
tnoremap ÈÈ <C-\><C-n>
nmap <F8> :TagbarToggle<CR>
nnoremap é :

" --- Language-specific options ---

" Typescript
autocmd FileType typescript nmap <buffer> <LocalLeader>t : <C-u>echo tsuquyomi#hint()<CR>
" .tsxもtypescriptとして扱う
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript
let g:syntastic_quiet_messages = { "file:p": [".tsx$", ".ts$"] }
