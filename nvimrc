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
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'jamessan/vim-gnupg'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

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
set wildignore=*/tmp/*,*.so,*.swp,*.zip

" --- Keybindings ---
let mapleader="»"
let maplocalleader="«"

nnoremap <Leader>d :NERDTree<CR>
nnoremap <Leader>t :terminal<CR>
tnoremap ÈÈ <C-\><C-n>
nmap <F8> :TagbarToggle<CR>


" --- Language-specific options ---

" JS
let g:jsx_ext_required = 0 " allow jsx in .js files
