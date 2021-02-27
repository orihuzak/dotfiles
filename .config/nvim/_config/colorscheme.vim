UsePlugin 'sonokai'
UsePlugin 'elly.vim'
UsePlugin 'gruvbox'
UsePlugin 'vim-nightfly-guicolors'
UsePlugin 'Sierra'
UsePlugin 'nord-vim'
UsePlugin 'vim-dogrun'
UsePlugin 'srcery-vim'
UsePlugin 'minimalist'
UsePlugin 'iceberg.vim'

" dikiaap/minimalist
" colorscheme minimalist

"" srcery
" colorscheme srcery

" vim-dogrun
" colorscheme dogrun

" arcticicestudio/nord-vim
" colorscheme nord

"" Sierra
" let g:sierra_Pitch = 1
" colorscheme sierra

"" nightfly
" let g:nightflyCursorColor = 1
" let g:nightflyTerminalColors = 1
" let g:nightflyUnderlineMatchParen = 1
" colorscheme nightfly

"" sainnhe/sonokai
" style
" 'default', 'atlantis', 'andromeda', 'shusia', 'maia'
" let g:sonokai_style = 'atlantis'
" let g:sonokai_enable_italic_comment = 1
" let g:sonokai_enable_italic = 1
" let g:sonokai_transparent_background = 1
" let g:sonokai_menu_selection_background = 'blue'
" let g:sonokai_diagnostic_text_highlight = 1
" color sonokai

"" morhetz/gruvbox
set background=dark
" soft, medium(default), hard
let g:gruvbox_contrast_dark = 'soft'

" システムによってcolorschemeを変更する
if IsWsl()
  "" elly
  color elly
else
  color gruvbox
  " color sonokai
  " color iceberg
endif

