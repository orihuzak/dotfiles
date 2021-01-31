UsePlugin 'ctrlp.vim'
UsePlugin 'ctrlp-matchfuzzy'

let g:ctrlp_extension = ['quickfix', 'line', 'mixed']
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
" map
let g:ctrlp_map = ''
nnoremap [ctrlp] <Nop>
nmap <space>f [ctrlp]
nnoremap <silent> [ctrlp]f :CtrlP<cr>
nnoremap <silent> [ctrlp]s :CtrlPMixed<cr>
nnoremap <silent> [ctrlp]b :CtrlPBuffer<cr>
nnoremap <silent> [ctrlp]u :CtrlPMRU<cr>
nnoremap <silent> [ctrlp]l :CtrlPLine<cr>
nnoremap <silent> [ctrlp]q :CtrlPQuickfix<cr>

