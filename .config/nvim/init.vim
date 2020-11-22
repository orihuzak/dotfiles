""" nvim config file

" netrw
" netrwの無効化
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

" Language support
let g:python3_host_prog="/home/linuxbrew/.linuxbrew/bin/python3"
" language settings
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

set nocompatible
filetype plugin on
set encoding=UTF-8 " 文字コードをutf8に設定
set fileformats=unix " 改行コードの設定
" set nofixeol " ファイル末尾への自動改行文字入力を無効化
set autoread " 編集中のファイルが変更されたら読み直す
set updatetime=750 " git statusの更新間隔を短く
" set autochdir " 常に現在のファイルのディレクトリをカレントディレクトリにする
set noswapfile " swapfileを作らない
set nobackup " ファイルを上書きするときにバックアップを作るのを無効化
" copy and paste
set guioptions+=a " ヤンクした内容をクリップボードに入れる
set clipboard=unnamedplus

"" status line
set showcmd " 入力中のコマンドをステータスに表示
set title " タイトルを表示
set hidden " バッファ編集中でも他のファイルを開けるように
set wildmenu " vimバーからファイルを選択可能
set laststatus=2 " ステータスラインを常に表示


"" editor
set signcolumn=yes " sign columnを常に表示する

" cursor
set virtualedit=onemore " 行末の１文字先までカーソル移動できるようにする
set whichwrap=b,s,h,l,<,>,[,] " 行をまたいで移動

" line
" 絶対/相対行番号をトグル表示する
set number relativenumber
set formatoptions+=mM " 自動折り返しを日本語対応
set wrap " 行を折り返して表示
set cursorline " 現在の行を強調表示
" cursorline background color
" hi CursorLine cterm=None ctermfg=NONE ctermbg=236

" indent
set smartindent " 自動indentの設定
set expandtab " tabを半角スペースにする
set tabstop=2 " tab幅の設定
set shiftwidth=2 " 自動インデント幅

" scroll
set scrolloff=999 " number of lines to see above and below the corsor
set mouse=a " enable mouse scroll

" show invisible chars
set list
set listchars=tab:»-,space:·,extends:»,precedes:« " 不可視文字の表示を定義
" spaceの候補 ["·", "␣"]
" 改行文字の候補 eol:↲,
" color invisible chars
hi NonText ctermbg=None ctermfg=59 guibg=NONE
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE
" hi Pmenu ctermfg=0 ctermbg=13 guibg=DarkGray


"" search
set ignorecase " 検索文字列が小文字の場合は大小文字を区別なく検索
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索
set incsearch " 検索文字列入力中に順次対象文字列にヒットさせる
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト


" color
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable " syntax highlighting

" icons
" devicons
" let g:webdevicons_enable=1


" leader
let g:mapleader = '\'
let g:maplocalleader = ','
" let mapleader=","
" noremap \ ,

" remember last cursor position
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


" load plugins with junegunn/vim-plug
call plug#begin()

Plug 'hecal3/vim-leader-guide'
" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" " Plug 'liuchengxu/vim-clap'
" icons
Plug 'ryanoasis/vim-devicons' " file explorerやlightlineのicon
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Language support
Plug 'elzr/vim-json' " to show json double quote
Plug 'leafgarland/typescript-vim'
" snippets
Plug 'heavenshell/vim-jsdoc' " generate jsdoc
" manage file
Plug '907th/vim-auto-save' " auto save
Plug 'djoshea/vim-autoread' " ファイルの再読込
" session
Plug 'thaerkh/vim-workspace'
" editor
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion' " cursor移動を高速にする
Plug 'matze/vim-move' " easy to move lines
Plug 'tpope/vim-repeat' " pluginでの操作もrepeatできるようにする
Plug 'tpope/vim-commentary' " commentout/inできる
Plug 'cohama/lexima.vim' " 閉じ括弧の自動補完
Plug 'tpope/vim-surround' " html tagや括弧などのテキストを囲む操作を簡単にする
Plug 'terryma/vim-expand-region' " 選択範囲の拡大縮小
Plug 'kana/vim-submode' " 繰り返し操作を簡単にする
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/switch.vim'
" resize window
Plug 'simeji/winresizer'
Plug 'haya14busa/incsearch.vim'
" color scheme
" Plug 'morhetz/gruvbox'
Plug 'yorickpeterse/happy_hacking.vim'
" Plug 'srcery-colors/srcery-vim'
" Plug 'wadackel/vim-dogrun'
" Plug 'dikiaap/minimalist'
" Plug 'AlessandroYorba/Sierra'
" Plug 'arcticicestudio/nord-vim'
" indent line
Plug 'Yggdroot/indentLine'
" Plug 'thaerkh/vim-indentguides'
" Plug 'nathanaelkane/vim-indent-guides'
" status line and tab line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" load plugin config files in _config/
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim

