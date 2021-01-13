dotfiles
========

Here is the collection of my dotfiles.

Vim
---

To use my Vim/Neovim configuration:

    cd vimfiles
    sh usevimconfig.sh

tmux
----

To use my tmux configuration:

    cd tmuxfiles
    cp .tmux.conf $HOME

This configuration file is compatible with tmux 2.6. Some of the tmux commands 
may be invalid if a newer (or older) version is used, although minor changes 
may be sufficient for the configuration to work properly. 
In order to make the Vim colorscheme working inside tmux sessions, tmux should 
be executed as `tmux -2`.

Git
---

To use my Git configuration:

    cd gitfiles
    cp .gitconfig $HOME
