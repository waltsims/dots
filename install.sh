#!/usr/bin/env bash

# Get directory of dots executable
DOTS_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTS_HOME="$DOTS_ROOT/home/"
DOTS_BACKUP="/home/$USER/.bakup_dots/"

echo $DOTS_ROOT
echo $DOTS_HOME
echo $DOTS_BACKUP

LOG=dots.log


function install_deps() {

# TODO: install linters as well <12-17-17, walter> #
# TODO: make list of packages

# Install dependencies 
unameOut="$(uname -s)"
case ${unameOut} in
    Linux*)	
        echo "installing on Ubuntu machine" >> $LOG
        echo "enter password to install cmake and python";
        sudo apt-get install vim tmux exuberant-ctags zsh git python3-dev build-essential cmake tldr;;
    Darwin*)	
        echo "installing on Macintosh machine";;
esac

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}


function movein() {
    # itterate through dotfiles
    for f in "$DOTS_HOME".*;
    do
        f=~/"$(basename $f)" # can this be simplified?
        if [[ -a $f || -L $f ]]; then
            # Make backup directory (only needs to happen once)
            [[ -d $DOTS_BACKUP ]] || mkdir $DOTS_BACKUP
            # Move current dot files to backup
            mv $f "$DOTS_BACKUP$(basename $f)"
        fi
        echo "linking '$f'"
        # Link dot files to home directory
        ln -s "$DOTS_HOME$(basename $f)" $f
    done

     # Append bashrc w/ ap.bash
     [[  -f ~/.bashrc ]] && cat "$DOTS_ROOT/ap.bash" >> ~/.bashrc
     [[  -f ~/.bash_profile ]] && cat "$DOTS_ROOT/ap.bash" >> ~/.bash_profile 

    # Install all plugins
    vim +PlugInstall +qall
}

function moveout() {
    # Remove bashrc w/ ap.bash
    if [[ -f ~/.bashrc ]]; then
        # search file for all lines EXCEPT ap.bash
        grep -Fvxf "$DOTS_ROOT/ap.bash" ~/.bashrc > tmp.txt
        mv tmp.txt ~/.bashrc
    else 
        if [[  -f ~/.bash_profile ]]; then
            grep -Fvxf $DOTS_ROOT/ap.bash ~/.bash_profile > tmp.txt
            mv tmp.txt ~/.bashrc
        fi
        rm tmp.txt
        fi

        for dotfile in "$DOTS_HOME""."*
        do
            if [[  -f ~/$dotfile ]]; then
                rm ~"/$dotfile"
                if [[ -r ~"/pre-chip/$dotfile" ]]; then 
                    echo "moving backups back to home" >> $DOTS_LOG
                    mv ~"/pre-chip/$dotfile" ~
                fi
                fi
            done

            if [[ -d ${HOME}/pre-chip/ ]]; then
                echo "Removing ~/pre-chip/ back-up directory" >> $DOTS_LOG
                rm -ir "${HOME}/pre-chip/"
            fi

     # uninstall_deps
     rm -ri ~/.oh-my-zsh

 }


### Main
# TODO get -u opt for uninstall/clean up
if [[  "$1" = "uninstall" ]]; then
    echo "Uninstalling Chip's dots"
    moveout
elif [[  "$1" = "install" || "$1" ]]; then
    echo "Installing Chip's dots"
    install_deps
    movein
else
    echo "no option recognized"
fi

# interactive=
# filename=~/sysinfo_page.html
# 
# while [ "$1" != "" ]; do
#     case $1 in
#         -f | --file )           shift
#                                 filename=$1
#                                 ;;
#         -i | --interactive )    interactive=1
    #                                 ;;
#         -h | --help )           usage
    #                                 exit
    #                                 ;;
#         * )                     usage
    #                                 exit 1
    #     esac
    #     shift
    # done
    # 
