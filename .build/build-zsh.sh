#!/bin/bash
cd zsh
./Util/preconfig && ./configure
make && make install
make clean && git clean -fd && git checkout --
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi
