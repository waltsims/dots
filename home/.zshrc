source $HOME/git/antigen/antigen.zsh
export ZSH=$HOME/.oh-my-zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle tmux

antigen theme subnixr/minimal

ZSH_THEME="robbyrussel"
DEFAULT_USER="chip"

antigen apply

