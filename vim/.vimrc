set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'
Plugin 'moll/vim-bbye'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'iakio/smarty3.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'restore_view.vim'

call vundle#end()
filetype plugin on
syntax on

let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let ctrlp_custom_ignore = {
	\ 'dir' :'templates/compiled$\|templates/templates_c$\|vendor$'
	\ }

let g:syntastic_php_checkers = ['php']

let NERDTreeQuitOnOpen = 1

let mapleader = ","
let maplocalleader = ","

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

set ttyfast

set laststatus=2
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set t_Co=256
set t_ut=

set backup
set backupdir=~/.vim/backup

set number

set smartindent

set backspace=indent,eol,start
set mouse=a
set tabstop=2
set shiftwidth=2
set noexpandtab
set nolist

if &term =~ '^screen'
	" tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

set hidden

set scrolloff=3
set ignorecase
set incsearch
set hlsearch

set wrap
set textwidth=0
set wrapmargin=0

set noerrorbells
set visualbell t_vb=

set background=dark
colorscheme solarized

nmap j gj
nmap k gk

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Del> <Nop>

set expandtab tabstop=4 shiftwidth=4 softtabstop=4

" PHP linting
autocmd FileType php noremap <Leader>p :! php -l %<CR>

" Dispatch bind
nnoremap <F9> :Dispatch<CR>

" Open NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if its the only buffer open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Toggle NERDTree with Ctrl+N
map <Leader>n :NERDTreeToggle<CR>

" Toggle Tagbar on <Leader>t
map <Leader>t :TagbarToggle<CR>

" Reload ~.vimrc
map <Leader>r :so ~/.vimrc<CR>
