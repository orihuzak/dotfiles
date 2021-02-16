UsePlugin 'incsearch.vim'
UsePlugin 'incsearch-fuzzy.vim'

" map
" incsearchはすでにvim本体に取り込まれている。incsearch-fuzzyの依存関係として使っている
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)


map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

