#!/bin/bash

ln -sv ~/.dotfiles/.bashrc ~
ln -sv ~/.dotfiles/.vimrc ~
ln -sv ~/.dotfiles/.tmux.conf ~

# install vim-plug
# https://github.com/junegunn/vim-plug/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
