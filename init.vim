" # Plugins #
call plug#begin()

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" ## Language-specific plugins ##
Plug 'ap/vim-css-color'
Plug 'cespare/vim-toml'
Plug 'dcharbon/vim-flatbuffers'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'JulesWang/css.vim'
Plug 'raichoo/purescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'

call plug#end()

set termguicolors
colorscheme jellybeans

" # Configuration #
filetype plugin indent on
set autowrite
set backupcopy=yes " The default behaviour breaks filesystem watchers
set breakindent
set cursorline
set expandtab
set exrc
set formatoptions=qjmn
set grepprg=rg\ --vimgrep
set ignorecase smartcase
set linebreak
set list
set listchars=tab:▸\ ,trail:¤,nbsp:·,extends:>,precedes:<
set number
set ruler
set scroll=5
set secure
set shiftwidth=4
set showcmd
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set tabstop=8
set textwidth=0
set wildmenu
" Required for languageclient-neovim
set hidden

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1

" Sneak
let g:sneak#label = 1

let $FZF_DEFAULT_COMMAND='rg --files'

" # Keybindings #
let mapleader="»"

nnoremap <Leader>ar :set rightleft<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>d :Dirvish %<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>git :Gstatus<CR>
nnoremap <Leader>h :nohlsearch<CR>
nmap <Leader>j "=system('gitmoji-selector')<C-M>P
nnoremap <Leader>m :Marks<CR>
nnoremap <Leader>nar :set norightleft<CR>
nnoremap <Leader>p :Dirvish<CR>
nnoremap <Leader>re :Rename<SPACE>
nnoremap <Leader>rg :grep  .<LEFT><LEFT>
nnoremap <Leader>sp :set paste<CR>
nnoremap <Leader>snp :set nopaste<CR>
" aww yiss! ↴
nnoremap <Leader>w :w<CR>

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

" ## Rust ##
autocmd FileType rust nnoremap <Leader>asm :RustEmitAsm<CR>
let g:rustfmt_fail_silently=0
let g:rustfmt_autosave=1

" ## Typescript ##
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set shiftwidth=2

" ## Docker ##
autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile

" ## Python ##
autocmd FileType python setlocal formatprg=autopep8\ -
autocmd BufNewFile,BufRead *.py set makeprg=flake8

" ## Ruby ##
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby

" ## LaTeX ##
autocmd BufNewFile,BufRead *.tex.tera set filetype=tex

" ## JS ##
autocmd BufNewFile,BufRead *.js set filetype=javascript

" ## HTML ##
autocmd BufNewFile,BufRead *.html.hbs set filetype=html

" Lightline
let g:lightline = {}
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'gitbranch', 'relativepath', 'modified' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
            \ 'left': [ [ 'relativepath' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ] ] }
let g:lightline.component_function = {
            \ 'gitbranch': 'fugitive#head'
            \ }

" LSP "
let g:LanguageClient_serverCommands = {
        \ 'rust': ['rls'],
        \ 'ruby': ['solargraph', 'stdio'],
        \ }

autocmd FileType rust,ruby nnoremap <F5> :call LanguageClient_contextMenu()<CR>
autocmd FileType rust,ruby nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd FileType rust,ruby nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd FileType rust,ruby nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
autocmd FileType rust,ruby nnoremap <silent> <F12> :call LanguageClient#textDocument_references()<CR>
autocmd FileType rust,ruby nnoremap <silent> <C-t> :call LanguageClient#workspace_symbol()<CR>
autocmd FileType rust,ruby nnoremap <silent> <C-.> :call LanguageClient#textDocument_codeAction()<CR>

" Completion "
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
