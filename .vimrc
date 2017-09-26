filetype off

set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
 
" tmux/vim compatability plugin
Plugin 'christoomey/vim-tmux-navigator'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" ColorSchemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'hzchirs/vim-material'
Plugin 'zcodes/vim-colors-basic'
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

let g:ycm_python_binary_path = 'python'
"nerd commenter
Plugin 'scrooloose/nerdcommenter'
"multi-line highlighting
Plugin 'terryma/vim-multiple-cursors'
"Latex plugin
Plugin 'vim-latex/vim-latex'
Plugin	'lervag/vimtex'
"Latex Live-preview
Plugin 'xuhdev/vim-latex-live-preview'
" Snippits for Python

"  Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
"Colorscheme

set t_Co=256
syntax on
colorscheme basic-dark


"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
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
let g:airline_theme='material'
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
noremap <LEADER>v :vsp 
"better splits
noremap <LEADER>s :sp 

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

"vimlatex-suit
helptags ~/.vim/bundle/vim-latex/doc     
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

map <F2> :set spell spelllang=en_us<CR>
let g:livepreview_previewer = 'open -a Preview'
