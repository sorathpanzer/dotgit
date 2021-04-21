#!/bin/sh

if [ "$(tty)" = "/dev/tty1" ]; then
  #sxhkd -c ~/.config/qtile/qt-sxhkdrc &
  #qtile
  sxhkd &
  dunst &
  dwm
fi
