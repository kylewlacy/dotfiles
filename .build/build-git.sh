#!/bin/bash
rm -rf ./git
git clone git://github.com/git/git.git
cd git
cp contrib/completion/git-completion.bash ../../.scripts/bash/
# TODO: Check if this line is dependent on autoconf and automake (from brew)
make configure && ./configure
make && make install
