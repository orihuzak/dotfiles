UsePlugin 'vim-lsp'
UsePlugin 'vim-lsp-settings'

let g:lsp_settings = {
  \ 'bash-language-server': { 'allowlist': ['sh', 'zsh'] }
\}
" let g:lsp_preview_float = 1
" lspの診断機能をon
let g:lsp_diagnostics_enabled = 1
" これをonにするとterminalの真ん中にdiagnostics windowが表示されてしまう
let g:lsp_diagnostics_echo_cursor = 0
" virtual textを挿入しない
let g:lsp_diagnostics_virtual_text_enabled = 0
" cursorが該当行のときに
let g:lsp_diagnostics_float_cursor = 1

" diagnostics signs
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
" let g:lsp_diagnostics_signs_hint = {'text': '!'}

" highilight
let g:lsp_document_highlight_enabled = 1
" semantic highlight
let g:lsp_semantic_enabled = 1
" diagnostics highlight
highlight link LspErrorHighlight Error
highlight link LspWarningHighlight Warning
highlight link LspInformationHighlight Information
" highlight link LspHintHighlight Hint
" highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

" let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server', 'javascript-langage-server']

" map
nnoremap [vim-lsp] <Nop>
nmap <space>l [vim-lsp]
nnoremap <silent> [vim-lsp]s :LspStatus<cr>
" install lang server, need vim-lsp-settings
nnoremap <silent> [vim-lsp]i :LspInstallServer<cr>
nnoremap <silent> [vim-lsp]d :LspDefinition<cr>
nnoremap <silent> [vim-lsp]f :LspDocumentFormat<cr>
nnoremap <silent> [vim-lsp]l :LspCodeLens<cr>
nnoremap <silent> [vim-lsp]a :LspCodeAction<cr>
nnoremap <silent> [vim-lsp]t :LspPeekTypeDefinition<cr>
nnoremap <silent> [vim-lsp]h :LspHover<cr>
" 前後の診断(diagnostic)に移動する
nnoremap <silent> [vim-lsp]j :LspNextDiagnostic<cr>
nnoremap <silent> [vim-lsp]k :LspPreviousDiagnostic<cr>

