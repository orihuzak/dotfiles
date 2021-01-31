UsePlugin 'vim-lsp'
UsePlugin 'vim-lsp-settings'

let g:lsp_settings = {
  \ 'bash-language-server': { 'allowlist': ['sh', 'zsh'] }
\}

" map
nnoremap [vim-lsp] <Nop>
nmap <space>l [vim-lsp]
nnoremap <silent> [vim-lsp]s :LspStatus<cr>
" install lang server, need vim-lsp-settings
nnoremap <silent> [vim-lsp]i :LspInstallServer<cr>
nnoremap <silent> [vim-lsp]f :LspDocumentFormat<cr>
nnoremap <silent> [vim-lsp]l :LspCodeLens<cr>
nnoremap <silent> [vim-lsp]a :LspCodeAction<cr>

