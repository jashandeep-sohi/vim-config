" vi improved
set nocompatible

" Add dein to run path
set runtimepath+=/home/gamma/.cache/dein/repos/github.com/Shougo/dein.vim

" dein config
if dein#load_state('/home/gamma/.cache/dein')
  call dein#begin('/home/gamma/.cache/dein')

  " manage dein with dein
  call dein#add('/home/gamma/.cache/dein/repos/github.com/Shougo/dein.vim')

  " add a dein ui
  call dein#add('wsdjeg/dein-ui.vim')

  " Solarized theme
  call dein#add("altercation/vim-colors-solarized")

  " code completion
  call dein#add("neoclide/coc.nvim", {"merged": 0, "rev": "release"})

  " Status line & themes
  call dein#add("vim-airline/vim-airline")
  call dein#add("vim-airline/vim-airline-themes")

  " Whitespace highlighter
  call dein#add("ntpeters/vim-better-whitespace")

  " Working with braces
  call dein#add("tpope/vim-surround")

  " Setup . to repeat the whole map
  call dein#add("tpope/vim-repeat")

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


" filetype detection
filetype on

" load plugin files for specific files types
filetype plugin off

" load indent file for file types
filetype indent off

" only use indent from previous line
set autoindent
set nosmartindent
set nocindent
set indentexpr=

" enable syntax highlighting
syntax enable

" Leader
let mapleader = "\<Space>"

" Theme
colorscheme solarized

" theme color
set background=light

" line numbers
set number

" relative to current cursor line
set relativenumber

" Bash style command auto-complete
set wildmode=longest,list

" backspace over autoindent, line breaks & "start of insert"?
set backspace=indent,eol,start

" tab settings
set smarttab
set expandtab " expand <TAB> to spaces
set tabstop=2 " spaces per <TAB>
set shiftwidth=2 " spaces per indent/auto indent

" Make the splitting more natural
" split left to right, top to bottom
set splitbelow
set splitright

" Highlight cursor line/column & 80th column
set cursorline
set cursorcolumn
set colorcolumn=80

" Modeline
set nomodeline " enable/disable
set modelines=5 " number of lines to check

" Case (in)sensitive search
set ignorecase
set smartcase

" Always show status line
set laststatus=2

" Write as sudo
command SudoWrite w !sudo -A tee % > /dev/null

" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_nr_show = 1

" Enable powerline font symbols
let g:airline_powerline_fonts = 1

" faster window navigation
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wh <c-w>h
nnoremap <leader>wl <c-w>l

" equal out windows
nnoremap <leader>w= <c-w>=

" create splits
 nnoremap <leader>ws :vsplit<cr>
 nnoremap <leader>wsv :vsplit<cr>
 nnoremap <leader>wsh :split<cr>

" load coc.vim config
runtime coc.vim
