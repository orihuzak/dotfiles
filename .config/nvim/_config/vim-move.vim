UsePlugin 'vim-move'

" matze/vim-move make easy to move lines

" alt-h/lで1文字の移動を無効化するためにデフォルトのマップを無効化する
let g:move_map_keys = 0

" 必要な機能だけマッピング
nmap <A-k> <Plug>MoveLineUp
nmap <A-j> <Plug>MoveLineDown
vmap <A-k> <Plug>MoveBlockUp
vmap <A-j> <Plug>MoveBlockDown
