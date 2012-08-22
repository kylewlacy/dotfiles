export PATH="/usr/local/bin:$PATH:/usr/local/sbin"

export DISABLE_AUTO_UDPATE=true
export EDITOR="mvim -v"
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh
plugins=(git ruby osx lol nyan vi-mode)
ZSH_THEME="twilight"
source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_TITLE="true"
bindkey -v
set -o vi

bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line
bindkey "^?" backward-delete-char

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

mvim=/usr/local/bin/mvim
if [ -f $mvim ]; then
  alias vim="$mvim -v"
  alias vimdiff="$mvim -v -d"
  alias mvim="$mvim --remote-tab-silent"
fi
alias less="less -FXRS"
