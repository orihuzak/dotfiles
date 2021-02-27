UsePlugin 'asyncomplete.vim'
UsePlugin 'asyncomplete-lsp.vim'

let g:asyncomplete_auto_popup = 1
" map
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nnoremap [asyncomplete] <Nop>
nmap <space>a [asyncomplete]
nnoremap [asyncomplete]r <Plug>(asycomplete_force_refresh)

