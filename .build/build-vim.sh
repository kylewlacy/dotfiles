#!/bin/bash
breakindent=../patches/vim/breakindent/breakindent.patch
options="--with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope"

if [[ "$OSTYPE" == darwin* ]]; then
  mvim=../patches/vim/mvim/mvim.patch
  zipfile=http://fc02.deviantart.net/fs70/f/2012/127/6/2/vim_icon_by_1024jp-d4xjn3w.zip
  app=/Applications/MacVim.app
  usr=/usr/local/bin

  cd macvim && patch -p1 < $breakindent && patch src/MacVim/mvim < $mvim
  cd src
  curl -o tmp.zip "$zipfile" && unzip tmp.zip VimIcon/MacVim.icns -d tmp && cp tmp/VimIcon/MacVim.icns MacVim/icons/MacVim.icns && rm -r tmp/ tmp.zip
  ./configure $options
  make
  rm -r "$app"
  cp -R MacVim/build/Release/MacVim.app "$app"
  mv MacVim/mvim "$usr"
  make clean
  cd ..
  git clean -fd && git reset --hard
fi 
  
if [[ "$1" == --vim ]]; then
  cd vim && patch -p1 < $breakindent
  cd src
  ./configure $options
  make && make install && make clean
  cd ..
  git clean -fd && git reset --hard
  cd ..
fi
