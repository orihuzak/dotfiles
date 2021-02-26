UsePlugin 'vim-lsp'
UsePlugin 'vim-lsp-settings'

if executable("deno")
	augroup LspTypeScript
	autocmd!
	autocmd User lsp_setup call lsp#register_server({
		\ "name": "deno lsp",
		\ "cmd": {server_info -> ["deno", "lsp"]},
		\ "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), "tsconfig.json"))},
		\ "allowlist": ["typescript", "typescript.tsx"],
		\ "initialization_options": {
			\ "enable": v:true,
			\ "lint": v:true,
			\ "unstable": v:true,
			\ "codeLens": {
			\ 	"references": v:true,
			\ 	"referencesAllFunctions": v:true
			\ }
		\ },
	\ })
	augroup END
endif

let g:lsp_settings = {
  \ 'bash-language-server': { 'allowlist': ['sh', 'zsh'] }
\}

"" options
let g:lsp_auto_enable = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_enabled = 1
" これをonにするとdiagnostics windowがvimの真ん中に表示されて邪魔になる
let g:lsp_diagnostics_echo_cursor = 0
" virtual textを挿入しない
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_prefix = '> '
" diagnosticをcursorの近くに表示する
let g:lsp_diagnostics_float_cursor = 1

" diagnostics signs
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_signs_hint = {'text': 'ﯦ'}

" highilight
let g:lsp_document_highlight_enabled = 1
let g:lsp_diagnostics_highlights_enabled = 1
" semantic highlight
let g:lsp_semantic_enabled = 1
" diagnostics highlight
highlight link LspErrorHighlight Error
highlight link LspWarningHighlight Warning
highlight link LspInformationHighlight Information
" highlight link LspHintHighlight Hint
" highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=gree
" let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server', 'javascript-langage-server']

" map
nnoremap [vim-lsp] <Nop>
nmap <space>l [vim-lsp]
nnoremap [vim-lsp]s :LspStatus<cr>
" install lang server, need vim-lsp-settings
nnoremap [vim-lsp]i :LspInstallServer
nnoremap [vim-lsp]a :LspCodeAction<cr>
nnoremap [vim-lsp]d :LspDocumentDiagnostics<cr>
nnoremap [vim-lsp]f :LspDocumentFormat<cr>
nnoremap [vim-lsp]r :LspRename<cr>


nnoremap [diag] <Nop>
nmap <space>d [diag]
nnoremap [diag]l :LspCodeLens<cr>
nnoremap [diag]d :LspPeekDeclaration<cr>
nnoremap [diag]f :LspPeekDefinition<cr>
nnoremap [diag]t :LspPeekTypeDefinition<cr>
nnoremap [diag]h :LspHover<cr>
nnoremap [diag]r :LspReferences<cr>
nnoremap [diag]s :LspDocumentSymbolSearch<cr>
" 前後の診断(diagnostic)に移動する
nnoremap [diag]j :LspNextDiagnostic<cr>
nnoremap [diag]k :LspPreviousDiagnostic<cr>




