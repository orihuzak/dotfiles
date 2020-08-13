""" nvim config file

""" Vim-Plug https://github.com/junegunn/vim-plug
call plug#begin()


" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" file manager and finder
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
" Plug 'ryanoasis/vim-devicons' " file explorerやlightlineのicon
Plug 'tpope/vim-fugitive'
" Languages
Plug 'elzr/vim-json' " to show json double quote
Plug 'leafgarland/typescript-vim'
" snippets
Plug 'heavenshell/vim-jsdoc' " generate jsdoc
" manage file
Plug '907th/vim-auto-save' " auto save
Plug 'djoshea/vim-autoread' " ファイルの再読込
" session
Plug 'thaerkh/vim-workspace'
" edit
Plug 'easymotion/vim-easymotion' " cursor移動を高速にする
Plug 'matze/vim-move' " (選択した)行を移動させる
Plug 'tpope/vim-commentary' " commentout/inできる
Plug 'tpope/vim-repeat' " pluginでの操作もrepeatできるようにする
Plug 'cohama/lexima.vim' " 閉じ括弧の自動補完
Plug 'tpope/vim-surround' " html tagや括弧などのテキストを囲む操作を簡単にする
Plug 'terryma/vim-expand-region' " 選択範囲の拡大縮小
Plug 'kana/vim-submode' " 繰り返し操作を簡単にする
" manage window
Plug 'simeji/winresizer' " window resizer
" color scheme
Plug 'morhetz/gruvbox'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'ayu-theme/ayu-vim'
Plug 'jacoborus/tender.vim'
" indent line
Plug 'Yggdroot/indentLine'
" Plug 'thaerkh/vim-indentguides'
" Plug 'nathanaelkane/vim-indent-guides'
" status and tab line
Plug 'itchyny/lightline.vim'


call plug#end()


""" Plugin Configurations

" coc.nvim
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-html',
\ 'coc-json',
\ 'coc-yaml',
\ 'coc-vimlsp',
\ 'coc-tsserver',
\ 'coc-rls',
\ 'coc-markdownlint',
\ 'coc-eslint',
\ 'coc-snippets',
\ 'coc-emmet',
\ 'coc-vetur',
\ 'coc-git',
\ 'coc-highlight'
\ ]

" cocのDiagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <space>l :<C-u>CocList<cr>
"スペースhでHover
nmap <space>h :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <space>df <Plug>(coc-definition)
"スペースrfでReferences
nmap <space>rf <Plug>(coc-references)
"スペースrnでRename
nmap <space>rn <Plug>(coc-rename)
" Formatting
"スペースfmtでFormat
nmap <space>fmt <Plug>(coc-format)
" Formatting selected code.
xmap <space>f <Plug>(coc-format-selected)
nmap <space>f <Plug>(coc-format-selected)
" coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" coc-git
autocmd CursorHold * CocCommand git.refresh

" defx
nmap <space>e :Defx<CR>
" vim外でfileに変更を加えたときに自動で反映する
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()

autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory() ?
      \ defx#do_action('open_directory') :
      \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> l
    \ defx#is_directory() ?
      \ defx#do_action('open_directory') :
      \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
    \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
  endfunction

call defx#custom#option('_', {
  \ 'split': 'floating',
  \ 'toggle': 1,
  \ 'show_ignored_files': 1,
  \ 'resume': 1,
  \ 'columns': 'mark:indent:git:icons:filename:type'
\ })

" ignored fileにiconをつける
" これを定義するとなぜかdefxがファイルを表示する速度が遅くなる
" call defx#custom#column('git', 'show_ignored', 1)

" netrw
" netrwの無効化
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

"" search file

" skim
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
" space f でskimを起動
nnoremap <Space>s :SK<CR>

" vim-autosave
let g:auto_save = 1 " enable auto save

" vim-workspace
let g:workspace_autosave_always = 1
" let g:workspace_autosave = 1
nnoremap <space>w :ToggleWorkspace<CR>

" vim-expand_region
" KとJで選択範囲の拡大縮小
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" status line
" lightline settings
" colorscheme candidates
  " wombat, tender
let g:lightline = {
\ 'colorscheme': 'tender',
\ 'component_function': {
  \ 'coc': 'coc#status'
  \ }
\ }

" Neovim :terminal
map <C-s> :terminal<CR>
" Escでterminal modeを終了
tnoremap <Esc> <C-\><C-n>

" Language support
let g:python3_host_prog="/home/linuxbrew/.linuxbrew/bin/python3"
let g:vim_json_syntax_conceal = 0 " to show json double quote "

" git
set updatetime=100 " git statusの更新間隔を短く
set signcolumn=yes " sign columnを常に表示する

" editor
set encoding=UTF-8 " 文字コードをutf8に設定
set fileformats=unix,dos,mac " 改行コードの自動認識
set autoread " 編集中のファイルが変更されたら読み直す
set noswapfile " swapfileを作らない
set nobackup " ファイルを上書きするときにバックアップを作るのを無効化
" set autochdir " 常に現在のファイルのディレクトリをカレントディレクトリにする
set list " 不可視文字の可視化
set listchars=tab:»-,space:·,eol:↲,extends:»,precedes:« " 不可視文字の表示を定義
" spaceの候補 ["·", "␣"]
" 不可視文字への色付け
hi NonText ctermbg=None ctermfg=59 guibg=NONE
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE
" hi Pmenu ctermfg=0 ctermbg=13 guibg=DarkGray

" Keymapping

" return to new line in normal mode
nmap <CR> i<CR><ESC>
" select

" select all by alt-a
nnoremap <A-a> ggVG


" language settings
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

""" colorscheme
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable " syntax highlighting

