#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set's the keyboard to GB
setxkbmap gb & 

# Set's the monitors resolution and refresh rate (Hz)
xrandr --ouptut DP-4 --mode 3840x1080 --rate 120 &

# Set's the systembell to something other than the PC Speaker
pactl upload-sample /usr/share/sounds/freedesktop/stereo/bell.oga x11-bell &
pactl load-module module-x11-bell sample=x11-bell display=$DISPLAY &

# Allows USB automounting because CBA to set up rules LMAO
udiskie &

# Allows bluetooth media devices to interact with the system
# AKA allows the media controls to pause,etc...
mpris-proxy &

# Launches BSPWM (Window Manager)
exec bspwm  
