call plug#begin('~/.config/nvim/plugged')

" VIM HELPERS
" ---------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ---------------------------------------------------

" ALL LANGUAGES
" ---------------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
" ---------------------------------------------------

" CLOJURE/CLOJURESCRIPT
" ---------------------------------------------------
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/paredit.vim'
" ---------------------------------------------------

" ELM
" ---------------------------------------------------
Plug 'elmcast/elm-vim'
" ---------------------------------------------------

" JAVASCRIPT
" ---------------------------------------------------
Plug 'jelera/vim-javascript-syntax'
" ---------------------------------------------------

" COLOR THEMES
" ---------------------------------------------------
Plug 'jeffcato/hula.vim'
" airline theme
Plug 'jeffcato/hulaline.vim' 
" ---------------------------------------------------

call plug#end()

" AIRLINE CONFIGURATION
" ---------------------------------------------------
let g:airline_theme = 'hulaline'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.linenr    = '⏎'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.paste     = 'Þ'
let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" ---------------------------------------------------

" ALE CONFIGURATION
" ---------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" ---------------------------------------------------

" GENERAL CONFIGURATION
" ---------------------------------------------------

" map leader to ,
let mapleader=','

" javascript
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nowrap
set ruler
set nomodeline
set backspace=indent,eol,start
set scrolloff=10
set hidden
filetype plugin indent on
filetype plugin on

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" encoding
set bomb
set ttyfast
set binary
set spelllang=en
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" allows :find to work in sub-dirs
set path+=**
set wildmode=longest,full
set wildmenu

" no one is really happy until you have these shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" syntax highlighting
set t_Co=256
syntax on
autocmd BufEnter * :syntax sync fromstart
colorscheme hula

" whitespace
hi NonText ctermfg=238
hi SpecialKey ctermfg=238
set listchars=space:‧,eol:¬,tab:··
set nolist
set fillchars-=vert:\| 
if !exists('*TrimWhitespace')
	function TrimWhitespace()
		%s/\s\+$//e
	endfunction
endif

nnoremap <silent><leader>S :call TrimWhitespace()<CR>

" swp and stuff
set nobackup
set noswapfile
set fileformats=unix,dos,mac
set showcmd
set shell=/bin/bash

" keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" no console pops up
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif
set undolevels=1000 "maximum number of changes that can be undone
" ---------------------------------------------------

" NERDTREE CONFIGURATION
" ---------------------------------------------------
nnoremap <silent><leader>e :NERDTreeToggle<CR>
" ---------------------------------------------------
