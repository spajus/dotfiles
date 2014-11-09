" First things first
set nocompatible
filetype off

" Load Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My plugins
Plugin 'gmarik/Vundle.vim'

call vundle#end()

set ttyfast
set ruler
set number
set showcmd
set expandtab
set backspace=indent,eol,start
