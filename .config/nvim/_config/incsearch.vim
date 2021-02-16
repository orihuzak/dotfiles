UsePlugin 'incsearch.vim'
UsePlugin 'incsearch-fuzzy.vim'

" incsearchはすでにvim本体に取り込まれている。incsearch-fuzzyの
" map
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)


map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

