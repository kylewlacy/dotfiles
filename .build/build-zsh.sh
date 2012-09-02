#!/bin/bash
if [ "$UID" != "0" ]; then
  sudo $0
fi

# cd zsh
# ./Util/preconfig && ./configure
# make && make install
# make clean && git clean -fd && git checkout --
if [[ "$SHELL" != *zsh* ]]; then
  if [ -f "$(which zsh)" ]; then
    zsh="$(which zsh)"
  elif [ -f "$(whereis zsh | awk '{print $2}')" ]; then
    zsh="$(whereis zsh | awk '{print $2}')"
  fi

  if [ -f "$zsh" ]; then
    if [ -f /etc/shells ]; then
      # TODO: Clean up this `if; then; else` mess
      if grep -q zsh /etc/shells; then
        echo "" > /dev/null
      else
        echo "$zsh" >> /etc/shells
      fi
    fi

    chsh -s "$zsh" $USER
  fi
fi
