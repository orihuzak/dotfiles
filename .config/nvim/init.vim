""" nvim config file

""" Vim-Plug https://github.com/junegunn/vim-plug
call plug#begin()


" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" file manager or finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'ryanoasis/vim-devicons' " file explorerやlightlineのicon
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
Plug 'matze/vim-move' " easy to move lines
Plug 'tpope/vim-commentary' " commentout/inできる
Plug 'tpope/vim-repeat' " pluginでの操作もrepeatできるようにする
Plug 'cohama/lexima.vim' " 閉じ括弧の自動補完
Plug 'tpope/vim-surround' " html tagや括弧などのテキストを囲む操作を簡単にする
Plug 'terryma/vim-expand-region' " 選択範囲の拡大縮小
Plug 'kana/vim-submode' " 繰り返し操作を簡単にする
Plug 'AndrewRadev/switch.vim'
" manage window
Plug 'simeji/winresizer'
" color scheme
Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'wadackel/vim-dogrun'
Plug 'dikiaap/minimalist'
Plug 'AlessandroYorba/Sierra'
Plug 'arcticicestudio/nord-vim'
Plug 'Yggdroot/indentLine'
" Plug 'thaerkh/vim-indentguides'
" Plug 'nathanaelkane/vim-indent-guides'
" status line and tab line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()


""" Plugin Configurations

" coc.nvim
let g:coc_global_extensions = [
\ 'coc-sh',
\ 'coc-git',
\ 'coc-css',
\ 'coc-html',
\ 'coc-json',
\ 'coc-vimlsp',
\ 'coc-python',
\ 'coc-tsserver',
\ 'coc-vetur',
\ 'coc-rls',
\ 'coc-yaml',
\ 'coc-eslint',
\ 'coc-stylelintplus',
\ 'coc-markdownlint',
\ 'coc-snippets',
\ 'coc-emmet',
\ 'coc-tabnine',
\ 'coc-highlight',
\ 'coc-actions',
\ 'coc-explorer',
\ ]

"" coc
nnoremap [coc] <Nop>
nmap <space>c [coc]

" coc-actions
nnoremap <silent> [coc]a :CocCommand actions.open<cr>
nnoremap <silent> [coc]f :<C-u>call CocAction('format')<cr>

" Format
" nmap <space>fmt <Plug>(coc-format)
" nnoremap <silent> [coc]f <Plug>(coc-format)
" Formatting selected code.
xmap <space>f <Plug>(coc-format-selected)
nmap <space>f <Plug>(coc-format-selected)
" cocのDiagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" nmap <space>l :<C-u>CocList<cr>
"スペースhでHover
nmap <space>h :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <space>df <Plug>(coc-definition)
"スペースrfでReferences
nmap <space>rf <Plug>(coc-references)
"スペースrnでRename
nmap <space>rn <Plug>(coc-rename)
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

"" file manager
nmap <space>e :CocCommand explorer<cr>

" netrw
" netrwの無効化
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

" vimの機能にアクセスするための接頭辞を定義
nnoremap [vim] <Nop>
nmap <space>v [vim]

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
set nofixeol " ファイル末尾への自動改行文字入力を無効化
" set autochdir " 常に現在のファイルのディレクトリをカレントディレクトリにする
set list " 不可視文字の可視化
set listchars=tab:»-,space:·,extends:»,precedes:« " 不可視文字の表示を定義
" spaceの候補 ["·", "␣"]
" 改行文字の候補 eol:↲,
" 不可視文字への色付け
hi NonText ctermbg=None ctermfg=59 guibg=NONE
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE
" hi Pmenu ctermfg=0 ctermbg=13 guibg=DarkGray

" Keymapping

" show default keymap
nnoremap [help] <Nop>
nmap <space>q [help]
nnoremap <silent> [help]m :help index.txt<cr>

" return to new line in normal mode
" nmap <CR> i<CR><ESC>
" select

" select all by alt-a
nnoremap <A-a> ggVG


" language settings
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

"" colorscheme
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable " syntax highlighting

" gruvbox
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark = 'hard'

" happy_hacking
colorscheme happy_hacking
" srcery-vim
" colorscheme srcery

" font
" set guifont=DroidSansMono\ Nerd\ Font\ 11

" icons
" devicons
" let g:webdevicons_enable=1


" leader
let mapleader=","
noremap \ ,

" reload vimrc or init.nvim
nnoremap <silent> [vim]r :source $MYVIMRC<cr>

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

" vim indent guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

" status line
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
" hi CursorLine cterm=None ctermfg=NONE ctermbg=236

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


" load plugin config files in _config/
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim

