""" General

let g:name='Walter Simson'
let g:mapleader=','
set showmatch
set relativenumber
set number
set hlsearch
set incsearch

set title
set laststatus=2
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" Better collons
noremap <leader> : 

" Better vsplits
noremap <leader>v :vsp 
" Better splits
noremap <leader>s :sp 

" Hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Re-open window at last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif



""" Color Scheme

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
syntax on



"""" Plugings

call plug#begin('~/.vim/bundle')
" tmux/vim compatability plugin
Plug 'christoomey/vim-tmux-navigator'
" git tools that I don't use
Plug 'tpope/vim-fugitive'
" ColorSchemes
Plug 'altercation/vim-colors-solarized'
Plug 'hzchirs/vim-material'
Plug 'zcodes/vim-colors-basic'
Plug 'chriskempson/base16-vim'
"Delimate
Plug 'raimondi/delimitmate'
"rainbow parens
Plug 'luochen1990/rainbow'
"Syntax checker
Plug 'dense-analysis/ale'
"Gutentags for auto ctag generation
Plug 'ludovicchabant/vim-gutentags'
"contorlP Fuzzy File finder
Plug 'ctrlpvim/ctrlp.vim'
" Tags browser from source code files
Plug 'majutsushi/tagbar'
" EasyMotion recomended by Marten @cqql
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
" vim-yapf
" Plug 'mindriot101/vim-yapf'
call plug#end()

" YCM Config
let g:ycm_python_binary_path = 'python'
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_next_completion=['<c-n>']

" Ultisnips Config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:snips_author='Walter Simson'
let g:snips_email='walter.simson@tum.de'
let g:UltiSnipsEditSplit='vertical'
let g:ultisnips_python_style='google'

" Ctrl-P Config
nnoremap <leader>. :CtrlPTag<cr>

" Ctags Config
filetype plugin indent on
set tags=./tags,tags,~/.commontags

" Rainbow Parens Config
let g:rainbow_active=1
let g:rainbow_conf = {'itermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']}
:hi MatchParen cterm=bold ctermbg=none ctermfg=none


"auto open NERDTree
" map <leader>f :NERDTreeToggle<CR>


""" File specific configs 

" Makefiles

" Only tabs
autocmd FileType make setlocal noexpandtab


" Python Files

augroup python
  "yapf
  autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set tabstop=4
  autocmd FileType python set softtabstop=4
  autocmd FileType python set expandtab
augroup END


" Latex Files

if exists('+breakindent')
  set breakindent
  set showbreak=..  " comment so that the whitespace works >.>
endif

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

