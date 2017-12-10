call plug#begin('~/.vim/bundle')
" tmux/vim compatability plugin
Plug 'christoomey/vim-tmux-navigator'
" git tools that I don't use
Plug 'tpope/vim-fugitive'
" ColorSchemes
Plug 'altercation/vim-colors-solarized'
Plug 'hzchirs/vim-material'
Plug 'zcodes/vim-colors-basic'
"Delimate
Plug 'raimondi/delimitmate'
"rainbow parens
Plug 'luochen1990/rainbow'
"Syntax checker
Plug 'w0rp/ale'
"Gutentags for auto ctag generation
Plug 'ludovicchabant/vim-gutentags'
"contorlP Fuzzy File finder
Plug 'ctrlpvim/ctrlp.vim'
" Tags browser from source code files
Plug 'majutsushi/tagbar'
" EasyMotion recomended by Marten
Plug 'easymotion/vim-easymotion'
"automatic completion Plugin
Plug 'Valloric/YouCompleteMe'
"nerd commenter
Plug 'scrooloose/nerdcommenter'
"multi-line highlighting
Plug 'terryma/vim-multiple-cursors'
"Latex plugin
Plug 'lervag/vimtex'
" Snippits for Python
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
call plug#end()

let g:ycm_python_binary_path = 'python'

" Trigger configuration. 
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsSnippetDir='~/.vim/UltiSnips'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

"Colorscheme

set t_Co=256
syntax on
colorscheme basic-dark


"ctags global and local
filetype plugin indent on
set tags=./tags,tags,~/.commontags
set number
let g:name='Walter Simson'
"set nowrap
set showmatch
set relativenumber
set number
set hlsearch
set incsearch
highlight ColorColumn ctermbg=cyan
set colorcolumn=80
set title
set laststatus=2
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"auto open NERDTree

"ctr-p
let g:mapleader=' '
nnoremap <leader>. :CtrlPTag<cr>
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
"airline config
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
let g:airline_theme='material'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""`
""""""""""""""""""""""""""FORMATING""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

if exists('+breakindent')
  set breakindent
  set showbreak=..  " comment so that the whitespace works >.>
endif

"set rainbow on
let g:rainbow_active=1
"bracket highlighting fix
:hi MatchParen cterm=bold ctermbg=none ctermfg=none
let g:rainbow_conf = {'itermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']}
"task lists remap
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.cpp<CR>:cw<CR>
"Python config
augroup python
  "yapf
  autocmd FileType python nnoremap <leader>f :0,$!yapf<Cr>
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set tabstop=4
  autocmd FileType python set softtabstop=4
  autocmd FileType python set expandtab
augroup END

set splitright "open vertical splits on RHS


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
let g:vimtex_view_method = 'zathura'
