"#############################################################################
" neovim config file
"#############################################################################

 
"#############################################################################
" Plugins
" using vim-plugin https://github.com/junegunn/vim-plug
"#############################################################################
call plug#begin()
" ここから下にインストールするプラグインを書く

"#############################################################################
" coc lsp
"#############################################################################
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-snippets', 'coc-emmet', 'coc-markdownlint', 'coc-vetur', 'coc-explorer', 'coc-git', 'coc-eslint', 'coc-highlight', 'coc-vimlsp', 'coc-rls']
"#############################################################################
" file manager
" coc-explorer space-eでcoc-explorerを開く
nmap <space>e :CocCommand explorer<CR>
" デフォルトのファイルエクスプローラnetrwの設定
" let g:netrw_banner = 0 " 上部の表示を非表示
" let g:netrw_liststyle = 3 " 表示形式をtree viewに変更
" let g:netrw_altv = 1 " 左右分割を右側に開く
" let g:netrw_winsize = 85 " 分割で開いたときに85%のサイズで開く
" netrwの無効化
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

"#############################################################################
" autosave
"#############################################################################
Plug '907th/vim-auto-save' " 自動セーブ
let g:auto_save = 1 " enable auto save

Plug 'djoshea/vim-autoread' " ファイルの再読込

"#############################################################################
" file finder
"#############################################################################
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
" space f でskimを起動
nnoremap <Space>f :SK<CR>

"#############################################################################
" cursor move
"#############################################################################
Plug 'easymotion/vim-easymotion' " cursor移動を高速にする

"#############################################################################
" text editing
"#############################################################################
" Ptug 'matze/vim-move' " (選択した)行を移動させる
Plug 'tpope/vim-commentary' " commentout/inできる
Plug 'tpope/vim-repeat' " pluginでの操作もrepeatできるようにする
Plug 'cohama/lexima.vim' " 閉じ括弧の自動補完
Plug 'tpope/vim-surround' " html tagや括弧などのテキストを囲む操作を簡単にする
Plug 'terryma/vim-expand-region' " 選択範囲の拡大縮小
" KとJで選択範囲の拡大縮小
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

"#############################################################################
" window resizer
"#############################################################################
Plug 'simeji/winresizer'


" color scheme
"-----------------------------------------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

"#############################################################################
" status and tab line
"#############################################################################
Plug 'itchyny/lightline.vim'
" lightline settings
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"#############################################################################
" icons
"#############################################################################
Plug 'ryanoasis/vim-devicons' " coc explorerやlightlineむけのアイコン表示用
let g:webdevicons_enable=1

"#############################################################################
" git
"#############################################################################
Plug 'airblade/vim-gitgutter' " gitの差分をeditor左に表示
set updatetime=100 " git statusの更新間隔を短く
set signcolumn=yes " sign columnを常に表示する
" let g:gitgutter_highlight_lines = 2 " git statusに合わせて行の背景色を変更する
let g:gitgutter_highlight_linenrs = 1 " line number highlight
let g:gitgutter_override_sign_column_highlight = 0
" highlight sign
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" プラグインを書くのはここまで！
call plug#end()

"#############################################################################
" terminal
"#############################################################################
map <C-s> :terminal<CR>
" Escでterminal modeを終了
tnoremap <Esc> <C-\><C-n>

"#############################################################################
" editor
"#############################################################################
set encoding=UTF-8 " 文字コードをutf8に設定
set fileformats=dos,unix,mac " 改行コードの自動認識
set autoread " 編集中のファイルが変更されたら読み直す
set noswapfile " swapfileを作らない
set nobackup " ファイルを上書きするときにバックアップを作るのを無効化

" color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox
""""""""""""""""""""""
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" gruvbox-material
""""""""""""""""""""""
" set termguicolors
" set background=dark    " Setting dark mode
" " this configuration option should be placed before `colorscheme gruvbox-material`
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material
" let g:gruvbox_material_disable_italic_comment = 1 " disable italic comment

"#############################################################################
" font
"#############################################################################
set guifont=DroidSansMono\ Nerd\ Font\ 11

"#############################################################################
" leader
"#############################################################################
let mapleader = "\<Space>"

"#############################################################################
" insert modeでのcursor移動
"#############################################################################
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"#############################################################################
" indent
"#############################################################################
set smartindent " 自動indentの設定
set expandtab " tabを半角スペースにする
set tabstop=2 " tab幅の設定
set shiftwidth=2 " 自動インデント幅
" alt-hlでindent/outdent
noremap <A-l> >>
noremap <A-h> <<
vnoremap <A-l> >gv
vnoremap <A-h> <gv
inoremap <A-l> <C-t>
inoremap <A-h> <C-d>

"#############################################################################
" 不可視文字の可視化
"#############################################################################
set list " 不可視文字の可視化
set listchars=tab:»-,space:· " 不可視文字の表示を定義
" spaceの候補 ["·", "␣"]
" 不可視文字への色付け
hi NonText ctermbg=None ctermfg=59 guibg=NONE
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE

"#############################################################################
" status bar
"#############################################################################
set showcmd " 入力中のコマンドをステータスに表示
set title " タイトルを表示
set hidden " バッファ編集中でも他のファイルを開けるように
set wildmenu " vimバーからファイルを選択可能
set laststatus=2 " ステータスラインを常に表示

"#############################################################################
" syntax highlighting
"#############################################################################
syntax enable

"#############################################################################
" scroll
"#############################################################################
set scrolloff=2 " スクロール開始位置を画面端から2行目にする
set mouse=a " マウススクロールを有効化

"#############################################################################
" line
"#############################################################################
set number " 行番号の表示
set formatoptions+=mM " 自動折り返しを日本語対応
set wrap " 行を折り返して表示
set cursorline " 現在の行を強調表示
" cursorline background color
hi CursorLine cterm=None ctermfg=NONE ctermbg=236

"#############################################################################
" cursor
"#############################################################################
set virtualedit=onemore " 行末の１文字先までカーソル移動できるようにする
set whichwrap=b,s,h,l,<,>,[,] " 行をまたいで移動
" 折り返し行の移動について表示上の行も移動できるようにする
nnoremap k gk
nnoremap j gj
" 編集箇所のカーソル位置を記憶する
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

"#############################################################################
" copy and paste
"#############################################################################
set guioptions+=a " ヤンクした内容をクリップボードに入れる
set clipboard=unnamed,unnamedplus

"#############################################################################
" 検索
"#############################################################################
set ignorecase " 検索文字列が小文字の場合は大小文字を区別なく検索
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索
set incsearch " 検索文字列入力中に順次対象文字列にヒットさせる
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"#############################################################################
" Tabと画面分割の設定
"#############################################################################
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
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR> " 横に分割
nnoremap sv :<C-u>vs<CR> " 縦に分割
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

