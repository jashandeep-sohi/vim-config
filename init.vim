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

  " better autocomplete?
  call dein#add("neoclide/coc.nvim", {"merged": 0, "rev": "release"})

  " Status line & themes
  call dein#add("vim-airline/vim-airline")
  call dein#add("vim-airline/vim-airline-themes")

  " Syntax checker
  call dein#add("neomake/neomake")

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

" Path to Python exec (with pynvim installed)
let g:python3_host_prog = expand("$HOME/code/.venvs/python-nvim/bin/python")
let g:python_host_prog = expand("$HOME/code/.venvs/python2-nvim/bin/python")

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
nnoremap <leader>w= <c-w>e

" create splits
 nnoremap <leader>ws :vsplit<cr>
 nnoremap <leader>wsv :vsplit<cr>
 nnoremap <leader>wsh :split<cr>

" coc.nvim
" TODO: clean these up
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
