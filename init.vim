" # Plugins #
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'jamessan/vim-gnupg'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" ## Language-specific plugins ##
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

Plug 'ebfe/vim-racer', { 'for': 'rust' }
Plug 'wting/rust.vim'

Plug 'stephpy/vim-yaml'

call plug#end()

" # Configuration #
set number
syntax enable
filetype plugin indent on
set ruler
set showcmd
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<
set list
set textwidth=72
set formatoptions=cqj    " Hard wrap only for comments
set wrap                 " Enable soft-wrapping
set linebreak            " Do not cut words in half when soft-wrapping
set cpoptions+=n
set tabstop=8
set softtabstop=8
set shiftwidth=4
set expandtab
set ignorecase smartcase
set foldmethod=marker

" . applies to each line of visual selection
vnoremap . :norm.<CR>

set background=dark
colorscheme solarized

" # Keybindings #
let mapleader="»"
let maplocalleader="«"

" aww yiss! ↴
nnoremap <Leader>w :w<CR>
nnoremap <Leader>tt :terminal<CR>
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>d :NERDTree<CR>
nnoremap <Leader>ag :Ag<Space>
nnoremap <Leader>gr :AgBuffer<Space>
nnoremap <Leader>ar :set rightleft<CR>
nnoremap <Leader>nar :set norightleft<CR>
nmap <F8> :TagbarToggle<CR>
noremap é :
" CTRL-L normally redraws. <C-l> <C-l> still works
noremap! <C-l> <ESC>

:digraph \v 8628 " ↴
:digraph L> 8627 " ↳
:digraph /^ 8599 " ↗
:digraph \> 8600 " ↘

" # Language-specific options #

" .tsxもtypescriptとして扱
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript
" let g:syntastic_quiet_messages = { "file:p": [".tsx$", ".ts$"] }

" ## Rust ##
autocmd BufNewFile,BufRead *.rs set makeprg=cargo\ build
autocmd BufWritePost *.rs Neomake!
" errorformat…
