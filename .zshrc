source /usr/local/share/antigen/antigen.zsh
export ZSH=/Users/waltersimson/.oh-my-zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle tmux

antigen theme crunch

ZSH_THEME="robbyrussel"
DEFAULT_USER="chip"

antigen apply