"" gruvbox
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark = 'hard'

"" gruvbox-material
" set background=dark    " Setting dark mode
" " this configuration option should be placed before `colorscheme gruvbox-material`
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material
" let g:gruvbox_material_disable_italic_comment = 1 " disable italic comment

"" ayu-vim
" line numberが暗くなって見にくい
" let ayucolor="mirage" " light, mirage, dark
" colorscheme ayu

"" tender
colorscheme tender


" font
" set guifont=DroidSansMono\ Nerd\ Font\ 11

" icons
" devicons
let g:webdevicons_enable=1


" leader
let mapleader=","
noremap \ ,

" insert modeでのcursor移動
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" indent
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

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_fileTypeExclude = ['defx']
" vim indent guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

" status bar
set showcmd " 入力中のコマンドをステータスに表示
set title " タイトルを表示
set hidden " バッファ編集中でも他のファイルを開けるように
set wildmenu " vimバーからファイルを選択可能
set laststatus=2 " ステータスラインを常に表示


" scroll
set scrolloff=2 " スクロール開始位置を画面端から2行目にする
set mouse=a " マウススクロールを有効化

" line
" 絶対/相対行番号をトグル表示する
set number relativenumber
noremap <space>l :set relativenumber!<CR>
set formatoptions+=mM " 自動折り返しを日本語対応
set wrap " 行を折り返して表示
set cursorline " 現在の行を強調表示
" cursorline background color
hi CursorLine cterm=None ctermfg=NONE ctermbg=236
" vim-move move line
let g:move_map_keys = 0 " disable vim-move default keymap
nmap <A-k> <Plug>MoveLineUp
nmap <A-j> <Plug>MoveLineDown
vmap <A-k> <Plug>MoveBlockUp
vmap <A-j> <Plug>MoveBlockDown

" cursor
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

" copy and paste
set guioptions+=a " ヤンクした内容をクリップボードに入れる
set clipboard=unnamedplus

" 検索
set ignorecase " 検索文字列が小文字の場合は大小文字を区別なく検索
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索
set incsearch " 検索文字列入力中に順次対象文字列にヒットさせる
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Tabと画面分割の設定
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
nnoremap sc :close<CR> " close window
" nnoremap so :only<CR> " close all not current windows
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

