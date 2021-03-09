UsePlugin 'fzf-preview.vim'

" options
if executable('bat')
  let g:fzf_preview_command = 'bat --color=always --plain {-1}'
  let g:fzf_preview_lines_command = 'bat --color=always --plain --number'
endif
let g:fzf_preview_use_dev_icons = 1


" map
nnoremap [fzf-p] <Nop>
nmap <space>f [fzf-p]
nnoremap [fzf-p]f :FzfPreviewGitFilesRpc<cr>
nnoremap [fzf-p]s :FzfPreviewProjectFilesRpc<cr>
nnoremap [fzf-p]d :FzfPreviewDirectoryFilesRpc<cr>
nnoremap [fzf-p]b :FzfPreviewBuffersRpc<cr>
nnoremap [fzf-p]u :FzfPreviewProjectMruFilesRpc<cr>
nnoremap [fzf-p]l :FzfPreviewLinesRpc<cr>
nnoremap [fzf-p]c :FzfPreviewCommandPaletteRpc<cr>
nnoremap [fzf-p]g :FzfPreviewProjectGrepRpc<cr>
nnoremap [fzf-p]r :FzfPreviewFromResourcesRpc<cr>

