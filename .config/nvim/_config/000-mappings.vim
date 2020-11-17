" user custom keymapping for vim

" prefix for vim features
nnoremap [vim] <Nop>
nmap <space>v [vim]
" reload vimrc or init.nvim
nnoremap <silent> [vim]r :source $MYVIMRC<cr>
" toggle relative and absolute line number
noremap <space>l :set relativenumber!<CR>
" remove highlight by tapping ESC twice
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" prefix for help
nnoremap [help] <Nop>
nmap <space>q [help]
nnoremap <silent> [help]m :help index.txt<cr>

" nvim terminal
map <C-s> :terminal<CR>
" Esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" return to new line in normal mode
" nmap <CR> i<CR><ESC>

" select all by alt-a
nnoremap <A-a> ggVG

"" cursor move

" 折り返し行上のカーソル移動について、表示上の行を移動できるようにする
nnoremap k gk
nnoremap j gj

" cursor move in insert mode
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"" line move

" outdent/indent by alt-h/l
noremap <A-l> >>
noremap <A-h> <<
vnoremap <A-l> >gv
vnoremap <A-h> <gv
inoremap <A-l> <C-t>
inoremap <A-h> <C-d>

"" tab and pane control

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt " 次のタブに移動
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR> " 新しいタブを追加
" add a pane bottom of active pane
nnoremap ss :<C-u>sp<CR>
" add a pane right of active pane
nnoremap sv :<C-u>vs<CR> " 縦に分割
" close a window
nnoremap sc :close<CR>
" nnoremap so :only<CR> " close all not current windows
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" vim-plug keymapping
nnoremap [vim-plug] <Nop>
nmap <space>p [vim-plug]
nnoremap <silent> [vim-plug]i :PlugInstall<cr>
nnoremap <silent> [vim-plug]u :PlugUpdate<cr>
nnoremap <silent> [vim-plug]c :PlugClean<cr>
nnoremap <silent> [vim-plug]s :PlugStatus<cr>

