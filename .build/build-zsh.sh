#!/bin/bash
VERSION=4.3.17
curl http://sourceforge.net/projects/zsh/files/zsh-dev/4.3.17/zsh-4.3.17.tar.gz/download -L -o zsh.tar.gz
tar -zxvf zsh.tar.gz
cd "zsh-$VERSION"
./Util/preconfig && ./configure
make && make install
chsh -s /bin/zsh
