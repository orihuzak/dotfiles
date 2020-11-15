UsePlugin 'vim-airline'

" vim-airline settings

let g:airline#extensions#tabline#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty='⚡'

