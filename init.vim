" # Plugins #
call plug#begin()

Plug 'benekastah/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'machakann/vim-swap'
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" ## Language-specific plugins ##
Plug 'ap/vim-css-color'
Plug 'cespare/vim-toml'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'JulesWang/css.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'raichoo/purescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'

call plug#end()

set termguicolors
colorscheme jellybeans

" # Configuration #
set number
filetype plugin indent on
set ruler
set showcmd
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<
set list
set textwidth=0
set formatoptions=qjmn
set linebreak
set breakindent
set tabstop=8
set shiftwidth=4
set expandtab
set ignorecase smartcase
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set grepprg=rg\ --vimgrep
set scroll=5
set exrc
set secure
set backupcopy=yes " The default behaviour breaks filesystem watchers
set cursorline
set wildmenu

" . applies to each line of visual selectioen
vnoremap . :norm.<CR>

let $FZF_DEFAULT_COMMAND='rg --files'

" # Keybindings #
let mapleader="»"

" aww yiss! ↴
nnoremap <Leader>w :w<CR>
nnoremap <Leader>d :Dirvish %<CR>
nnoremap <Leader>p :Dirvish<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :Marks<CR>
nnoremap <Leader>git :Gstatus<CR>
nnoremap <Leader>ar :set rightleft<CR>
nnoremap <Leader>nar :set norightleft<CR>
nnoremap <Leader>rg :grep  .<LEFT><LEFT>
noremap é :
" CTRL-L normally redraws. <C-l> <C-l> still works
noremap! <C-l> <ESC>
noremap Q @q
nnoremap j gj
nnoremap k gk

:digraph \v 8628 " ↴
:digraph L> 8627 " ↳
:digraph /^ 8599 " ↗
:digraph \> 8600 " ↘

" # Language-specific options #

" ## Rust ##
autocmd FileType rust nnoremap <Leader>asm :RustEmitAsm<CR>

" ## Typescript ##
" .tsxもtypescriptとして扱う
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript

" ## Docker ##
autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile

" ## Python ##
autocmd FileType python setlocal formatprg=autopep8\ -
autocmd BufNewFile,BufRead *.py set makeprg=flake8
autocmd BufWritePost *.py Neomake

" ## Ruby ##
autocmd! BufWritePost *.rb Neomake rubocop
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby

" ## JS ##
let g:jsx_ext_required = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost *.js Neomake
