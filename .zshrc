export PATH="$HOME/.gem/ruby/1.9.1/bin:/usr/local/bin:$PATH:/usr/local/sbin:/sbin"
if [[ "$OSTYPE" == darwin* && -f "/etc/zshenv" && ! -f "/etc/zprofile" ]]; then
  # This fixes ZSH paths for MacVim
  # From http://stackoverflow.com/a/7382033/1311454
  sudo mv "/etc/zshenv" "/etc/zprofile"
fi

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh
ZSH_THEME="twilight"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UDPATE="true"

plugins=(git ruby osx lol nyan vi-mode)

source $ZSH/oh-my-zsh.sh

if [ -f "$HOME/.certs/cacert.pem" ]; then
  export GIT_SSL_CAINFO="$HOME/.certs/cacert.pem"
fi
export GNUPGHOME="$(readlink "$HOME/.gnupg")"

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

alias sgit="sudo -s git"
alias less="less -FXRS"
