UsePlugin 'fzf-preview.vim'

" map
nnoremap [fzf-p] <Nop>
nmap <space>f [fzf-p]
nnoremap <silent> [fzf-p]f :FzfPreviewGitFilesRpc<cr>
nnoremap <silent> [fzf-p]s :FzfPreviewProjectFilesRpc<cr>
nnoremap <silent> [fzf-p]b :FzfPreviewBuffersRpc<cr>
nnoremap <silent> [fzf-p]u :FzfPreviewProjectMruFilesRpc<cr>
nnoremap <silent> [fzf-p]l :FzfPreviewLinesRpc<cr>
nnoremap <silent> [fzf-p]c :FzfPreviewCommandPaletteRpc<cr>
nnoremap <silent> [fzf-p]g :FzfPreviewGitActionsRpc<cr>
nnoremap <silent> [fzf-p]r :FzfPreviewFromResourcesRpc<cr>


