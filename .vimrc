execute pathogen#infect()
syntax on
filetype plugin indent on

set backupdir=~/vimtmp/
set directory=~/vimtmp/
set undodir=~/vimtmp/

colorscheme atom

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2

set number              " show line numbers
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
"set hlsearch            " highlight matches
set nohlsearch

" set leader key
let mapleader=","

"Use space to select a word in all modes
nnoremap <space> viw

" Map Ctrl-u to turn a word to uppercase only in insert mode
" Read this mapping as: esc to visual mode select the word (viw), Uppercase it(U) then go back to insert mode (i)
inoremap <c-u> <esc>viwUi

"Can run commands like this; by mapping to a key binding; this e.g. will print hi
" nnoremap <c-d> :echo "hi"<enter>

"----Key mappings for managing .vimrc file----
" Open vimrc for edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap ss <esc>:w<cr>:echo "saved"<cr>
" surround a word with double quotes in normal mode
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap H <esc>0
nnoremap L <esc>$
" map jk combo to esc; no longer stretch to escape key
inoremap jk <esc>

" Change cursor shape
"set guicursor=i:ver25-iCursor
set guicursor=a:hor20-Cursor
