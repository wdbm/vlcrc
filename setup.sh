#!/bin/bash
echo "set up VLC rc"
#wget --content-disposition -N -P ~/.config/vlc https://raw.githubusercontent.com/wdbm/vlcrc/master/vlcrc
cp vlcrc ~/.config/vlc/
echo "set up VLC extensions"
mkdir -p ~/.local/share/vlc/lua/extensions
#wget --content-disposition -N -P ~/.local/share/vlc/lua/extensions/ https://raw.githubusercontent.com/wdbm/vlcrc/master/ppsc.lua
cp ppsc.lua ~/.local/share/vlc/lua/extensions/
