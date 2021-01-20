UsePlugin 'popup'
UsePlugin 'plenary'
UsePlugin 'telescope'

" map
nnoremap [telescope] <Nop>
nmap <space>s [telescope]
" search filename
nnoremap <silent> [telescope]f :Telescope find_files<cr>

