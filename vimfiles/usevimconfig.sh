#!/usr/bin/env bash

echo "Copying Vim dotfiles..."
cp .vimrc $HOME
cp -R .vim/ $HOME
if [ $? -ne 0 ]; then
    echo >&2 "ERROR: Cannot copy Vim dotfiles!"
    exit 1
fi

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    if [ $? -ne 0 ]; then
        echo >&2 "ERROR: Cannot download vim-plug!"
        exit 1
    fi
    mkdir -p $HOME/.vim/autoload
    mv plug.vim $HOME/.vim/autoload
fi

echo "Installing plugins..."
vim +PlugInstall +qall
if [ $? -ne 0 ]; then
    echo >&2 "Error: Cannot install plugins!"
    exit 1
fi

echo "You are currently using... 1:Vim 2:Nvim"
read choice
case $choice in
    1)
        echo "Success!"
        ;;
    2)
        echo "Linking the Vim configuration so Nvim can use it..."
        ln -s $HOME/.vim $HOME/.config/nvim
        ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
        mv coc-settings.json $HOME/.config/nvim/coc-settings.json
        echo "Success!"
        ;;
    *) echo >&2 "ERROR: Invalid option!";;
esac
