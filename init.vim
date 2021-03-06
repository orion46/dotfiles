set number "行番号の表示
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set matchtime=1 "matchtimeを0.1sに
set tabstop=4 "インデントを4つ分に設定
set expandtab "tabを半角スペースで挿入
set shiftwidth=4 "vimが自動で生成するtab幅を4に
set smartindent "オートインデント
set clipboard=unnamed
set cursorline
"set list "空白文字の可視化
set virtualedit=block "文字のないところにカーソル移動できるように
set backspace=indent,eol,start "BSを空白行末行頭でも使えるように
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭行末で止まらないように
set mouse=a "全モードでマウスを有効化

"検索設定
set ignorecase "大文字小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索
set wrapscan "検索時に最後までいったら最初に戻る

set laststatus=2 "エディタウィンドウの末尾から2行目にstatus lineを
set wildmenu "コマンドライン補完を拡張モードに
set wrap "ウィンドウの幅より長い行は折り返して、次の行で表示
set encoding=utf8
set fileencoding=utf-8 "保存時の文字コード
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932
set showcmd "画面最下部にコマンド表示
set hidden  "保存されていないファイルがあるときも別のファイルを開くことが出来る
set pastetoggle=<f5>
set colorcolumn=80
filetype plugin indent on

" autocmd
if has("autocmd")
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2
  autocmd BufWritePre * :%s/\s\+$//ge
endif


" ##### Key Mapping #####
"stop highlight
nnoremap <ESC><ESC> :nohlsearch<CR>
" make arrows invalid
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" switch (j,k) and (gj, gk)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" map %:h to %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" map Ctrl+P to :!python %
nnoremap <C-p> :!python %
" When normal mode, change ; and :
nnoremap : ;
nnoremap ; :


"#######dein########
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

"if there is something not installed, install it
if dein#check_install()
  call dein#install()
endif

set background=light
colorscheme molokai
syntax on
