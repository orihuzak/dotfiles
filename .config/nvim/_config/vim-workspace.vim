UsePlugin 'vim-workspace'

" thaerkh/vim-workspace plugin settings

let g:workspace_autocreate =1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
" let g:workspace_autosave_always = 1
" let g:workspace_autosave = 1
nnoremap <silent> [vim]w :ToggleWorkspace<cr>

