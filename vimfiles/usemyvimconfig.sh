#!/usr/bin/bash

echo "Copying Vim dotfiles..."
cp .vimrc ~
cp -R .vim/ ~
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
    mkdir -p ~/.vim/autoload
    mv plug.vim ~/.vim/autoload
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
        ln -s ~/.vim ~/.config/nvim
        ln -s ~/.vimrc ~/.config/nvim/init.vim
        echo "Success!"
        ;;
    *) echo >&2 "ERROR: Invalid option!";;
esac
