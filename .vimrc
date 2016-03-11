
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
" plugin for file drawer
Plugin 'scrooloose/nerdtree'
"contorlP Fuzzy File finder
Plugin 'kien/ctrlp.vim.git'
" Tags browser from source code files
Plugin 'majutsushi/tagbar'
" Vim Airline--cool status bar
Plugin 'bling/vim-airline'
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
"Latex PDF Preview
Plugin 'xuhdev/vim-latex-live-preview'
"Latex plugin
Plugin	'lervag/vimtex'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
set tabstop=4
set shiftwidth=4
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
colorscheme molokai
let g:molokai_original = 1
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
"syntastic config
""let g:syntastic_c_checkers=['make','splint']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
""let g:syntastic_c++_clang_exec = 'usr/bin/clang'
""let g:syntastic_cpp_compiler = 'g++'
""let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
""let g:syntastic_check_on_open=1
""let g:syntastic_enable_signs=1
"let g:syntastic_cpp_check_header = 1
""let g:syntastic_cpp_auto_refresh_includes = 1
""let g:syntastic_cpp_clang_check_post_args = ""
"for latex-box
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""`
""""""""""""""""""""""""""LATEX STUFF""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:livepreview_previewer = 'evince'
autocmd FileType tex map <leader>s:LLPStartPreview<CR>
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
inoremap jj <esc>
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
