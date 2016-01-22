" # Plugins #
call plug#begin()

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'benekastah/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nanotech/jellybeans.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" ## Language-specific plugins ##
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
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
set nohidden

let g:deoplete#enable_at_startup = 1
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "my-snippets"]

" . applies to each line of visual selectioen
vnoremap . :norm.<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" colorscheme solarized
" see https://github.com/neovim/neovim/issues/2953
autocmd VimEnter * colorscheme jellybeans

" # Keybindings #
let mapleader="»"
let maplocalleader="«"

" aww yiss! ↴
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :ls<CR>:b<space>
nnoremap <Leader>d :Explore<CR>:b<space>
nnoremap <Leader>tt :terminal<CR>
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>ag :Ag<Space>
nnoremap <Leader>gr :AgBuffer<Space>
nnoremap <Leader>git :Gstatus<CR>
nnoremap <Leader>ar :set rightleft<CR>
nnoremap <Leader>nar :set norightleft<CR>
noremap é :
" CTRL-L normally redraws. <C-l> <C-l> still works
noremap! <C-l> <ESC>

:digraph \v 8628 " ↴
:digraph L> 8627 " ↳
:digraph /^ 8599 " ↗
:digraph \> 8600 " ↘

" # Language-specific options #

" .tsxもtypescriptとして扱う
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript

" ## Rust ##
autocmd BufNewFile,BufRead *.rs set makeprg=cargo\ check
autocmd BufWritePost *.rs Neomake!
let g:rustfmt_autosave = 1
" errorformat…
