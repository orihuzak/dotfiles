UsePlugin 'coc.nvim'
UsePlugin 'vim-airline'

let g:coc_global_extensions = [
\ 'coc-sh',
\ 'coc-git',
\ 'coc-css',
\ 'coc-html',
\ 'coc-json',
\ 'coc-vimlsp',
\ 'coc-python',
\ 'coc-tsserver',
\ 'coc-deno',
\ 'coc-vetur',
\ 'coc-rls',
\ 'coc-yaml',
\ 'coc-eslint',
\ 'coc-stylelintplus',
\ 'coc-markdownlint',
\ 'coc-emmet',
\ 'coc-snippets',
\ 'coc-tabnine',
\ 'coc-highlight',
\ 'coc-actions',
\ 'coc-lists',
\ 'coc-explorer',
\ ]

" extensions memo
" \ 'coc-fzf-preview',
" coc-fzf-preview
" nnoremap <space>f :CocCommand fzf-preview.GitFiles<cr>

" trigger key for move focus to the next snippet position
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

" coc-git
autocmd CursorHold * CocCommand git.refresh

" highlighting
" cocのDiagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" vim-airline
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

""" map
"" completion
" <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" <cr> to confirm first completion when no item has been focused
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" <cr> to confirm completion with format
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc explorer file manager
nmap <space>e :CocCommand explorer<cr>
nnoremap [coc] <Nop>
nmap <space>c [coc]
" coc commands
nnoremap [coc]ls :CocList<cr>
nnoremap [coc]s :CocSearch
nnoremap [coc]i :CocInstall<CR>
nnoremap [coc]q :CocFix<cr>
nnoremap [coc]c :CocConfig<cr>
nnoremap [coc]u :CocUpdate<cr>
nmap [coc]r <Plug>(coc-rename)
nmap [coc]f <Plug>(coc-format)

" diagnostics
nnoremap [diag] <Nop>
nmap <space>d [diag]
nmap [diag]j <Plug>(coc-diagnostic-next)
nmap [diag]k <Plug>(coc-diagnostic-prev)
" nmap [diag]i <Plug>(coc-diagnostic-info)
nmap [diag]h :call CocAction("doHover")<cr>
nmap [diag]d :call CocAction("diagnosticPreview")<cr>
nmap [diag]f <Plug>(coc-definition)
nmap [diag]c <Plug>(coc-declaration)
nmap [diag]r <Plug>(coc-references)
"スペースhでHover
nmap <space>h :<C-u>call CocAction('doHover')<cr>

" coclist
nnoremap [coclist] <Nop>
nmap <space>l [coclist]
nnoremap [coclist]s :CocList gfiles<cr>
nnoremap [coclist]b :CocList buffers<cr>
nnoremap [coclist]l :CocList lines<CR>
nnoremap [coclist]u :CocList mru<cr>
nnoremap [coclist]c :CocList commands<cr>

