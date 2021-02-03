UsePlugin 'vimwiki'

" 環境によってvimwiki dirのpathを変える
let s:vimwikiPath = isdirectory('/mnt/d/GoogleDrive/') ? '/mnt/d/GoogleDrive/vimwiki/' : isdirectory('/mnt/chromeos/GoogleDrive/MyDrive/') ? '/mnt/chromeos/GoogleDrive/MyDrive/vimwiki/' : '~/vimwiki/'

let g:vimwiki_list = [{
  \ 'path': s:vimwikiPath,
  \ 'auto_toc': 1,
\ }]

" これらのconceal設定はvimwikiとindentLineを同時に使ったときにうまく機能しない
" 解決のための設定は./indentLine.vimにある
" default: 2
" let g:vimwiki_conceallevel = 0
" default: 1
" let g:vimwiki_conceal_onechar_markers = 1

