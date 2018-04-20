#!/bin/sh
ln -s $CWD/.vimrc ~/.vimrc
ln -s $CWD/.vim ~/.vim
mkdir -p ~/.config
ln -s $CWD/.config/fish ~/.config/fish
ln -s $CWD/.config/base16-shell/ ~/.config/base16-shell
ln -s $CWD/Code/User ~/Library/Application\ Support/Code/User
