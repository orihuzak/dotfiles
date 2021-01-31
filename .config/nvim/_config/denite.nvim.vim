UsePlugin 'denite.nvim'




" map in denite window
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" change file/rec commad
" For ripgrep
" Note: rg is faster than ag
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" use .gitignore
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
	\ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> <C-p> :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>

" floating window
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
\ 'split': 'floating',
\ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
\ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
\ 'winheight': float2nr(&lines * s:denite_win_height_percent),
\ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
\ })


" map
nnoremap [denite] <Nop>
nmap <space>f [denite]
" reload vimrc or init.nvim
nnoremap <silent> [denite]f :Denite file/rec<cr>
nnoremap <silent> [denite]l :Denite line<cr>
nnoremap <silent> [denite]c :Denite command<cr>
nnoremap <silent> [denite]b :Denite buffer<cr>
nnoremap <silent> [denite]s :Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<cr>

