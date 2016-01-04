" # Plugins #
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'jamessan/vim-gnupg'
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-fugitive', { 'on': ['Gstatus', 'Gdiff', 'Gcommit', 'Git'] }
Plug 'tpope/vim-surround'

" ## Language-specific plugins ##
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

Plug 'ebfe/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim'

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
set foldmethod=manual

" . applies to each line of visual selection
vnoremap . :norm.<CR>

set background=dark
colorscheme solarized

" # Keybindings #
let mapleader="»"
let maplocalleader="«"

" aww yiss! ↴
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :ls<CR>:b<space>
nnoremap <Leader>tt :terminal<CR>
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>f :find<space>*
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
:digraph pi 127829 " 🍕 ∀

" # Language-specific options #

" .tsxもtypescriptとして扱
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript

" ## Rust ##
autocmd BufNewFile,BufRead *.rs set makeprg=cargo\ check
autocmd BufWritePost *.rs Neomake!
let g:rustfmt_autosave = 1
let g:racer_cmd="~/.multirust/cargo/bin/racer/"
" errorformat…
