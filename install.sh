#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm ~/.vim -rf
cp -r $DIR/vim        ~/.vim
ln -sf $DIR/vimrc     ~/.vimrc
ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/railsrc   ~/.railsrc
ln -sf $DIR/gemrc     ~/.gemrc
ln -sf $DIR/gitconfig ~/.gitconfig
ln -sf $DIR/solarized ~/.solarized
ln -sf $DIR/bashrc    ~/.bashrc

echo "DONE"

