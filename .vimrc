" Settings

" for Vundle settings
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'vim-scripts/vim-auto-save' " auto save
Plugin 'mattn/emmet-vim' " https://github.com/mattn/emmet-vim
Plugin 'dense-analysis/ale' " https://github.com/dense-analysis/ale
Plugin 'tpope/vim-repeat'
Plugin 'pangloss/vim-javascript'
Plugin 'sheerun/vim-polyglot'
" file viewer
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wincent/command-t' " https://github.com/wincent/command-t
" theme and color
Plugin 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" git
Plugin 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plugin 'airblade/vim-gitgutter' " https://github.com/airblade/vim-gitgutter
Plugin 'Xuyuanp/nerdtree-git-plugin' " nerdtreeにgit statusを表示する
" text editing
Plugin 'matze/vim-move' " (選択した)行を移動させる
Plugin 'tpope/vim-commentary' " commentをonoffできる
" auto complete and syntax
Plugin 'cohama/lexima.vim' " 括弧の自動補完
Plugin 'tpope/vim-surround' " htmlタグや括弧のショートカット
Plugin 'leafgarland/typescript-vim'

if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1 

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" editor
let g:auto_save = 1 " enable auto save
set fileformats=dos,unix,mac "改行コードの自動認識
set encoding=UTF-8 " 文字コードをUTF-8に設定
set guifont=DroidSansMono\ Nerd\ Font\ 11 " フォント
set formatoptions+=mM " テキスト編集中の自動折り返しを日本語に対応させる
set showcmd " 入力中のコマンドをステータスに表示
set title " タイトルを表示
set autoread " 編集中のファイルが変更されたら自動で読み直す
set hidden " バッファが編集中でもその他のファイルを開けるように
set noswapfile " swapfileをつくらない
set nobackup " ファイルを上書きする前にバックアップを作ることを無効化
set wildmenu " vimバーからファイルを選択できる
set laststatus=2 " ステータスラインを常に表示
syntax enable " シンタックスハイライトの有効化
set list " 不可視文字の可視化
set listchars=tab:»-,nbsp:␣ " 可視文字を可視化(タブが*-と表示される)
hi Comment ctermfg=3
" text editing
let g:move_map_keys = 1
let g:move_key_modifier = 'C' " vim-moveのprefixを設定

" scroll
set scrolloff=2 " スクロール開始位置を画面端から２行目にする
set mouse=a " マウススクロールを有効にする

" line
set wrap " 行を折り返して表示
set number " 行番号の表示
set cursorline " 現在の行を強調表示
" set cursorcolumn " 現在の列を強調表示を

" cursor
set guicursor=a:blinkon0 " カーソルを点滅させない
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set whichwrap=b,s,h,l,<,>,[,] " 行をまたいで移動
" 折り返し時に表示行単位での移動できるようにする
nnoremap k gk
nnoremap j gj

" copy and paste
set guioptions+=a " yでコピーした内容をクリップボードに入る
set clipboard+=unnamed,autoselect " ヤンクでクリップボードにコピー

" indent
" set smartindent " スマートインデント
set autoindent " auto indent
set expandtab " tabを半角スペースにする
set shiftwidth=2 " 行頭でのTab文字の表示幅
set tabstop=2 " 行頭以外のtab文字の表示幅(スペース数)

" 検索系
set ignorecase " 検索文字列が小文字の場合は大小文字を区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" auto complete
" 括弧 https://github.com/cohama/lexima.vim
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1

" Tabの操作
" vim起動時にnerd tree tabsを起動
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

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

" NERDTree
" NERDTreeを表示
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " 隠しファイルを表示する
" vim起動時にnerdtreeを自動で開く
autocmd VimEnter * NERDTree
" ディレクトリを開けるようにする
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" ファイルを閉じてNERDTreeだけが残るとき、vimを終了する
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" remove directory allow
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" vim-devicons
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_conceal_nerdtree_brackets = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

