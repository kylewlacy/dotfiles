#!/bin/bash
cd git
# TODO: Check if this line is dependent on autoconf and automake (from brew)
make configure && ./configure
make && make install
make clean && git clean -fd && git checkout --
