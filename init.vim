" # Plugins #
call plug#begin()

Plug 'benekastah/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

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
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set grepprg=ag\ --vimgrep

" . applies to each line of visual selectioen
vnoremap . :norm.<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" see https://github.com/neovim/neovim/issues/2953
autocmd VimEnter * colorscheme jellybeans

let g:deoplete#enable_at_startup=1
let g:UltiSnipsSnippetDirectories=["snipts"]

" # Keybindings #
let mapleader="»"

" aww yiss! ↴
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :ls<CR>:b<space>
nnoremap <Leader>d :Dirvish %<CR>
nnoremap <Leader>p :Dirvish<CR>
nnoremap <Leader>tt :terminal<CR>
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>f :FZF<CR>
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

" ## Typescript ##
" .tsxもtypescriptとして扱う
let g:neomake_typescript_tslint_maker = {
    \ 'args': ['%p'],
    \ 'errorformat': '%f[%l\, %c]: %m',
    \ }
let g:neomake_typescript_enabled_makers = ['tslint','tsc']
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript
autocmd BufWritePost *.{ts,tsx} Neomake

" ## Docker ##
autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile

" ## Rust ##
autocmd BufNewFile,BufRead *.rs set makeprg=cargo\ check
autocmd BufWritePost *.rs Neomake!
let g:rustfmt_autosave = 1

" ## Java ##
autocmd FileType java setlocal errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
autocmd BufNewFile,BufRead *.java set makeprg=mvn\ -q\ compile
autocmd BufNewFile,BufRead *.java let g:neomake_open_list = 1
autocmd BufWritePost *.java Neomake!

" ## Python ##
autocmd FileType python setlocal formatprg=autopep8\ -
autocmd BufNewFile,BufRead *.py set makeprg=flake8
autocmd BufWritePost *.py Neomake
