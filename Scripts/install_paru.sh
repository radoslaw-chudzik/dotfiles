#!/bin/sh

# Install paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -Rf paru
