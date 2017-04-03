#!/bin/bash

#TODO get -u opt for uninstall/clean up

home="test" #$HOME
if [ ! -d $home ]; then
  mkdir $home
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

for dotfile in "$DIR"*
do
  if [ -f $dotfile ]; then
    if [ -f $home/$dotfile ]; then
      #make backup
	mv $home/$dotfile $home/$dotfile.pre-chip
    fi
  echo "copying $dotfile..."
  cp $dotfile $home/
  fi
done




