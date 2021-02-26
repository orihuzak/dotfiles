" user custom keymapping for vim

" leader
let g:mapleader = ","
" let g:maplocalleader = ','


" prefix for vim features
nnoremap [vim] <Nop>
nmap <space>v [vim]
" reload vimrc or init.nvim
nnoremap <silent> [vim]r :source $MYVIMRC<cr>
" toggle relative and absolute line number
nnoremap <silent> [vim]l :set relativenumber!<CR>

" 編集に関連するmapのprefix
nnoremap [editor] <Nop>
nmap <space><space> [editor]

" incsearch
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
" nnoremap <A-a> ggVG
" delete xを切り取りではなく削除にする
" nnoremap x "_x
" vnoremap x "_x


"" cursor move

" 折り返し行上のカーソル移動について、表示上の行を移動できるようにする
nnoremap k gk
nnoremap j gj

" cursor move in insert mode
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"" command line

" ctrl-xで現在のバッファのパスを補完する
cnoremap <c-x> <c-r>=expand('%:p')<CR>


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
" move focus between windows
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" move focus rotate window
nnoremap sw <C-w>w
" rotate split windows
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" window positionを入れ替える
nnoremap sr <C-w>r
" move focus between tabs
nnoremap sn :tabnext<CR>
" nnoremap sp :tabprevious<CR>
" command lineの高さを増やす
nnoremap s= <C-w>=
" command lineの高さをもとに戻す
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
" move focus buffer
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
" new tab
nnoremap st :tabnew<CR>
" close tab
nnoremap sq :tabclose<CR>
" add a pane bottom of active pane
" split window 縦横
nnoremap ss :sp<CR>
nnoremap sv :vs<CR>
" close a window
nnoremap sc :close<CR>
nnoremap sQ :<C-u>bd<CR>

