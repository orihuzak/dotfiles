UsePlugin 'vimwiki'

" 環境によってvimwiki dirのpathを変える
if isdirectory('/mnt/d/GoogleDrive/')
  let g:vimwiki_list = [{'path': '/mnt/d/GoogleDrive/vimwiki/'}]
elseif isdirectory('/mnt/chromeos/GoogleDrive/MyDrive/')
  let g:vimwiki_list = [{'path': '/mnt/chromeos/GoogleDrive/MyDrive/vimwiki/'}]
endif

" default: 2
" let g:vimwiki_conceallevel = 0
" default: 1
" let g:vimwiki_conceal_onechar_markers = 1

