#!/bin/bash
cd zsh
./Util/preconfig && ./configure
make && make install
make clean && git clean -fd && git checkout --
if [[ "$SHELL" != *zsh* ]]; then
  $location = $(whereis zsh)
  if [ -f "$location" ]; then
    chsh $location
  elif [ -f "$(echo $location | awk '{print $2}')" ]; then
    chsh $(echo $location | awk '{print $2}')
  else
    echo "Failed to change shell! You might need to change it manually..."
  fi
fi
