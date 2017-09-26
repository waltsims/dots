#!/bin/bash

#TODO get -u opt for uninstall/clean up
#TODO install vim packages

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR
echo $HOME


#install vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# install all plugins
vim +VundleInstall +qall

for dotfile in "$DIR"/"."*
do
  if [ -f $dotfile ]; then
    if [ -f $HOME/$dotfile ]; then
        #make backup
	mv $HOME/$dotfile $HOME/$dotfile.pre-chip
    fi
  echo "copying $dotfile..."
  cp $DIR/$(basename $dotfile) $HOME/
  fi
done

if [ -f $HOME/.bashrc ]; then
	$DIR/ap.bash >> $HOME/.bashrc
else 
	if [ -f $HOME/.bash_profile ]; then
	$DIR/ap.bash >> $HOME/.bash_profile 
  fi
fi
#TODO append bashrc w/ ap.bash


