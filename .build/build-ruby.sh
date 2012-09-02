#!/bin/bash
if [ "$UID" != "0" ]; then
  sudo $0
fi

cd ruby
autoconf && ./configure
sudo make && sudo make install
make clean && git clean -fd && git reset --hard
