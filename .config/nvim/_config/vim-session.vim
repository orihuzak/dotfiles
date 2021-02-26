UsePlugin 'vim-session'

" options
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

" map
nnoremap [session] <Nop>
nmap <space>s [session]
nnoremap [session]s :SaveSession<cr>
nnoremap [session]o :OpenSession<cr>
nnoremap [session]r :RestartSession<cr>
nnoremap [session]c :CloseSession<cr>
nnoremap [session]d :DeleteSession<cr>
nnoremap [session]v :ViewSession<cr>
