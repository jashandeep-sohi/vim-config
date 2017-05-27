" Theme settings
colorscheme solarized
set background=dark

" Enable sytax highlighting
syntax enable

" Enable line numbers
set number
set relativenumber

" Bash style command auto-complete
set wildmode=longest,list

" Fancy backspace behaviour
set backspace=indent,eol,start

" Be smart about tabs
set smarttab

" Make the splitting more natural
set splitbelow
set splitright

" Highlight cursor line/column & 80th column
set cursorline
set cursorcolumn
set colorcolumn=80

" Spacing settings
set tabstop=2
set expandtab
set shiftwidth=2

" Modeline
set modeline | doautocmd BufRead
set modelines=5

" Case (in)sensitive search
set ignorecase
set smartcase

" Let me mange my spacing
filetype indent off
set autoindent
set nosmartindent
set nocindent
set indentexpr=

" Let's not load file specific settings (reason: too many unknown defaults)
filetype plugin off

" Write as sudo
command W w !sudo -A tee % > /dev/null
