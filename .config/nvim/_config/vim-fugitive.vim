UsePlugin 'vim-fugitive'

" vim-fugitive settings
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR>
" git add current file
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Git commit -v<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
" pushやmergeは危ない気がするので無効化
" nnoremap <silent> [fugitive]m :Gmerge<CR>
" nnoremap <silent> [fugitive]p :Gpush<CR>

