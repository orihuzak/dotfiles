UsePlugin 'denite.nvim'


" map
nnoremap [denite] <Nop>
nmap <space>f [denite]
" reload vimrc or init.nvim
nnoremap <silent> [denite]f :Denite file/rec<cr>
nnoremap <silent> [denite]l :Denite line<cr>
nnoremap <silent> [denite]c :Denite command<cr>
nnoremap <silent> [denite]b :Denite buffer<cr>


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

" Change file/rec command.
" Note: rg is faster than ag
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')


