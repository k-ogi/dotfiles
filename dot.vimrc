set nocompatible
filetype off

set runtimepath+=~/dotfiles/dot.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'AutoComplPop'
Bundle 'EnhCommentify.vim'
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'Rename'
Bundle 'calendar.vim'
Bundle 'gnupg'
Bundle 'matchit.zip'
Bundle 'project.tar.gz'
Bundle 'twilight256.vim'
Bundle 'vimwiki'

Bundle 'duskhacker/sweet-rspec-vim'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'h1mesuke/vim-alignta'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-jabraces'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kenchan/rubyblue'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/syntastic'
Bundle 'taq/vim-rspec'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on

syntax enable
colorscheme twilight256

set encoding=utf-8
set fileencodings=utf-8,cp932,eucjp,iso2022jp,utf-16
set fileformats=unix,dos,mac

set ambiwidth=double
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cursorline
set directory-=.
set display=lastline
set hidden
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:»\ 
set mouse=a
set nobackup
set nohlsearch
set number
set ruler
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p
set t_Co=256
set ttimeoutlen=0
set virtualedit=block
set visualbell t_vb=
set wildmode=list:longest,list:full
set expandtab tabstop=2 shiftwidth=2

noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k

nnoremap + <C-w>+
nnoremap - <C-w>-

cnoremap <C-a> <Home>
cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

highlight Pmenu ctermbg=LightGray ctermfg=Black guibg=LightGray guifg=Black
highlight PmenuSel ctermbg=Blue guibg=RoyalBlue
highlight PmenuSbar ctermbg=LightGray guibg=LightGray
highlight PmenuThumb ctermbg=White guibg=White

" 以前開いていたときのカーソル位置を復元する
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 全角空白と行末の空白の色を変える
highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

function! s:HighlightSpaces()
  syntax match WideSpace /　/ containedin=ALL
  syntax match EOLSpace /\s\+$/ containedin=ALL
endf

call s:HighlightSpaces()
autocmd WinEnter * call s:HighlightSpaces()

" 挿入モード時、ステータスラインの色を変える
autocmd InsertEnter * highlight StatusLine ctermfg=red
autocmd InsertLeave * highlight StatusLine ctermfg=white
" 挿入モード時、paste オプションを解除する
autocmd InsertLeave * set nopaste

" 自動的に QuickFix リストを表示する
autocmd QuickFixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickFixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

let g:netrw_altv = 1
let g:vimwiki_home = '~/Public/Drop Box/vimwiki/'
let g:CommandTMaxHeight = 20

" FuzzyFinder
let g:fuf_modesDisable = []
let g:fuf_enumeratingLimit = 30
let g:fuf_ignoreCase = 0
let g:fuf_keyOpenSplit = '<C-s>'

nnoremap <Space>ff :FufMruFile<CR>
nnoremap <Space>fc :FufMruCmd<CR>
nnoremap <Space>fh :FufHelp<CR>

nnoremap <Space>ra :SweetVimRspecRunFile<CR>
nnoremap <Space>rf :SweetVimRspecRunFocused<CR>
nnoremap <Space>rr :SweetVimRspecRunPrevious<CR>
