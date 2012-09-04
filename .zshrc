export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
if [[ "$OSTYPE" == darwin* && -f "/etc/zshenv" && ! -f "/etc/zprofile" ]]; then
  # This fixes ZSH paths for MacVim
  # From http://stackoverflow.com/a/7382033/1311454
  sudo mv "/etc/zshenv" "/etc/zprofile"
fi

if [ -f "$HOME/.certs/cacert.pem" ]; then
  export GIT_SSL_CAINFO="$HOME/.certs/cacert.pem"
fi
export GNUPGHOME=$(readlink "$HOME/.gnupg")
export DISABLE_AUTO_UDPATE=true
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh
plugins=(git ruby osx lol nyan vi-mode)
ZSH_THEME="twilight"
source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_TITLE="true"
bindkey -v
set -o vi

setopt hist_ignore_all_dups

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

  export EDITOR="mvim -v"
else
  export EDITOR="vim"
fi
if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
  temp="/sys/class/thermal/thermal_zone0/temp"
elif [ -f "/proc/acpi/thermal_zone/THRM/temperature" ]; then
  temp="/proc/acpi/thermal_zone/THRM/temperature"
fi

if [ -n "$temp" ]; then
  alias temp="echo \"$(cat /sys/class/thermal/thermal_zone0/temp | sed 's/.\{3\}$//') *C\""
fi
alias less="less -FXRS"