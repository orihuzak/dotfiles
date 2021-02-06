UsePlugin 'LeaderF'

" show LeaderF in floating window
let g:Lf_WindowPosition = 'popup'
" popup width and height, screen size = 1
let g:Lf_PopupWidth = 0.75
let g:Lf_PopupHeight = 0.5
" show preview in floating window
let g:Lf_PreviewInPopup = 1
" 最初からpreviewを表示するかどうか
let g:Lf_PreviewResult = {
  \ 'File': 1,
  \ 'Buffer': 1,
\}

" map
nnoremap [Leaderf] <Nop>
nmap <space>f [Leaderf]
" search filename
nnoremap <silent> [Leaderf]f :LeaderfFile<cr>
" search buffers
nnoremap <silent> [Leaderf]b :LeaderfBuffer<cr>
" search line
nnoremap <silent> [Leaderf]l :LeaderfLine<cr>
" search line all
nnoremap <silent> [Leaderf]a :LeaderfLineAll<cr>
nnoremap <silent> [Leaderf]g :LeaderfFunction<cr>
nnoremap <silent> [Leaderf]co :LeaderfColorscheme<cr>
" show commands of Leaderf
nnoremap <silent> [Leaderf]cm :LeaderfSelf<cr>
" show commands
nnoremap <silent> [Leaderf]ca :LeaderfCommand<cr>

