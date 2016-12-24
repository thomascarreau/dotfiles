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
# If you can't install curl...
# wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# mkdir -p ~/.vim/autoload
# mv plug.vim ~/.vim/autoload

echo "Installing plugins..."
vim +PlugInstall +qall
if [ $? -ne 0 ]; then
    echo >&2 "ERROR!"
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
        mkdir ~/.config
        ln -s ~/.vim ~/.config/nvim
        ln -s ~/.vimrc ~/.config/nvim/init.vim
        echo "Success!"
        ;;
    *) echo >&2 "Invalid option!";;
esac
