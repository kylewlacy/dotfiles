#!/bin/bash
git clone git://github.com/b4winckler/vim.git
cd vim
git checkout ad56835
git clone git://gist.github.com/1677076.git breakindent
cd breakindent
git checkout cb8cdf
cd ..
patch -p1 < breakindent/breakindent.patch
cd src
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope
make
make install
cd ..
rm -rf ./vim
