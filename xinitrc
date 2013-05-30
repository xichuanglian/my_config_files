#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -d -x

# turn beep off
/usr/bin/xset b off

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xcompmgr &
bash ~/.config/random_wallpaper.sh &
nvidia-settings -l &
# swap ctrl and capslock
# setxkbmap -option ctrl:swapcaps &
exec i3
