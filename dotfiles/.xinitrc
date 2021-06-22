#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1

if [ "$(tty)" = "/dev/tty1" ]; then
  #sxhkd -c ~/.config/qtile/qt-sxhkdrc &
  #qtile
  sxhkd &
  dunst &
  dwm
fi
