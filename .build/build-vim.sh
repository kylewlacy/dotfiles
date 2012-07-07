#!/bin/bash
breakindent=../patches/vim/breakindent/breakindent.patch
options="--with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope"

cd vim && patch -p1 < $breakindent
cd src
./configure $options
make && make install && make clean
cd ..
patch -R -p1 < $breakindent && git clean -fd && git checkout --
cd ..

if [[ "$OSTYPE" == darwin* ]]; then
  zipfile=http://fc02.deviantart.net/fs70/f/2012/127/6/2/vim_icon_by_1024jp-d4xjn3w.zip
  cd macvim && patch -p1 < $breakindent
  cd src
  curl -o tmp.zip "$zipfile" && unzip tmp.zip VimIcon/MacVim.icns -d tmp && cp tmp/VimIcon/MacVim.icns MacVim/icons/MacVim.icns && rm -r tmp/ tmp.zip
  ./configure $options
  make
  rm -r /Applications/MacVim.app
  cp -R  MacVim/build/Release/MacVim.app /Applications/MacVim.app
  make clean
  cd ..
  patch -R -p1 < $breakindent && git clean -fd && git reset --hard
fi
