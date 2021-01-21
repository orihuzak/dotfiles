UsePlugin 'vim-gitgutter'

" let g:gitgutter_highlight_lines = 2 " git statusに合わせて行の背景色を変更する
let g:gitgutter_highlight_linenrs = 1 " line number highlight
let g:gitgutter_override_sign_column_highlight = 0
" highlight sign
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" map
" nmap <space>g :GitGutterSignsToggle<CR>
nmap ]h :GitGutterNextHunk
nmap [h :GitGutterPrevHunk

