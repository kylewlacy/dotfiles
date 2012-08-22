#!/bin/bash
cd ruby
autoconf && ./configure
sudo make && sudo make install
make clean && git clean -fd && git reset --hard
