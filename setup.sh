#!/bin/bash

for FILE in .bashrc .vimrc .tmux.conf
do
  if [ -f ~/$FILE ]; then
    mv ~/$FILE ~/$FILE.old
    echo "Existing $FILE has been moved to $FILE.old"
  fi
  ln -sv ~/.dotfiles/$FILE ~
done

echo Installing vim-plug...
# https://github.com/junegunn/vim-plug/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Installing vim plugins...
sleep .5
vim +PlugInstall +qall
