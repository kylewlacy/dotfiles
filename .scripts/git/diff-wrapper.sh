#!/bin/bash

if [[ "$OSTYPE" == darwin* ]]; then
  if [[ `mvim --serverlist` = "VIM" ]]; then
    mvim -d "$2" "$5"
  else
    mvim -v -d "$2" "$5"
  fi
else
  vimdiff "$2" "$5"
fi
