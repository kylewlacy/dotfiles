#!/bin/bash
rm -rf ./git
git clone git://github.com/git/git.git
cp git/contrib/completion/git-completion.bash ../.scripts/bash/
cd git
# TODO: Check if this line is dependent on autoconf and automake (from brew)
make configure && ./configure
make && make install
