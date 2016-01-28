#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm ~/.vim -rf
cp -r $DIR/vim        ~/.vim
ln -sf $DIR/vimrc     ~/.vimrc

# SPF13 stuff
ln -sf $DIR/vimrc.local.spf13     ~/.vimrc.local
ln -sf $DIR/vimrc.before.local.spf13     ~/.vimrc.before.local
ln -sf $DIR/vimrc.bundles.local.spf13     ~/.vimrc.bundles.local

ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/railsrc   ~/.railsrc
ln -sf $DIR/gemrc     ~/.gemrc
ln -sf $DIR/gitconfig ~/.gitconfig
ln -sf $DIR/solarized ~/.solarized
ln -sf $DIR/bashrc    ~/.bashrc

echo "DONE"

