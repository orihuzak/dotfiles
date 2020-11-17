UsePlugin 'vim-clap'

" vim-clap settings

" vim-clap
nnoremap [vim-clap] <Nop>
nmap <space>f [vim-clap]
nnoremap <silent> [vim-clap]f :Clap gfiles<cr>
nnoremap <silent> [vim-clap]e :Clap filer<CR>
nnoremap <silent> [vim-clap]s :Clap files<CR>
nnoremap <silent> [vim-clap]d :Clap git_diff_files<CR>
nnoremap <silent> [vim-clap]p :Clap providers<CR>
nnoremap <silent> [vim-clap]g :Clap grep<CR>
nnoremap <silent> [vim-clap]/ :Clap blines<CR>

let g:clap_layout = {
\ 'relative': 'editor',
\ 'width': '80%',
\ 'col': '10%',
\ 'height': '50%',
\ 'row': '25%'
\}
let g:clap_theme = 'material_design_dark'
" これenableすると検索のマッチングがおかしくなる
" let g:clap_enable_icon = 1

