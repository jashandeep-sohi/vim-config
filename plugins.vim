" Enable deoplete.
let g:deoplete#enable_at_startup=1

" Disable preview window
set completeopt-=preview

" Always show airline
set laststatus=2

" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_nr_show = 1

" Enable powerline font symbols
let g:airline_powerline_fonts = 1


" Run Neomake on write
autocmd! BufWritePost * Neomake


" Disbale docstrings in preview window for auto complete
let g:deoplete#sources#jedi#show_docstring = 0
