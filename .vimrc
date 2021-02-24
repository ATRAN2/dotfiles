set nocompatible
set t_Co=256
filetype off

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
else
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
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
set listchars=nbsp:Â¬,eol:Â¶,tab:>-,extends:Â»,precedes:Â«,trail:â€¢
set backspace=indent,eol,start


" Better command-line completion
" set wildmode=longest,list,full
set wildmenu

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()"

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

colorscheme molokai

if executable('ag')
    let g:ackprg = 'ag'
endif

nnoremap <silent> <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'npm'
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
