#!/usr/bin/bash

echo "Copying VIM dotfiles..."
cp .vimrc ~
cp -R .vim/ ~
if [ $? -ne 0 ]; then
    echo >&2 "ERROR!"
    exit 1
fi

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [ $? -ne 0 ]; then
    echo >&2 "ERROR!"
    exit 1
fi

echo "Installing plugins..."
vim +PluginInstall +qall
if [ $? -ne 0 ]; then
    echo >&2 "ERROR!"
    exit 1
fi

echo "Success!"
