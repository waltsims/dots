
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Delimate
Plugin 'raimondi/delimitmate'
"rainbow parens
Plugin 'luochen1990/rainbow'
"Syntax checker
Plugin 'scrooloose/syntastic'
"contorlP Fuzzy File finder
Plugin 'kien/ctrlp.vim.git'
" Tags browser from source code files
Plugin 'majutsushi/tagbar'
" EasyMotion recomended by Marten
Plugin 'easymotion/vim-easymotion'
"autopep8 formater for python
Plugin 'tell-k/vim-autopep8'
"automatic completion Plugin
Plugin 'Valloric/YouCompleteMe'
"nerd commenter
Plugin 'scrooloose/nerdcommenter'
"multi-line highlighting
Plugin 'terryma/vim-multiple-cursors'
"Latex plugin
Plugin	'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"ctags global and local
set tags=./tags,tags,~/.commontags
set nocompatible
set number
let name="Walter Simson"
set nowrap
set tabstop=2
set shiftwidth=2
set showmatch
set relativenumber
set number
set hlsearch
set incsearch
highlight ColorColumn ctermbg=cyan
set colorcolumn=80
set title
set laststatus=2
syntax on 
set t_Co=256
"auto open NERDTree
"ctr-p
let mapleader=" "
nnoremap <leader>. :CtrlPTag<cr>
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
"syntastic conifg
let g:syntastic_cpp_check_header = 1
"airline config
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""`
""""""""""""""""""""""""""FORMATING""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"yapf
autocmd FileType python nnoremap <leader>f :0,$!yapf<Cr>
"hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"replace escape with jj
inoremap jk <esc>
"better split
"better collons
noremap , : 
"better vsplits
noremap vv :vsp 
"better splits
noremap ss :sp 

"set rainbow on
let g:rainbow_active=1
"bracket highlighting fix
:hi MatchParen cterm=bold ctermbg=none ctermfg=none
let g:rainbow_conf = {'itermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']}
"task lists remap
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.cpp<CR>:cw<CR>
"Python config
autocmd FileType python set shiftwidth=2
autocmd FileType python set tabstop=2
autocmd FileType python set softtabstop=2
