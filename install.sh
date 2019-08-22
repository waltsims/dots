#!/bin/bash

# TODO get -u opt for uninstall/clean up

# TODO:  install linters as well <12-17-17, walter> #
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR
echo $HOME


# Install dependencies and Compile YCM
unameOut="$(uname -s)"
case ${unameOut} in
	Linux*)	
		echo "installing on Ubuntu machine";
		echo "enter password to install cmake and python";
		sudo apt-get install vim tmux exuberant-ctags zsh git python3-dev build-essential cmake;;
	Darwin*)	
		echo "installing on Macintosh machine";;
esac

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install antigen
GIT="$HOME/git"
mkdir -p GIT

# Install all plugins
vim +PlugInstall +qall

cd ~/.vim/bundle/YouCompleteMe
python3 install.py 
		

for dotfile in "$DIR"/home/"."*
do
  if [ -f $dotfile ]; then
    if [ -f $HOME/$dotfile ]; then
        #make backup
	mv $HOME/$dotfile $HOME/$dotfile.pre-chip
    fi
  echo "linking $dotfile..."
  ln -s $DIR/home/$(basename $dotfile) $HOME/
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


