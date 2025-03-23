#!/bin/sh

xrandr --output DP-0 --primary --mode 1920x1080 --rate 240.00
xrandr --output DP-2 --mode 1920x1080 --rate 60.00

setxkbmap -option caps:swapescape
xinput set-prop "Finalmouse UltralightX dongle Mouse" "libinput Accel Profile Enabled" 0 1 0
xset r rate 250 40

xinitdir=/etc/X11/xinit

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=$xinitdir/.Xresources
sysmodmap=$xinitdir/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    if [ -x /usr/bin/cpp ] ; then
        xrdb -merge $sysresources
    else
        xrdb -nocpp -merge $sysresources
    fi
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        xrdb -merge "$userresources"
    else
        xrdb -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d $xinitdir/xinitrc.d ] ; then
 for f in "$xinitdir/xinitrc.d"/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec i3
