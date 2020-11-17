UsePlugin 'ctrlp.vim'

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

