#!/bin/bash
if [ "$UID" != "0" ]; then
  sudo $0
fi

cd git
# TODO: Check if this line is dependent on autoconf and automake (from brew)
make configure && ./configure
make && make install
make clean && git clean -fd && git checkout --
