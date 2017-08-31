set nocompatible
set t_Co=256
filetype off

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

syntax on
set number
set ruler
set cmdheight=2
set ignorecase
set smartcase
set incsearch
set lazyredraw
set nowrap
set expandtab
set list
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set smarttab
set hlsearch
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set backspace=indent,eol,start

" Better command-line completion
" set wildmode=longest,list,full
set wildmenu

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()"

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on

colorscheme molokai

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ackprg = 'ag'
    let g:ctrlp_user_command= 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=50

" Ignore .gitignore files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
