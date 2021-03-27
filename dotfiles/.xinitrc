if [ "$(tty)" == "/dev/tty1" ]; then
  sxhkd &
  dwm
fi
