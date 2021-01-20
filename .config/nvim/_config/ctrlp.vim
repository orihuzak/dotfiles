UsePlugin 'ctrlp.vim'

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" map
let g:ctrlp_map = ''
nnoremap [ctrlp] <Nop>
nmap <space>s [ctrlp]
nnoremap <silent> [ctrlp]f :CtrlP<cr>
nnoremap <silent> [ctrlp]s :CtrlPMixed<cr>
nnoremap <silent> [ctrlp]b :CtrlPBuffer<cr>
nnoremap <silent> [ctrlp]u :CtrlPMRU<cr>

