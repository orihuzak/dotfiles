UsePlugin 'asyncomplete.vim'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nnoremap [asyncomplete] <Nop>
nmap <space>a [asyncomplete]
nnoremap [asyncomplete]r <Plug>(asycomplete_force_refresh)
