UsePlugin 'fzf-preview.vim'

" map
nnoremap [fzf-p] <Nop>
nmap <space>f [fzf-p]
nnoremap [fzf-p]f :FzfPreviewGitFilesRpc<cr>
nnoremap [fzf-p]s :FzfPreviewProjectFilesRpc<cr>
nnoremap [fzf-p]b :FzfPreviewBuffersRpc<cr>
nnoremap [fzf-p]u :FzfPreviewProjectMruFilesRpc<cr>
nnoremap [fzf-p]l :FzfPreviewLinesRpc<cr>
nnoremap [fzf-p]c :FzfPreviewCommandPaletteRpc<cr>
nnoremap [fzf-p]g :FzfPreviewProjectGrep<cr>
nnoremap [fzf-p]r :FzfPreviewFromResourcesRpc<cr>


