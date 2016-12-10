" MY VIMRC
" ========
"
" Author:       Thomas Carreau [https://github.com/thomascarreau]
" Source:       https://github.com/thomascarreau/myfiles
"
" Inspired by Chris Toomey [https://github.com/christoomey].
" See all of my vimrc style configurations in ~/.vim/rcfiles.
" Plugin manager: Vundle [https://github.com/VundleVim/Vundle.vim]
" ----------------------------------------------------------------


let mapleader = ","

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
        execute 'source' config_file
    endif
  endfor
endfunction


set nocompatible " required!
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()

filetype plugin indent on " required!
syntax on

call s:SourceConfigFilesIn('rcfiles')
