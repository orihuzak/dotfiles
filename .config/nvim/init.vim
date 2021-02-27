""" nvim config file

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
set updatetime=300 " git statusの更新間隔を短く
set shortmess+=c " dont pass messages to |ins-completion-menu|
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
set concealcursor=""

" complete
set completeopt="menuone,popup,noinsert"

"" terminal
" let &shell="bash --login"
" if executable('/home/linuxbrew/.linuxbrew/bin/bash')
" 	let &shell="/home/linuxbrew/.linuxbrew/bin/bash --login"
" else
" 	let &shell="bash --login"
" endif

" cursor
" set virtualedit=onemore " 行末の１文字先までカーソル移動できるようにする
set whichwrap=b,s,h,l,<,>,[,] " 行をまたいで移動

" line
" 絶対/相対行番号をトグル表示する
set number relativenumber
set formatoptions+=mM " 自動折り返しを日本語対応
set wrap " 行を折り返して表示
" cursorlineにアンダーライン
" set cursorline " 現在の行を強調表示
" colorschemeが設定されるたびにunderlineを定義しなおす
augroup CustomCursorLine
	au!
	au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END
" hi CursorLine cterm=None ctermfg=NONE ctermbg=236
" highlight CursorLine gui=underline guifg=NONE guibg=NONE
" cursorline background color

" indent
set smartindent " 自動indentの設定
" set expandtab " tab to space
set tabstop=4 " tab幅の設定
set shiftwidth=4 " 自動インデント幅

" folding
set foldmethod=syntax
set nofoldenable

" scroll
set scrolloff=999 " number of lines to see or
set mouse=a " enable mouse scroll

" show invisible chars
set list
" set listchars=tab:»-,space:·,extends:»,precedes:« " 不可視文字の表示を定義
set listchars=tab:>-,space:·,extends:»,precedes:« " 不可視文字の表示を定義
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

function! g:IsWsl()
	return filereadable('/proc/sys/fs/binfmt_misc/WSLInterop')
endfunction

" remember last cursor position
if has("autocmd")
	augroup redhat
		" In text files, always limit the width of text to 78 characters
		autocmd BufRead *.txt set tw=78
		" When editing a file, always jump to the last cursor position
		autocmd BufReadPost *
		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
		\		exe "normal! g'\"" |
		\ endif
	augroup END
endif

" auto reload $MYVIMRC
augroup source-vimrc
	autocmd!
	autocmd BufWritePost *vimrc source $MYVIMRC
	autocmd BufWritePost *init.vim source $MYVIMRC
	autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" insert modeから抜けたときにIMEをOFF
if IsWsl() && executable('AutoHotkeyU64.exe')
	augroup insertLeave
		autocmd!
		autocmd InsertLeave,CmdwinLeave * :call system('AutoHotkeyU64.exe "C:\tools\ImeDisable.ahk"')
	augroup END
endif

" load plugins with junegunn/vim-plug
call plug#begin()

" language server protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" vim-lsp and vim-lsp-settings
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" auto complete
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" snippet
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'codota/tabnine-vim'
" Plug 'xabikos/vscode-javascript'
" Plug 'softchris/node-snippets'
" Plug 'softchris/ts-snippets'
" Plug 'cartant/ts-snippet'
" 括弧の補完
" Plug 'kana/vim-smartinput'
Plug 'cohama/lexima.vim'
Plug 'lambdalisue/vim-backslash'
" Language support
Plug 'heavenshell/vim-jsdoc' " generate jsdoc
Plug 'elzr/vim-json' " to show json double quote
Plug 'kevinoid/vim-jsonc'
" Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
" file manager explorer
 " if has('nvim')
	" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
	" " Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
 " else
	" Plug 'Shougo/defx.nvim'
	" " Plug 'Shougo/denite.nvim'
	" Plug 'roxma/nvim-yarp'
	" Plug 'roxma/vim-hug-neovim-rpc'
 " endif
 " Plug 'kristijanhusak/defx-icons'
 " Plug 'kristijanhusak/defx-git'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mattn/ctrlp-matchfuzzy'
" Plug 'dbeecham/ctrlp-commandpalette.vim'
" Plug 'liuchengxu/vim-clap'
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" search in file or buffer
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
" icons
Plug 'ryanoasis/vim-devicons' " file explorerやlightlineのicon
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim' " git commit browser
Plug 'skanehira/gh.vim'
Plug '907th/vim-auto-save'
Plug 'djoshea/vim-autoread' " fileの自動再読込
" session / workspace
" Plug 'thaerkh/vim-workspace'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" editing
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' " aeで全選択
Plug 'kana/vim-textobj-indent' " ai iiがtextobj indent
Plug 'kana/vim-textobj-line' " al ilがtextobj line
" Plug 'mbbill/undotree'
Plug 'matze/vim-move' " easy to move lines
Plug 'tpope/vim-commentary' " commentout/inできる
Plug 'tpope/vim-surround' " html tagや括弧などのテキストを囲む
Plug 'terryma/vim-expand-region' " 選択範囲の拡大縮小
Plug 'AndrewRadev/switch.vim'
Plug 'machakann/vim-swap'
Plug 'thinca/vim-quickrun'
Plug 'kana/vim-tabpagecd'
Plug 'andymass/vim-matchup'
" repeat
Plug 'tpope/vim-repeat' " pluginでの操作もrepeatできるようにする
Plug 'kana/vim-submode' " 繰り返し操作を簡単にする
" cursor move
Plug 'easymotion/vim-easymotion' " cursor移動を高速にする
" Plug 'phaazon/hop.nvim' " for nvim 0.5~
" align
Plug 'junegunn/vim-easy-align'
" Plug 'godlygeek/tabular'
" resize window
Plug 'simeji/winresizer'
" color scheme
Plug 'sheerun/vim-polyglot'
Plug 'ulwlu/elly.vim'
Plug 'morhetz/gruvbox'
Plug 'rainglow/vim'
Plug 'sainnhe/sonokai'
Plug 'dikiaap/minimalist'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'cocopon/iceberg.vim'
" indent line
Plug 'hecal3/vim-leader-guide'
Plug 'Yggdroot/indentLine'
" Plug 'thaerkh/vim-indentguides'
" Plug 'nathanaelkane/vim-indent-guides'
" status line and tab line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'

call plug#end()

" load plugin config files in _config/
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
	return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim

