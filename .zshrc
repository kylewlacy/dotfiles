export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
[[ -s "/Users/kyle/.rvm/scripts/rvm" ]] && source "/Users/kyle/.rvm/scripts/rvm"

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM="~/.zsh"
plugins=(git ruby osx lol nyan vi-mode)
ZSH_THEME="dpoggi"
source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_TITLE="true"
bindkey -v
set -o vi
