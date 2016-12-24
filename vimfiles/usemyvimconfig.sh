#!/usr/bin/bash

echo "Copying VIM dotfiles..."
cp .vimrc ~
cp -R .vim/ ~
if [ $? -ne 0 ]; then
    echo >&2 "ERROR!"
    exit 1
fi

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then
    echo >&2 "ERROR!"
    exit 1
fi

echo "Installing plugins..."
vim +PlugInstall +qall
if [ $? -ne 0 ]; then
    echo >&2 "ERROR!"
    exit 1
fi

echo "Success!"
