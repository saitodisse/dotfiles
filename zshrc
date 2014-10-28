export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="muse"

# DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"

plugins=(git rbates history-substring-search zsh-syntax-highlighting)

export PATH="/usr/local/bin:$PATH"
export EDITOR='subl'

source $ZSH/oh-my-zsh.sh
export PATH="$HOME/_git/azk/bin:$PATH"
