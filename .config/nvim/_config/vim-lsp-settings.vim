UsePlugin 'vim-lsp'
UsePlugin 'vim-lsp-settings'

" if executable("deno")
" 	augroup LspTypeScript
" 		autocmd!
" 		autocmd User lsp_setup call lsp#register_server({
" 			\ "name": "deno lsp",
" 			\ "cmd": {server_info -> ["deno", "lsp"]},
" 			\ "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), "tsconfig.json"))},
" 			\ "whitelist": ["typescript", "typescript.tsx"],
" 		\ })
" 	augroup END
" endif

let g:lsp_settings = {
  \ 'bash-language-server': { 'allowlist': ['sh', 'zsh'] }
\}

"" options
let g:lsp_auto_enable = 1
let g:lsp_preview_float = 1
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
nnoremap [vim-lsp]s :LspStatus<cr>
" install lang server, need vim-lsp-settings
nnoremap [vim-lsp]i :LspInstallServer<cr>
nnoremap [vim-lsp]d :LspPeekDefinition<cr>
nnoremap [vim-lsp]D :LspPeekDeclaration<CR>
nnoremap [vim-lsp]f :LspDocumentFormat<cr>
nnoremap [vim-lsp]l :LspCodeLens<cr>
nnoremap [vim-lsp]a :LspCodeAction<cr>
nnoremap [vim-lsp]t :LspPeekTypeDefinition<cr>
nnoremap [vim-lsp]h :LspHover<cr>
" 前後の診断(diagnostic)に移動する
nnoremap [vim-lsp]j :LspNextDiagnostic<cr>
nnoremap [vim-lsp]k :LspPreviousDiagnostic<cr>

nnoremap [vim-lsp]r :LspRename<cr>
nnoremap [vim-lsp]z :LspReferences<cr>
nnoremap [vim-lsp]s :LspDocumentSymbolSearch<cr>

