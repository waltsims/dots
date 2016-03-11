source ~/antigen/antigen.zsh 

# Load the oh-my-zsh's library.
 antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).
 antigen bundle git
 antigen bundle heroku
 antigen bundle pip
 antigen bundle lein
 antigen bundle command-not-found
#
# # Syntax highlighting bundle.
 antigen bundle zsh-users/zsh-syntax-highlighting
#
# # Load the theme.
 antigen theme steeef

## Tell antigen that you're done.
 antigen apply


#source ~/.git-completion.bash
#export codes for mpi
export PATH="$PATH:/home/$USER/.openmpi/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/$USER/.openmpi/lib/"
export PATH="$PATH:/home/$USER/ParaView-4.4.0/bin"
export PATH="$PATH:/home/$USER/petsc-3.5.4/bin"
export PETSC_DIR=/home/$USER/petsc-3.5.4
export PETSC_ARCH=arch-linux2-c-debug
#export PATH"$PATH:/home/$USER/clion-1.2.1/bin"

alias supermuc='bash ~/Desktop/POS.sh'
alias cluster='bash ~/Desktop/tfs.sh'
alias octave='octave --no-gui'
