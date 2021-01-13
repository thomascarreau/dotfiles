" MY VIMRC
" ========
"
" Author:       Thomas Carreau [https://github.com/thomascarreau]
" Source:       https://github.com/thomascarreau/dotfiles
"
" Inspired by Chris Toomey [https://github.com/christoomey].
" See all of my vimrc style configurations in ~/.vim/rcfiles.
" Plugin manager: vim-plug [https://github.com/junegunn/vim-plug]
" ----------------------------------------------------------------

let mapleader = "\<Space>"

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
Plug 'neomake/neomake'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-clang-format'

call plug#end()

call s:SourceConfigFilesIn('rcfiles')
