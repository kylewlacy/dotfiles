#!/bin/bash
breakindent=../patches/vim/breakindent/breakindent.patch
options="--with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope"

if [[ "$OSTYPE" == darwin* ]]; then
  if [[ -z "$1" ]]; then
    mvim=../patches/vim/mvim/mvim.patch
    zipfile=http://fc02.deviantart.net/fs70/f/2012/127/6/2/vim_icon_by_1024jp-d4xjn3w.zip
    app=/Applications/MacVim.app
    usr=/usr/local/bin

    cd macvim && patch -p1 < $breakindent && patch src/MacVim/mvim < $mvim
    cd src
    curl -o tmp.zip "$zipfile" && unzip tmp.zip VimIcon/MacVim.icns -d tmp
    cp -fv tmp/VimIcon/MacVim.icns MacVim/icons/MacVim.icns
    rm -r tmp/ tmp.zip
    ./configure $options
    make
    sudo rm -r "$app"
    cp -Rf MacVim/build/Release/MacVim.app "$app"
    sudo mv -f MacVim/mvim "$usr"
    make clean
    cd ..
    git clean -fd && git reset --hard
  fi
fi

# TODO: Fix building CLI Vim in OS X with Ruby support
if [[ "$1" == --vim ]]; then
  cd vim && patch -p1 < $breakindent
  cd src
  ./configure $options
  sudo make && sudo make install && make clean
  cd ..
  sudo git clean -fd && git reset --hard
  cd ..
fi
