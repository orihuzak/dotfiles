UsePlugin 'vim-session'

" options
let g:session_autoload = 'no'
let g:session_autosave = 'yes'

" map
nnoremap [session] <Nop>
nmap <space>s [session]
nnoremap [session]s :SaveTabSession 
nnoremap [session]o :OpenTabSession 
nnoremap [session]r :RestartVim<cr>
nnoremap [session]c :CloseTabSession<cr>
nnoremap [session]d :DeleteSession<cr>
nnoremap [session]v :ViewSession<cr>

