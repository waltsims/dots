#!/bin/bash

#TODO get -u opt for uninstall/clean up

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR
echo $HOME


#install vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# install all plugins
vim +PlugInstall +qall

# Install dependencies and Compile YCM
unameOut="$(uname -s)"
case ${unameOut} in
	Linux*)	
		echo "enter password to install cmake and python"
		sudo apt-get install build-essential cmake;
		sudo apt-get install python-dev python3-dev;
		echo "installing on Ubuntu machine";;
	Darwin*)	
		echo "installing on Macintosh machine";;
esac

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
		

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


