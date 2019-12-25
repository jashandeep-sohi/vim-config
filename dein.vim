"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/gamma/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/gamma/.cache/dein')
  call dein#begin('/home/gamma/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/gamma/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Autocomplete
  call dein#add("Shougo/deoplete.nvim")

  " Autocomplete Jedi (Python)
  call dein#add("zchee/deoplete-jedi")

  " Solarized theme
  call dein#add("altercation/vim-colors-solarized")

  " Tmux/vim navigation pane intergration
  call dein#add("christoomey/vim-tmux-navigator")

  " Status line & themes
  call dein#add("vim-airline/vim-airline")
  call dein#add("vim-airline/vim-airline-themes")

  " File list menu
  call dein#add("scrooloose/nerdtree")

  " Syntax checker
  call dein#add("neomake/neomake")

  " Whitespace highlighter
  call dein#add("ntpeters/vim-better-whitespace")

  " Working with braces
  call dein#add("tpope/vim-surround")

  " Setup . to repeat the whole map
  call dein#add("tpope/vim-repeat")

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
:
