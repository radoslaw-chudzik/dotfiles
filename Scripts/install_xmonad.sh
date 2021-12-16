#!/bin/sh

# Install dependencies
paru -S xorg-server xorg-apps xorg-xinit xorg-xmessage \
> libx11 libxft libxinerama libxrandr libxss

mkdir -p ~/.config/xmonad && cd ~/.config/xmonad

# Download XMonad sources
git clone "https://github.com/xmonad/xmonad" xmonad-git
git clone "https://github.com/xmonad/xmonad-contrib" xmonad-contrib-git

# Download Xmobar sources
# git clone "https://github.com/jaor/xmobar" xmobar-git

# Add .desktop file for Lightdm or sddm 
sudo mkdir /usr/share/xsessions
cat > /usr/share/xsessions/xmonad.desktop << EOL
line 1, [Desktop Entry]
line 2, Version=1.0
line 3, Type=Application
line 4, Name=Xmonad
line 5, Comment=Lightweight X11 tiled window manager written in Haskell
line 6, Exec=xmonad
line 7, Icon=xmonad
line 8, Terminal=false
line 9, StartupNotify=false
line 10, Categories=Application;
EOL

# Install stack 
paru -S stack

# Install xmonad
cd ~/.config/xmonad
stack init
stack install
