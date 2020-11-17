UsePlugin 'coc.nvim'

" neoclide/coc.nvim

let g:coc_global_extensions = [
\ 'coc-sh',
\ 'coc-git',
\ 'coc-css',
\ 'coc-html',
\ 'coc-json',
\ 'coc-vimlsp',
\ 'coc-python',
\ 'coc-tsserver',
\ 'coc-vetur',
\ 'coc-rls',
\ 'coc-yaml',
\ 'coc-eslint',
\ 'coc-stylelintplus',
\ 'coc-markdownlint',
\ 'coc-snippets',
\ 'coc-emmet',
\ 'coc-tabnine',
\ 'coc-highlight',
\ 'coc-actions',
\ 'coc-lists',
\ 'coc-explorer',
\ ]

"" coc
nnoremap [coc] <Nop>
nmap <space>c [coc]

" coc-actions
nnoremap <silent> [coc]a :CocCommand actions.open<cr>

" coc-lists
nnoremap [coc]l :CocList<cr>
" nnoremap <space>f :CocList gfiles<cr>

" Format
nnoremap <silent> [coc]f :<C-u>call CocAction('format')<cr>
" nmap <space>fmt <Plug>(coc-format)
" nnoremap <silent> [coc]f <Plug>(coc-format)
" Formatting selected code.
" xmap <space>f <Plug>(coc-format-selected)
" nmap <space>f <Plug>(coc-format-selected)


" cocのDiagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
"スペースhでHover
nmap <space>h :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <space>df <Plug>(coc-definition)
"スペースrfでReferences
nmap <space>rf <Plug>(coc-references)
"スペースrnでRename
nmap <space>rn <Plug>(coc-rename)

" coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" coc-git
autocmd CursorHold * CocCommand git.refresh

" coc explorer file manager
nmap <space>e :CocCommand explorer<cr>

