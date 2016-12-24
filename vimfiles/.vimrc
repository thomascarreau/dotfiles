" MY VIMRC
" ========
"
" Author:       Thomas Carreau [https://github.com/thomascarreau]
" Source:       https://github.com/thomascarreau/myfiles
"
" Inspired by Chris Toomey [https://github.com/christoomey].
" See all of my vimrc style configurations in ~/.vim/rcfiles.
" Plugin manager: vim-plug [https://github.com/VundleVim/Vundle.vim]
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

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
if has('nvim')
    Plug 'neomake/neomake'
else
    Plug 'vim-syntastic/syntastic'
endif

call plug#end()

call s:SourceConfigFilesIn('rcfiles')
