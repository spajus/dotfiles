""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim configuration of spajus

""""""""""""""""""""""""""""""""""""""""""""""""""
" First things first
set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow per-folder settings
set exrc
set secure

""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""
" My plugins
Plugin 'altercation/solarized', { 'rtp': 'vim-colors-solarized/' }
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'fatih/vim-go'
Plugin 'smerrill/vcl-vim-plugin'
Plugin 'rodjek/vim-puppet'
Plugin 'rust-lang/rust.vim'
Plugin 'rhysd/vim-crystal'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Finish loading Vundle
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap and history
set noswapfile
set nobackup
set nowb
set history=1000
set undolevels=1000

""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
syntax on                                         " highlight syntax
set hidden                                        " support hidden buffers
set ttyfast
set backspace=indent,eol,start                    " fix backspace behavior
set modeline                                      " set vi mode using last lines in files
set modelines=3                                   " look for modeline in last 3 lines
set scrolloff=4                                   " scroll offset
set noerrorbells

""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual stuff
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
highlight SignColum ctermbg=8
set title
set ruler
set number                                        " show numbers
set showcmd
set ls=2                                          " always show status line
set shortmess=atI

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
set autoindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set textwidth=79
set colorcolumn=80

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
set incsearch
set hls

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
set wildchar=<Tab> wildmenu wildmode=full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set tags+=gems.tags " ruby gems ctags

""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
set pastetoggle=<F2>

" Navigate between split windows with arrows
nnoremap <Right> <ESC><C-w>l
nnoremap <Left> <ESC><C-w>h
nnoremap <Up> <ESC><C-w>k
noremap <Down> <ESC><C-w>j
