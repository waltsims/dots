#!/bin/bash

#TODO get -u opt for uninstall/clean up

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR
echo $HOME


# Install dependencies and Compile YCM
unameOut="$(uname -s)"
case ${unameOut} in
	Linux*)	
		echo "installing on Ubuntu machine";
		echo "enter password to install cmake and python";
		sudo apt-get install vim tmux exuberant-ctags zsh git bash-completion python-dev python3-dev build-essential cmake;;
	Darwin*)	
		echo "installing on Macintosh machine";;
esac

#install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install all plugins
vim +PlugInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
		

for dotfile in "$DIR"/home/"."*
do
  if [ -f $dotfile ]; then
    if [ -f $HOME/$dotfile ]; then
        #make backup
	mv $HOME/$dotfile $HOME/$dotfile.pre-chip
    fi
  echo "copying $dotfile..."
  cp $DIR/home/$(basename $dotfile) $HOME/
  fi
done

 # Append bashrc w/ ap.bash
 if [ -f $HOME/.bashrc ]; then
     cat $DIR/ap.bash >> $HOME/.bashrc
 else 
 	if [ -f $HOME/.bash_profile ]; then
 	cat $DIR/ap.bash >> $HOME/.bash_profile 
   fi
 fi


