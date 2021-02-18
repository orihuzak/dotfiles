UsePlugin 'vim-smartinput'

" (|)のときにspaceで( | )にする
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at'    : '(\%#)',
\   'char'  : '<Space>',
\   'input' : '<Space><Space><Left>',
\   })

call smartinput#define_rule({
\   'at'    : '( \%# )',
\   'char'  : '<BS>',
\   'input' : '<Del><BS>',
\   })

