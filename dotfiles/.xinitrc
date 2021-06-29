#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1

if [ "$(tty)" = "/dev/tty1" ]; then
  dunst &
  dwm
fi
