#!/bin/bash
breakindent=../patches/vim/breakindent/breakindent.patch
cd vim && patch -p1 < $breakindent
cd src
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope
make && make install && make clean
cd ..
patch -R -p1 < $breakindent && git clean -fd && git checkout --
