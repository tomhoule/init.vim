" # Plugins #
call plug#begin()

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
" Plug 'fcpg/vim-farout'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kyuhi/vim-emoji-complete'
Plug 'machakann/vim-swap'
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'

" ## Language-specific plugins ##
Plug 'ap/vim-css-color'
Plug 'cespare/vim-toml'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'JulesWang/css.vim'
" Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'
Plug 'raichoo/purescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'

" ## Typescript ##
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'quramy/tsuquyomi'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/vimproc'

" ## LSP ##
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

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
nnoremap <Leader>re :Rename<SPACE>
nnoremap <Leader>x :Delete<CR>
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

let g:ale_linters = {
            \   'rust': [''],
            \   'typescript': ['tslint'],
            \}

" ## Rust ##
autocmd FileType rust nnoremap <Leader>asm :RustEmitAsm<CR>
autocmd FileType rust setlocal omnifunc=LanguageClient#complete

" ## Typescript ##
autocmd FileType typescript nmap <buffer> <Leader>t :
            \ <C-u>echo tsuquyomi#hint()<CR>
autocmd BufNewFile,BufRead *.tsx,*.jsx,*.js set filetype=typescript.jsx


" ## Docker ##
autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile

" ## Python ##
autocmd FileType python setlocal formatprg=autopep8\ -
autocmd BufNewFile,BufRead *.py set makeprg=flake8
autocmd BufNewFile,BufRead *.py ALEEnable

" ## Ruby ##
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead *.rb ALEEnable

" ## JS ##
" let g:jsx_ext_required = 0
autocmd BufNewFile,BufRead *.js ALEEnable

" ## LSP ##
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
