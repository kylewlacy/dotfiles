#!/bin/bash
cd zsh
./Util/preconfig && ./configure
make && make install
make clean && git clean -fd && git checkout --
chsh -s /bin/zsh
