UsePlugin 'vim-session'

" options
let g:session_autoload = 'no'
let g:session_autosave = 'yes'

" map
nnoremap [session] <Nop>
nmap <space>s [session]
nnoremap [session]s :SaveSession 
nnoremap [session]o :OpenSession 
nnoremap [session]r :RestartSession<cr>
nnoremap [session]c :CloseSession<cr>
nnoremap [session]d :DeleteSession<cr>
nnoremap [session]v :ViewSession<cr>

